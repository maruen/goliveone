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
import br.com.golive.entity.padraolargura.model.ProdutoPadraoLarguraModel;
import br.com.golive.entity.padraolargura.repositorio.ProdutoPadraoLarguraJPA;
import br.com.golive.interceptor.LogAuditoriaInterceptor;
import br.com.golive.service.ProdutoPadraoLarguraService;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class ProdutoPadraoLarguraServiceImpl implements ProdutoPadraoLarguraService {

	@Inject
	private Logger logger;

	@Inject
	private ProdutoPadraoLarguraJPA produtoPadraoLarguraJPA;

	@Override
	public List<ProdutoPadraoLarguraModel> obterLista() {
		logger.info("Obtendo Lista de ProdutoPadraoLarguraModel");
		return produtoPadraoLarguraJPA.findAllWithoutLazy("departamentoSelected", "grupoProdutoSelected", "subGrupoProdutoSelected", "colecaoSelected", "corProdutoSelected", "unidadeSelected");
	}

	@Override
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	@CrudOperation(type = Operation.INSERT)
	@Interceptors(LogAuditoriaInterceptor.class)
	public void salvar(final ProdutoPadraoLarguraModel model) {
		logger.info("Salvando ProdutoPadraoLargura = {}", model);
		produtoPadraoLarguraJPA.refreshModel(model.getDepartamentoSelected());
		produtoPadraoLarguraJPA.refreshModel(model.getGrupoProdutoSelected());
		produtoPadraoLarguraJPA.refreshModel(model.getSubGrupoProdutoSelected());
		produtoPadraoLarguraJPA.refreshModel(model.getColecaoSelected());
		produtoPadraoLarguraJPA.refreshModel(model.getCorProdutoSelected());
		produtoPadraoLarguraJPA.save(model);
	}

	@Override
	@CrudOperation(type = Operation.UPDATE)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	@Interceptors(LogAuditoriaInterceptor.class)
	public void atualizar(final ProdutoPadraoLarguraModel model) {
		logger.info("Atualizando ProdutoPadraoLargura = {}", model);
		produtoPadraoLarguraJPA.update(model);
	}

	@Override
	@CrudOperation(type = Operation.DELETE)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	@Interceptors(LogAuditoriaInterceptor.class)
	public void remover(final ProdutoPadraoLarguraModel model) {
		logger.info("Removendo ProdutoPadraoLargura = {}", model);
		produtoPadraoLarguraJPA.delete(model);
	}

	@Override
	public void refresh(final ProdutoPadraoLarguraModel model) {
		logger.info("Refresh ProdutoPadraoLargura = {}", model);
		produtoPadraoLarguraJPA.refresh(model);
	}
}