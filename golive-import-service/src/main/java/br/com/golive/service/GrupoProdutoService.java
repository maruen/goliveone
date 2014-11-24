package br.com.golive.service;

import java.util.List;

import javax.ejb.Local;

import br.com.golive.entity.Model;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.impl.GrupoProdutoServiceImpl;

@Local(value = GrupoProdutoServiceImpl.class)
public interface GrupoProdutoService extends Service<GrupoProdutosModel> {

	public List<GrupoProdutosModel> obterGrupoProdutoDepartamentoPorDepartamento(final DepartamentoModel departamentoModel);

	public GrupoProdutosModel obterGrupoProdutoAtual(final Model model);

}
