package br.com.golive.service;

import java.util.List;

import javax.ejb.Local;

import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.impl.ColecoesServiceImpl;

@Local(value = ColecoesServiceImpl.class)
public interface ColecoesService {

	public void salvar(final ColecoesModel colecoesModel);
	public List<ColecoesModel> listarTodos();
}
