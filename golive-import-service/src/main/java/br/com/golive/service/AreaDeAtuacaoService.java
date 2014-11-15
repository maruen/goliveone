package br.com.golive.service;

import javax.ejb.Local;

import br.com.golive.entity.areaDeAtuacao.model.AreaDeAtuacaoModel;
import br.com.golive.impl.AreaDeAtuacaoServiceImpl;

@Local(value = AreaDeAtuacaoServiceImpl.class)
public interface AreaDeAtuacaoService extends Service<AreaDeAtuacaoModel> {

}
