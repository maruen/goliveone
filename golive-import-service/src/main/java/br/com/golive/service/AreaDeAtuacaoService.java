package br.com.golive.service;

import java.util.List;

import javax.ejb.Local;

import br.com.golive.entity.areaDeAtuacao.model.AreaDeAtuacaoModel;
import br.com.golive.impl.AreaDeAtuacaoServiceImpl;

@Local(value = AreaDeAtuacaoServiceImpl.class)
public interface AreaDeAtuacaoService {

	public List<AreaDeAtuacaoModel> obterLista();

	public void salvar(final AreaDeAtuacaoModel areaDeAtuacaoModel);
}
