package br.com.golive.service;

import java.util.List;

import javax.ejb.Local;

import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.impl.ColecoesServiceImpl;

@Local(value = ColecoesServiceImpl.class)
public interface ColecoesService extends Service<ColecoesModel> {

	public List<ColecoesModel> obterListaWithLazys(final String... lazyFields);

	public List<ColecoesModel> obterListaPorSubGrupo(SubGrupoProdutoModel model);

}
