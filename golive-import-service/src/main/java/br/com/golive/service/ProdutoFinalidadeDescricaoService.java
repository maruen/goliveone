package br.com.golive.service;

import javax.ejb.Local;

import br.com.golive.entity.finalidadedescricao.model.ProdutoFinalidadeDescricaoModel;
import br.com.golive.impl.ProdutoFinalidadeDescricaoServiceImpl;

@Local(value = ProdutoFinalidadeDescricaoServiceImpl.class)
public interface ProdutoFinalidadeDescricaoService extends Service<ProdutoFinalidadeDescricaoModel> {

}