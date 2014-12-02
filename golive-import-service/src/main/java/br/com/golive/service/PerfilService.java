package br.com.golive.service;

import java.util.List;

import javax.ejb.Local;

import br.com.golive.entity.empresas.empresa.model.Empresa;
import br.com.golive.entity.perfilconfiguracao.model.ColunaPerfil;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.impl.PerfilServiceImpl;

@Local(PerfilServiceImpl.class)
public interface PerfilService {

	public List<ColunaPerfil> obterListaDeConfiguracoesPagina(final Usuario usuario, final Empresa empresa, final String managedBeanName, final List<Class<?>> classes);

	public void salvarLista(final Usuario usuario, final Empresa empresa, final List<ColunaPerfil> colunaPerfil);

	public void salvar(final Usuario usuario, final Empresa empresa, final ColunaPerfil colunaPerfil);

	public void atualizar(final Usuario usuario, final Empresa empresa, final ColunaPerfil colunaPerfil);

	public void atualizarLista(final Usuario usuario, final Empresa empresa, final List<ColunaPerfil> colunas);

}
