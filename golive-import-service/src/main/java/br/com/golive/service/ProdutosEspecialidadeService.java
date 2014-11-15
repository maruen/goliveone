package br.com.golive.service;

import javax.ejb.Local;

import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.impl.ProdutosEspecialidadesServiceImpl;

@Local(ProdutosEspecialidadesServiceImpl.class)
public interface ProdutosEspecialidadeService extends Service<ColecoesModel> {

}
