package br.com.golive.service;

import javax.ejb.Local;

import br.com.golive.entity.unidade.model.UnidadeModel;
import br.com.golive.impl.UnidadeServiceImpl;

@Local(value = UnidadeServiceImpl.class)
public interface UnidadeService extends Service<UnidadeModel> {

}
