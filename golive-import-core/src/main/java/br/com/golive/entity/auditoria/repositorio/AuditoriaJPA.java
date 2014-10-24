package br.com.golive.entity.auditoria.repositorio;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;
import javax.persistence.Table;
import javax.transaction.Transactional;

import br.com.golive.annotation.QueryAuditoria;
import br.com.golive.entity.Model;
import br.com.golive.entity.auditoria.model.AuditoriaItemModel;
import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.jpa.JpaGoLive;
import br.com.golive.utils.Utils;

public class AuditoriaJPA extends JpaGoLive<AuditoriaModel, Long> {

	@Transactional
	public void saveJoins(final AuditoriaModel auditoria, final List<AuditoriaItemModel> auditoriaItemList, final Usuario usuario, final Model entidade) {

		final Query query = createNativeQuery(entidade.getClass().getAnnotation(QueryAuditoria.class).query());

		for (final AuditoriaItemModel item : auditoriaItemList) {
			query.setParameter(1, auditoria.getId());
			query.setParameter(2, item.getId());
			query.setParameter(3, usuario.getId());
			query.setParameter(4, entidade.getId());
			query.executeUpdate();
		}
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List getAuditoriaLogs(final Class clazz) {
		List<AuditoriaModel> results = new ArrayList<AuditoriaModel>();

		String sql = "SELECT tbAuditoria_Id FROM tbAuditoria_" + ((Table) clazz.getAnnotation(Table.class)).name();
		Query query = createNativeQuery(sql);
		final List<Long> ids = query.getResultList();

		if ((ids != null) && (ids.size() > 0)) {
			sql = "SELECT auditoriaModel FROM AuditoriaModel auditoriaModel WHERE auditoriaModel.id IN (" + Utils.explode(ids) + ")";
			query = createQuery(sql, AuditoriaModel.class);

			results = query.getResultList();
		}
		return results;
	}

}
