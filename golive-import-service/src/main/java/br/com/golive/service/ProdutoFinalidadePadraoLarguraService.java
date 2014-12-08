package br.com.golive.service;

import javax.ejb.Local;

import br.com.golive.entity.finalidadepadraolargura.model.ProdutoFinalidadePadraoLarguraModel;
import br.com.golive.impl.ProdutoFinalidadePadraoLarguraServiceImpl;

@Local(value = ProdutoFinalidadePadraoLarguraServiceImpl.class)
public interface ProdutoFinalidadePadraoLarguraService extends Service<ProdutoFinalidadePadraoLarguraModel> {

}