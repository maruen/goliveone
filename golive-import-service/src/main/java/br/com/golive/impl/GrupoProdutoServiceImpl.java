package br.com.golive.impl;

import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.inject.Inject;
import javax.interceptor.Interceptors;

import org.slf4j.Logger;

import br.com.golive.annotation.CrudOperation;
import br.com.golive.constants.Operation;
import br.com.golive.entity.Model;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.grupoprodutos.repositorio.GrupoProdutoJPA;
import br.com.golive.interceptor.LogAuditoriaInterceptor;
import br.com.golive.service.GrupoProdutoService;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class GrupoProdutoServiceImpl implements GrupoProdutoService {

	@Inject
	private Logger logger;

	@Inject
	private GrupoProdutoJPA grupoProdutoJPA;

	@Override
	public List<GrupoProdutosModel> obterLista() {
		logger.info("Obtendo lista de grupos de produto");
		return grupoProdutoJPA.obterLista();
	}

	@Override
	public GrupoProdutosModel obterGrupoProdutoAtual(final Model model) {
		logger.info("Obtendo objeto atual de grupos de produto");
		return grupoProdutoJPA.findByIdWithLazys(model.getId(), "departamentoModel");
	}

	@Override
	@CrudOperation(type = Operation.INSERT)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void salvar(final GrupoProdutosModel grupoProdutosModel) {
		logger.info("Salvando grupo produto = {}", grupoProdutosModel);
		grupoProdutoJPA.refreshModel(grupoProdutosModel.getDepartamentoModel());
		grupoProdutoJPA.save(grupoProdutosModel);
	}

	@Override
	@CrudOperation(type = Operation.UPDATE)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void atualizar(final GrupoProdutosModel grupoProdutosModel) {
		logger.info("Atualizando grupo produto = {}", grupoProdutosModel.getId());
		grupoProdutoJPA.update(grupoProdutosModel);
	}

	@Override
	@CrudOperation(type = Operation.DELETE)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void remover(final GrupoProdutosModel grupoProdutosModel) {
		logger.info("Excluindo grupo produto = {}", grupoProdutosModel.getId());
		grupoProdutoJPA.removeModel(grupoProdutosModel);
	}

	@Override
	public List<GrupoProdutosModel> obterGrupoProdutoDepartamentoPorDepartamento(final DepartamentoModel departamentoModel) {
		logger.info("Obtendo Grupo de produtos por departamento = {}");
		return grupoProdutoJPA.obterListaPorDepartamento(departamentoModel);
	}

	@Override
	public void refresh(final GrupoProdutosModel model) {
		grupoProdutoJPA.refresh(model);

	}

}
