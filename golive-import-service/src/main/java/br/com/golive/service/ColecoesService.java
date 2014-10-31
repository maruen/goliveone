package br.com.golive.service;

import javax.ejb.Local;

import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.impl.ColecoesServiceImpl;

@Local(value = ColecoesServiceImpl.class)
public interface ColecoesService {

	public void salvar(final ColecoesModel colecoesModel);
}
