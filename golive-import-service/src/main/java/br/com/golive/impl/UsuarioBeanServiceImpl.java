package br.com.golive.impl;

import javax.ejb.Stateless;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.entity.empresas.empresa.repositorio.EmpresaJpa;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.entity.usuario.repositorio.UsuarioJpa;
import br.com.golive.service.UsuarioBeanService;

@Stateless
public class UsuarioBeanServiceImpl implements UsuarioBeanService {

	@Inject
	private Logger logger;

	@Inject
	private UsuarioJpa usuarioJpa;

	@Inject
	private EmpresaJpa empresaJpa;

	@Override
	public Usuario logar(final String username) {
		logger.info("Obtendo Usuario por Login = {}", username);
		final Usuario usuario = usuarioJpa.logar(username);

		if (usuario != null) {
			logger.info("Obtendo empresas do usuario {}", username);
			usuario.setEmpresas(empresaJpa.obterEmpresasUsuario(usuario));
		}
		return usuario;
	}

	@Override
	public Usuario findById(final Long id) {
		logger.info("Obtendo Usuario por id = {} ", id);
		return usuarioJpa.findByIdWithLazys(id);
	}
}
