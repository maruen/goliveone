package br.com.golive.service;

import javax.ejb.Local;

import br.com.golive.entity.finalidadetipo.model.ProdutoFinalidadeTipoModel;
import br.com.golive.impl.ProdutoFinalidadeTipoServiceImpl;

@Local(value = ProdutoFinalidadeTipoServiceImpl.class)
public interface ProdutoFinalidadeTipoService extends Service<ProdutoFinalidadeTipoModel> {

}