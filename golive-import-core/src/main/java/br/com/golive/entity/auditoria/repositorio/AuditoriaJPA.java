package br.com.golive.entity.auditoria.repositorio;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.Table;
import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Subqueries;

import br.com.golive.entity.Model;
import br.com.golive.entity.auditoria.model.AuditoriaItemModel;
import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.jpa.JpaGoLive;
import br.com.golive.utils.Utils;

public class AuditoriaJPA extends JpaGoLive<AuditoriaModel, Long> {

	@Transactional
	public void saveJoins(final AuditoriaModel auditoria, final List<AuditoriaItemModel> auditoriaItemList, final Usuario usuario, final Model model) {

		final String tableName = model.getClass().getAnnotation(Table.class).name();

		final StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO tbAuditoria_").append(tableName).append(" VALUES (?,?,?,?)");

		final Query query = createNativeQuery(sql.toString());

		for (final AuditoriaItemModel item : auditoriaItemList) {
			query.setParameter(1, auditoria.getId());
			query.setParameter(2, item.getId());
			query.setParameter(3, usuario.getId());
			query.setParameter(4, model.getId());
			query.executeUpdate();
		}
	}

	@Transactional
	public void deleteJoins(final Model model) {

		getEntityManager().joinTransaction();

		final String tableName = model.getClass().getAnnotation(Table.class).name();
		final StringBuffer sql = new StringBuffer();
		sql.append("DELETE FROM tbAuditoria_").append(tableName).append(" ");
		sql.append("WHERE ").append(tableName).append("_Id=?");

		final Query query = createNativeQuery(sql.toString());
		query.setParameter(1, model.getId());
		query.executeUpdate();

	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List getAuditoriaLogs(final Long id, final Class clazz) {
		List<AuditoriaModel> results = new ArrayList<AuditoriaModel>();

		String sql = "SELECT tbAuditoria_Id FROM tbAuditoria_" + ((Table) clazz.getAnnotation(Table.class)).name() + " WHERE " + ((Table) clazz.getAnnotation(Table.class)).name() + "_Id=" + id;
		Query query = createNativeQuery(sql);
		final List<Long> ids = query.getResultList();

		if ((ids != null) && (ids.size() > 0)) {
			sql = "SELECT auditoriaModel FROM AuditoriaModel auditoriaModel WHERE auditoriaModel.id IN (" + Utils.explode(ids) + ")";
			query = createQuery(sql, AuditoriaModel.class);

			results = query.getResultList();
		}
		return results;
	}

	public List<AuditoriaModel> getListModel(final Model model) {
		final DetachedCriteria subQuery = DetachedCriteria.forClass(model.getClass());
		subQuery.add(Restrictions.eq("id", model.getId()));
		subQuery.setFetchMode("auditoriaLogs", FetchMode.EAGER);
		subQuery.setProjection(Property.forName("auditoriaLogs"));
		final Criteria query = createNativeCriteria();
		query.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		query.add(Subqueries.propertyIn("id", subQuery));
		return extractListByCriteria(query);
	}

	@Override
	public EntityManager getEntityManager() {
		return entityManager;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String getUsuarioLog(final Long id, final Class clazz) {
		Query query;

		final String sql = "SELECT tbUsuario_Id FROM tbAuditoria_" + ((Table) clazz.getAnnotation(Table.class)).name() + " WHERE " + ((Table) clazz.getAnnotation(Table.class)).name() + "_Id=" + id;
		query = entityManager.createNativeQuery(sql);
		final Integer userId = (Integer) query.setMaxResults(1).getResultList().get(0);

		query = entityManager.createQuery("SELECT usuario FROM Usuario usuario WHERE usuario.id = :id", Usuario.class);
		query.setParameter("id", Long.valueOf(userId));
		try {
			final Usuario usuario = (Usuario) query.getSingleResult();
			return usuario.getLogin();
		} catch (final Exception exp) {
			return "";
		}
	}

}
