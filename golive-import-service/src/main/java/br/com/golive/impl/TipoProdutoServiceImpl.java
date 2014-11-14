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
import br.com.golive.entity.tipoproduto.model.TipoProdutoModel;
import br.com.golive.entity.tipoproduto.repositorio.TipoProdutoJPA;
import br.com.golive.interceptor.LogAuditoriaInterceptor;
import br.com.golive.service.TipoProdutoService;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class TipoProdutoServiceImpl implements TipoProdutoService {

	@Inject
	private Logger logger;
	
	@Inject
	private TipoProdutoJPA tipoProdutoJPA;
	
	@Override
	public List<TipoProdutoModel> obterLista() {
		logger.info("Obtendo Lista de TipoProdutoModel");
		return tipoProdutoJPA.findAllWithoutLazy();
	}

	@Override
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	@CrudOperation(type = Operation.INSERT)
	@Interceptors(LogAuditoriaInterceptor.class)
	public void salvar(TipoProdutoModel model) {
		logger.info("Salvando TipoProduto = {}", model);
		tipoProdutoJPA.save(model);
	}

	@Override
	@CrudOperation(type = Operation.UPDATE)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	@Interceptors(LogAuditoriaInterceptor.class)
	public void atualizar(TipoProdutoModel model) {
		logger.info("Atualizando TipoProduto = {}", model);
		tipoProdutoJPA.update(model);
	}

	@Override
	@CrudOperation(type = Operation.DELETE)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	@Interceptors(LogAuditoriaInterceptor.class)
	public void remover(TipoProdutoModel model) {
		logger.info("Removendo TipoProduto = {}", model);
		tipoProdutoJPA.delete(model);
	}

	@Override
	public void refresh(TipoProdutoModel model) {
		logger.info("Refresh TipoProduto = {}", model);
		tipoProdutoJPA.refresh(model);
	}
}