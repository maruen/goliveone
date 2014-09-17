package br.com.golive.service;

import javax.ejb.Local;

import br.com.golive.entity.Usuario;
import br.com.golive.impl.UsuarioBeanServiceImpl;

@Local(UsuarioBeanServiceImpl.class)
public interface UsuarioBeanService {

	public Usuario obterPorUserName(final String username);
	
}
