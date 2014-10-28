package br.com.golive.entity.auditoria.repositorio;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.Table;
import javax.transaction.Transactional;

import br.com.golive.entity.Model;
import br.com.golive.entity.auditoria.model.AuditoriaItemModel;
import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.jpa.JpaGoLive;
import br.com.golive.utils.Utils;

public class AuditoriaJPA extends JpaGoLive<AuditoriaModel, Long> {
	
	@Transactional
	public void saveJoins(AuditoriaModel auditoria,
						  List<AuditoriaItemModel> auditoriaItemList,
						  Usuario usuario,
						  Model model) {

		String tableName = ((Table) model.getClass().getAnnotation(Table.class)).name();
		
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO tbAuditoria_").append(tableName).append(" VALUES (?,?,?,?)");
		
		Query query = createNativeQuery(sql.toString());

		for (AuditoriaItemModel item : auditoriaItemList) {
			query.setParameter(1, auditoria.getId());
			query.setParameter(2, item.getId());
			query.setParameter(3, usuario.getId());
			query.setParameter(4, model.getId());
			query.executeUpdate();
		}
	}
	
	@Transactional
	public void deleteJoins(Model model) {

		getEntityManager().joinTransaction();
		
		String tableName = ((Table) model.getClass().getAnnotation(Table.class)).name();
		StringBuffer sql = new StringBuffer();
		sql.append("DELETE FROM tbAuditoria_").append(tableName).append(" ");
		sql.append("WHERE ").append(tableName).append("_Id=?");
		
		Query query = createNativeQuery(sql.toString());
		query.setParameter(1, model.getId());
		query.executeUpdate();
		
	}
	

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List getAuditoriaLogs(Long id, Class clazz) {
		List<AuditoriaModel> results = new ArrayList<AuditoriaModel>();

		String sql = "SELECT tbAuditoria_Id FROM tbAuditoria_" + ((Table) clazz.getAnnotation(Table.class)).name() + " WHERE " + ((Table) clazz.getAnnotation(Table.class)).name() + "_Id=" + id ;
		Query query = createNativeQuery(sql);
		final List<Long> ids = query.getResultList();

		if ((ids != null) && (ids.size() > 0)) {
			sql = "SELECT auditoriaModel FROM AuditoriaModel auditoriaModel WHERE auditoriaModel.id IN (" + Utils.explode(ids) + ")";
			query = createQuery(sql, AuditoriaModel.class);

			results = query.getResultList();
		}
		return results;
	}
	
	public EntityManager getEntityManager() {
		return entityManager;
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String getUsuarioLog(Long id, Class clazz) {
		Query query;

		String sql      = "SELECT tbUsuario_Id FROM tbAuditoria_" + ((Table) clazz.getAnnotation(Table.class)).name() + " WHERE " + ((Table) clazz.getAnnotation(Table.class)).name() + "_Id=" + id ;
		query           = entityManager.createNativeQuery(sql);
		Integer userId  = (Integer) query.setMaxResults(1).getResultList().get(0);

		query = entityManager.createQuery("SELECT usuario FROM Usuario usuario WHERE usuario.id = :id", Usuario.class);
		query.setParameter("id", Long.valueOf(userId));
		try {
			Usuario usuario = (Usuario) query.getSingleResult();
			return usuario.getLogin();
		} catch(Exception exp) {
			return "";
		}
	}
	
	
	

}
