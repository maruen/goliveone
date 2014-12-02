package br.com.golive.service;

import javax.ejb.Local;

import br.com.golive.entity.tipoproduto.model.TipoProdutoModel;
import br.com.golive.impl.TipoProdutoServiceImpl;

@Local(value = TipoProdutoServiceImpl.class)
public interface TipoProdutoService extends Service<TipoProdutoModel> {

}