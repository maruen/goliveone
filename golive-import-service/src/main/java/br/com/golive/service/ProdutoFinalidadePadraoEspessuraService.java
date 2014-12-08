package br.com.golive.service;

import javax.ejb.Local;

import br.com.golive.entity.finalidadepadraoespessura.model.ProdutoFinalidadePadraoEspessuraModel;
import br.com.golive.impl.ProdutoFinalidadePadraoEspessuraServiceImpl;

@Local(value = ProdutoFinalidadePadraoEspessuraServiceImpl.class)
public interface ProdutoFinalidadePadraoEspessuraService extends Service<ProdutoFinalidadePadraoEspessuraModel> {

}