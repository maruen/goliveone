package br.com.golive.service;

import java.util.List;

import javax.ejb.Local;

import br.com.golive.entity.padraoespessura.model.ProdutoPadraoEspessuraModel;
import br.com.golive.impl.ProdutoPadraoEspessuraServiceImpl;

@Local(value = ProdutoPadraoEspessuraServiceImpl.class)
public interface ProdutoPadraoEspessuraService {

	public List<ProdutoPadraoEspessuraModel> obterLista();

	public void salvar(ProdutoPadraoEspessuraModel model);

	public void atualizar(ProdutoPadraoEspessuraModel model);

	public void refresh(ProdutoPadraoEspessuraModel model);

	public void remover(ProdutoPadraoEspessuraModel model);

}
