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
import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.entity.especialidades.model.CorProdutoModel;
import br.com.golive.entity.especialidades.repository.CorProdutoJPA;
import br.com.golive.interceptor.LogAuditoriaInterceptor;
import br.com.golive.service.CorProdutoService;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class CorProdutoServiceImpl implements CorProdutoService {

	@Inject
	private CorProdutoJPA corProdutoJPA;

	@Inject
	private Logger logger;

	@Override
	@CrudOperation(type = Operation.INSERT)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void salvar(final CorProdutoModel model) {
		logger.info("Salvando corProdutoModel");
		corProdutoJPA.refreshModel(model.getDepartamentoSelected());
		corProdutoJPA.refreshModel(model.getGrupoProdutoSelected());
		corProdutoJPA.refreshModel(model.getSubGrupoProdutoSelected());
		corProdutoJPA.refreshModel(model.getColecaoSelected());
		corProdutoJPA.save(model);
	}

	@Override
	@CrudOperation(type = Operation.UPDATE)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void atualizar(final CorProdutoModel model) {
		corProdutoJPA.update(model);
	}

	@Override
	public List<CorProdutoModel> obterLista() {
		return corProdutoJPA.findAllWithoutLazy("subGrupoProdutoSelected", "grupoProdutoSelected", "departamentoSelected", "colecaoSelected");
	}

	@Override
	@CrudOperation(type = Operation.DELETE)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void remover(final CorProdutoModel departamentoModel) {
		corProdutoJPA.delete(departamentoModel);
	}

	@Override
	public void refresh(final CorProdutoModel model) {
		corProdutoJPA.refresh(model);
	}

	@Override
	public List<CorProdutoModel> obterPorColecao(final ColecoesModel colecoesModel) {
		logger.info("Obtendo Lista de cores por colecao");
		return corProdutoJPA.obterListaPorColecao(colecoesModel);
	}

	@Override
	public List<CorProdutoModel> obterListaLazy(final Long lastId) {
		// TODO Auto-generated method stub
		return null;
	}

}
