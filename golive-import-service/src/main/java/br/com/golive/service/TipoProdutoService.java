package br.com.golive.service;

import java.util.List;

import javax.ejb.Local;

import br.com.golive.entity.tipoproduto.model.TipoProdutoModel;
import br.com.golive.impl.TipoProdutoServiceImpl;

@Local(value = TipoProdutoServiceImpl.class)
public interface TipoProdutoService {

	public List<TipoProdutoModel> obterLista();

	public void salvar(TipoProdutoModel model);

	public void atualizar(TipoProdutoModel model);

	public void refresh(TipoProdutoModel model);

	public void remover(TipoProdutoModel model);
}