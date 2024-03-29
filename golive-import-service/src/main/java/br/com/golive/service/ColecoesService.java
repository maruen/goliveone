package br.com.golive.service;

import java.util.List;

import javax.ejb.Local;

import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.entity.empresas.empresa.model.Empresa;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.impl.ColecoesServiceImpl;

@Local(value = ColecoesServiceImpl.class)
public interface ColecoesService extends Service<ColecoesModel> {

	public List<ColecoesModel> obterListaPorSubGrupo(final Usuario usuario, final Empresa empresa, final SubGrupoProdutoModel model);

}
