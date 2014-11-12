package br.com.golive.service;

import java.util.List;

import javax.ejb.Local;

import br.com.golive.entity.unidade.model.UnidadeModel;
import br.com.golive.impl.UnidadeServiceImpl;

@Local(value = UnidadeServiceImpl.class)
public interface UnidadeService {

	public List<UnidadeModel> obterLista();

	public void salvar(UnidadeModel unidadeModel);

	public void atualizar(UnidadeModel unidadeModel);

	public void remover(UnidadeModel unidadeModel);

	public void refresh(UnidadeModel unidadeModel);

}
