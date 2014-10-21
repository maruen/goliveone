package br.com.golive.service;

import java.util.List;

import javax.ejb.Local;

import br.com.golive.entity.empresas.empresa.model.Empresa;
import br.com.golive.entity.perfilconfiguracao.model.ColunaPerfil;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.impl.PerfilServiceImpl;

@Local(PerfilServiceImpl.class)
public interface PerfilService {

	public List<ColunaPerfil> obterListaDeConfiguracoesPagina(final Usuario usuario, final Empresa empresa, final String tabela);

	public void salvar(final ColunaPerfil colunaPerfil);

}
