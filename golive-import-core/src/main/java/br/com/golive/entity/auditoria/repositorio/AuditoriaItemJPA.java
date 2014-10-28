package br.com.golive.entity.auditoria.repositorio;

import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import br.com.golive.entity.auditoria.model.AuditoriaItemModel;
import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.jpa.JpaGoLive;

public class AuditoriaItemJPA extends JpaGoLive<AuditoriaItemModel, Long> {

	@Transactional
	public void saveJoins(AuditoriaModel auditoriaModel,
						  List<AuditoriaItemModel> auditoriaItemList,
						  Usuario usuario) {
		
		for (AuditoriaItemModel auditoriaItemModel : auditoriaItemList) {
			Query query = createNativeQuery("INSERT INTO tbAuditoriaItem_tbAuditoria VALUES (?,?,?)");
			query.setParameter(1, auditoriaModel.getId());
			query.setParameter(2, auditoriaItemModel.getId());
			query.setParameter(3, usuario.getId());
			query.executeUpdate();
		}
	}

}
