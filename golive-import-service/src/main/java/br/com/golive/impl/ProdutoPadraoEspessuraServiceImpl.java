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
import br.com.golive.entity.padraoespessura.model.ProdutoPadraoEspessuraModel;
import br.com.golive.entity.padraoespessura.repositorio.ProdutoPadraoEspessuraJPA;
import br.com.golive.interceptor.LogAuditoriaInterceptor;
import br.com.golive.service.ProdutoPadraoEspessuraService;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class ProdutoPadraoEspessuraServiceImpl implements ProdutoPadraoEspessuraService {

	@Inject
	private Logger logger;

	@Inject
	private ProdutoPadraoEspessuraJPA produtoPadraoEspessuraJPA;

	@Override
	public List<ProdutoPadraoEspessuraModel> obterLista() {
		logger.info("Obtendo Lista de ProdutoPadraoEspessuraModel");
		return produtoPadraoEspessuraJPA.findAllWithoutLazy("departamentoSelected", "grupoProdutoSelected", "subGrupoProdutoSelected", "colecaoSelected", "corProdutoSelected");
	}

	@Override
	@CrudOperation(type = Operation.INSERT)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void salvar(final ProdutoPadraoEspessuraModel model) {
		logger.info("Salvando ProdutoPadraoEspessura = {}", model);
		produtoPadraoEspessuraJPA.refresh(model.getDepartamentoSelected());
		produtoPadraoEspessuraJPA.refresh(model.getGrupoProdutoSelected());
		produtoPadraoEspessuraJPA.refresh(model.getSubGrupoProdutoSelected());
		produtoPadraoEspessuraJPA.refresh(model.getColecaoSelected());
		produtoPadraoEspessuraJPA.refresh(model.getCorProdutoSelected());
		produtoPadraoEspessuraJPA.save(model);
	}

	@Override
	@CrudOperation(type = Operation.UPDATE)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	@Interceptors(LogAuditoriaInterceptor.class)
	public void atualizar(final ProdutoPadraoEspessuraModel model) {
		logger.info("Atualizando ProdutoPadraoEspessura = {}", model);
		produtoPadraoEspessuraJPA.update(model);
	}

	@Override
	@CrudOperation(type = Operation.DELETE)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	@Interceptors(LogAuditoriaInterceptor.class)
	public void remover(final ProdutoPadraoEspessuraModel model) {
		logger.info("Removendo ProdutoPadraoEspessura = {}", model);
		produtoPadraoEspessuraJPA.delete(model);
	}

	@Override
	public void refresh(final ProdutoPadraoEspessuraModel model) {
		logger.info("Refresh ProdutoPadraoEspessura = {}", model);
		produtoPadraoEspessuraJPA.refresh(model);
	}
}
