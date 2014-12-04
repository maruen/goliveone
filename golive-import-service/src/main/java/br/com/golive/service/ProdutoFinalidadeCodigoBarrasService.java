package br.com.golive.service;

import javax.ejb.Local;

import br.com.golive.entity.finalidadecodigobarras.model.ProdutoFinalidadeCodigoBarrasModel;
import br.com.golive.impl.ProdutoFinalidadeCodigoBarrasServiceImpl;

@Local(value = ProdutoFinalidadeCodigoBarrasServiceImpl.class)
public interface ProdutoFinalidadeCodigoBarrasService extends Service<ProdutoFinalidadeCodigoBarrasModel> {

}