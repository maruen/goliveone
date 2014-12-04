package br.com.golive.service;

import javax.ejb.Local;

import br.com.golive.entity.finalidadecodigo.model.ProdutoFinalidadeCodigoModel;
import br.com.golive.impl.ProdutoFinalidadeCodigoServiceImpl;

@Local(value = ProdutoFinalidadeCodigoServiceImpl.class )
public interface ProdutoFinalidadeCodigoService extends Service<ProdutoFinalidadeCodigoModel> {

}