package br.com.golive.service;

import java.util.List;
import java.util.Map;

import javax.ejb.Local;

import br.com.golive.entity.perfilconfiguracao.model.ColunaPerfil;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.impl.PerfilServiceImpl;
import br.com.golive.navigation.component.KeyMapDataTableTemplate;

@Local(PerfilServiceImpl.class)
public interface PerfilService {

	public List<ColunaPerfil> obterListaDeConfiguracoesPagina(final Usuario usuario, final String managedBeanName, final Class<?>... classes);

	public void salvarLista(final List<ColunaPerfil> colunaPerfil);

	public void salvar(final ColunaPerfil colunaPerfil);

	public void atualizar(final ColunaPerfil colunaPerfil);

	public void atualizarLista(final List<ColunaPerfil> colunas);

	public void atualizarListas(Map<KeyMapDataTableTemplate, List<ColunaPerfil>> map);

}
