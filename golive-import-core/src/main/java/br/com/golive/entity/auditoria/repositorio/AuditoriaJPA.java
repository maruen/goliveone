package br.com.golive.entity.auditoria.repositorio;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Query;
import javax.persistence.Table;
import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.criterion.Restrictions;

import br.com.golive.entity.Model;
import br.com.golive.entity.auditoria.model.AuditoriaItemModel;
import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.jpa.JpaGoLive;
import br.com.golive.utils.Utils;

public class AuditoriaJPA extends JpaGoLive<AuditoriaModel, Long> {

	public Model findOldById(final Model model) {
		Criteria criteria = createCriteria(model.getClass());
		criteria.add(Restrictions.eq("id", model.getId()));

		FetchType fetch;
		
		for (Field field : model.getClass().getDeclaredFields()) {
			fetch = returnAnnotationFetch(field);
			if(fetch != null){
				if(fetch.equals(FetchType.LAZY)){
					criteria.setFetchMode(field.getName(), FetchMode.EAGER);
				}
			}
		}
		
		return extractSingleResultByCriteria(criteria);

	}

	private FetchType returnAnnotationFetch(Field field) {
		if (field.isAnnotationPresent(OneToMany.class)) {
			return field.getAnnotation(OneToMany.class).fetch();
		} else if (field.isAnnotationPresent(ManyToOne.class)) {
			return field.getAnnotation(ManyToOne.class).fetch();
		} else if (field.isAnnotationPresent(OneToOne.class)) {
			return field.getAnnotation(OneToOne.class).fetch();
		} else if (field.isAnnotationPresent(ManyToMany.class)) {
			return field.getAnnotation(ManyToMany.class).fetch();
		}
		return null;
	}

	@Transactional
	public void saveJoins(final AuditoriaModel auditoria,
			final List<AuditoriaItemModel> auditoriaItemList,
			final Usuario usuario, final Model model) {

		final String tableName = model.getClass().getAnnotation(Table.class)
				.name();

		final StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO tbAuditoria_").append(tableName)
				.append(" VALUES (?,?,?,?)");

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

		final String tableName = model.getClass().getAnnotation(Table.class)
				.name();
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

		final String tableName = ((Table) clazz.getAnnotation(Table.class))
				.name();
		String sql = "SELECT tbAuditoria_Id FROM tbAuditoria_" + tableName
				+ " WHERE " + tableName + "_Id=" + id;

		Query query = createNativeQuery(sql);
		final List<Long> ids = query.getResultList();

		if ((ids != null) && (ids.size() > 0)) {
			sql = "SELECT auditoriaModel FROM AuditoriaModel auditoriaModel WHERE auditoriaModel.id IN ("
					+ Utils.explode(ids) + ")";
			query = createQuery(sql, AuditoriaModel.class);

			results = query.getResultList();
		}

		return results;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String getUsuarioLog(final Long id, final Class clazz) {
		Query query;

		final String tableName = ((Table) clazz.getAnnotation(Table.class))
				.name();

		final String sql = "SELECT tbUsuario_Id FROM tbAuditoria_" + tableName
				+ " WHERE " + tableName + "_Id=" + id;
		query = entityManager.createNativeQuery(sql);
		final Integer userId = (Integer) query.setMaxResults(1).getResultList()
				.get(0);

		query = entityManager.createQuery(
				"SELECT usuario FROM Usuario usuario WHERE usuario.id = :id",
				Usuario.class);
		query.setParameter("id", Long.valueOf(userId));
		try {
			final Usuario usuario = (Usuario) query.getSingleResult();
			return usuario.getLogin();
		} catch (final Exception exp) {
			return "";
		}
	}

}
