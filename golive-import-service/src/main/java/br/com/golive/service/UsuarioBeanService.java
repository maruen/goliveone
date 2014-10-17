package br.com.golive.service;

import javax.ejb.Local;

import br.com.golive.entity.perfil.usuario.model.Usuario;
import br.com.golive.impl.UsuarioBeanServiceImpl;

@Local(UsuarioBeanServiceImpl.class)
public interface UsuarioBeanService {

	public Usuario logar(final String username);

	@Deprecated
	public Usuario obterPorUserName(final String username);

}
