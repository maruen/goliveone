package br.com.golive.entity.perfil.usuario.repositorio;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.com.golive.entity.perfil.usuario.model.Usuario;
import br.com.golive.jpa.JpaGoLive;

public class UsuarioJpa extends JpaGoLive<Usuario, Long> {

	public Usuario logar(final String userName) {
		final Criteria criteria = createNativeCriteria();
		criteria.add(Restrictions.eq("EmailUser", userName));
		return (Usuario) criteria.uniqueResult();
	}

}
