package br.com.golive.service;

import javax.ejb.Local;

import br.com.golive.entity.finalidadecolecao.model.ProdutoFinalidadeColecaoModel;
import br.com.golive.impl.ProdutoFinalidadeColecaoServiceImpl;

@Local(value = ProdutoFinalidadeColecaoServiceImpl.class)
public interface ProdutoFinalidadeColecaoService extends Service<ProdutoFinalidadeColecaoModel> {

}