package br.com.golive.service;

import java.util.List;

import javax.ejb.Local;

import br.com.golive.entity.grupoprodutodepartamento.model.GrupoProdutoDepartamento;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.impl.GrupoProdutoServiceImpl;

@Local(value = GrupoProdutoServiceImpl.class)
public interface GrupoProdutoService {

	public List<GrupoProdutosModel> obterGrupoProdutos();

	public List<GrupoProdutoDepartamento> obterGrupoProdutoDepartamentos();

	public void salvarGrupoProdutoDepartamento(GrupoProdutoDepartamento grupoProdutoDepartamento);

	public void salvar(GrupoProdutosModel grupoProdutosModel);

}
