package br.com.golive.service;

import javax.ejb.Local;

import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.impl.UsuarioBeanServiceImpl;

@Local(UsuarioBeanServiceImpl.class)
public interface UsuarioBeanService {

	public Usuario logar(final String username);

	public Usuario findById(final Long id);

}
