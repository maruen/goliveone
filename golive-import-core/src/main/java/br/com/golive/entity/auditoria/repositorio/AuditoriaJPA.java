package br.com.golive.entity.auditoria.repositorio;

import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import br.com.golive.annotation.QueryAuditoria;
import br.com.golive.entity.Model;
import br.com.golive.entity.auditoria.model.AuditoriaItemModel;
import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.perfil.usuario.model.Usuario;
import br.com.golive.jpa.JpaGoLive;

public class AuditoriaJPA extends JpaGoLive<AuditoriaModel, Long> {

	@Transactional 
	public void saveJoins(AuditoriaModel auditoria,
						  List<AuditoriaItemModel> auditoriaItemList,
						  Usuario usuario,
						  Model entidade) {
		
		Query query = createNativeQuery(entidade.getClass().getAnnotation(QueryAuditoria.class).query());
		
		for (AuditoriaItemModel item : auditoriaItemList) {
			query.setParameter(1, auditoria.getId());
			query.setParameter(2, item.getId());
			query.setParameter(3, usuario.getId());
			query.setParameter(4, entidade.getId());
			query.executeUpdate();
		}
	}

}
