package br.com.golive.service;

import javax.ejb.Local;

import br.com.golive.entity.padraoespessura.model.ProdutoPadraoEspessuraModel;
import br.com.golive.impl.ProdutoPadraoEspessuraServiceImpl;

@Local(value = ProdutoPadraoEspessuraServiceImpl.class)
public interface ProdutoPadraoEspessuraService extends Service<ProdutoPadraoEspessuraModel> {

}
