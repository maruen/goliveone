package br.com.golive.service;

import java.util.List;

import javax.ejb.Local;

import br.com.golive.entity.padraolargura.model.ProdutoPadraoLarguraModel;
import br.com.golive.impl.ProdutoPadraoLarguraServiceImpl;

@Local(value = ProdutoPadraoLarguraServiceImpl.class)
public interface ProdutoPadraoLarguraService {
	
	public List<ProdutoPadraoLarguraModel> obterLista();

	public void salvar(ProdutoPadraoLarguraModel model);

	public void atualizar(ProdutoPadraoLarguraModel model);

	public void refresh(ProdutoPadraoLarguraModel model);

	public void remover(ProdutoPadraoLarguraModel model);
}