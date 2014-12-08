package br.com.golive.service;

import javax.ejb.Local;

import br.com.golive.entity.finalidadecor.model.ProdutoFinalidadeCorModel;
import br.com.golive.impl.ProdutoFinalidadeCorServiceImpl;

@Local(value = ProdutoFinalidadeCorServiceImpl.class)
public interface ProdutoFinalidadeCorService extends Service<ProdutoFinalidadeCorModel> {

}