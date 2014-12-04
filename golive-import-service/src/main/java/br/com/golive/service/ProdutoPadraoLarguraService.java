package br.com.golive.service;

import javax.ejb.Local;

import br.com.golive.entity.padraolargura.model.ProdutoPadraoLarguraModel;
import br.com.golive.impl.ProdutoFinalidadeCodigoBarrasServiceImpl;

@Local(value = ProdutoFinalidadeCodigoBarrasServiceImpl.class)
public interface ProdutoPadraoLarguraService extends Service<ProdutoPadraoLarguraModel> {


}