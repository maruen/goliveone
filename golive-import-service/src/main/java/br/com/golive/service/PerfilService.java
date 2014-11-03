package br.com.golive.service;

import java.util.List;

import javax.ejb.Local;

import br.com.golive.entity.perfilconfiguracao.model.ColunaPerfil;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.impl.PerfilServiceImpl;

@Local(PerfilServiceImpl.class)
public interface PerfilService {

	public List<ColunaPerfil> obterListaDeConfiguracoesPagina(final Usuario usuario, final String managedBeanName, final Class<?>... classes);

	public void salvarLista(final List<ColunaPerfil> colunaPerfil);

	public void salvar(final ColunaPerfil colunaPerfil);

	public void atualizarLista(final List<ColunaPerfil> colunas);

}
