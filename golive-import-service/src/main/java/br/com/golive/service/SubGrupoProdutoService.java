package br.com.golive.service;

import java.util.List;

import javax.ejb.Local;

import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.impl.SubGrupoProdutoServiceImpl;

@Local(SubGrupoProdutoServiceImpl.class)
public interface SubGrupoProdutoService extends Service<SubGrupoProdutoModel> {

	public List<SubGrupoProdutoModel> listarPorFiltro(String... args);

	public List<SubGrupoProdutoModel> obterSubGrupoProdutoPorGrupo(GrupoProdutosModel model);

}
