package br.com.golive.service;

import javax.ejb.Local;

import br.com.golive.entity.padraolargura.model.ProdutoPadraoLarguraModel;
import br.com.golive.impl.ProdutoPadraoLarguraServiceImpl;

@Local(value = ProdutoPadraoLarguraServiceImpl.class)
public interface ProdutoPadraoLarguraService extends Service<ProdutoPadraoLarguraModel> {

}