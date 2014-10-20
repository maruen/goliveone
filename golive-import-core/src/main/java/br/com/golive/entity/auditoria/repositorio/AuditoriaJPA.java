package br.com.golive.entity.auditoria.repositorio;

import javax.persistence.Query;

import br.com.golive.annotation.QueryAuditoria;
import br.com.golive.entity.Model2;
import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.perfil.usuario.model.Usuario;
import br.com.golive.jpa.JpaGoLive;

public class AuditoriaJPA extends JpaGoLive<AuditoriaModel, Long> {

	public void executarQueryLigacao(final AuditoriaModel auditoria, final Usuario usuario, final Model2 entidade) {

		final Query query = createNativeQuery(entidade.getClass().getAnnotation(QueryAuditoria.class).query());
		query.setParameter(1, auditoria.getId());
		query.setParameter(2, 2L);
		query.setParameter(3, usuario.getId());
		query.setParameter(4, entidade.getId());
		query.executeUpdate();
	}

}
