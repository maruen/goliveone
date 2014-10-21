package br.com.golive.entity.usuario.repositorio;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.jpa.JpaGoLive;

public class UsuarioJpa extends JpaGoLive<Usuario, Long> {

	@Inject
	protected UsuarioJpa(final EntityManager entityManager) {
		super(entityManager);
	}

	public Usuario logar(final String userName) {
		final Criteria criteria = createNativeCriteria();
		criteria.add(Restrictions.eq("login", userName));
		return (Usuario) criteria.uniqueResult();
	}

}
