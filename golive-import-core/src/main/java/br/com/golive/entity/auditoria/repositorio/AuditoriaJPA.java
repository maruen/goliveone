package br.com.golive.entity.auditoria.repositorio;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.golive.annotation.QueryAuditoria;
import br.com.golive.entity.Model2;
import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.jpa.JpaGoLive;

public class AuditoriaJPA extends JpaGoLive<AuditoriaModel, Long> {
	@Inject
	protected AuditoriaJPA(final EntityManager entityManager) {
		super(entityManager);
		// TODO Auto-generated constructor stub
	}

	public void executarQueryLigacao(final AuditoriaModel auditoria, final Usuario usuario, final Model2 entidade) {

		final Query query = createNativeQuery(entidade.getClass().getAnnotation(QueryAuditoria.class).query());
		query.setParameter(1, auditoria.getId());
		query.setParameter(2, 2L);
		query.setParameter(3, usuario.getId());
		query.setParameter(4, entidade.getId());
		query.executeUpdate();
	}

}
