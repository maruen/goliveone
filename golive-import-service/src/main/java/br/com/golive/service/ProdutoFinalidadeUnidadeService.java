package br.com.golive.service;

import javax.ejb.Local;

import br.com.golive.entity.finalidadeunidade.model.ProdutoFinalidadeUnidadeModel;
import br.com.golive.impl.ProdutoFinalidadeUnidadeServiceImpl;

@Local(value = ProdutoFinalidadeUnidadeServiceImpl.class)
public interface ProdutoFinalidadeUnidadeService extends Service<ProdutoFinalidadeUnidadeModel> {

}