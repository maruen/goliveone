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
import br.com.golive.entity.colecoes.repositorio.ColecoesJPA;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.interceptor.LogAuditoriaInterceptor;
import br.com.golive.service.ColecoesService;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class ColecoesServiceImpl implements ColecoesService {

	@Inject
	private Logger logger;

	@Inject
	private ColecoesJPA colecoesJPA;

	@Override
	@CrudOperation(type = Operation.INSERT)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void salvar(final ColecoesModel colecoesModel) {
		logger.info("Salvando ColecoesModel ={}", colecoesModel);
		colecoesJPA.save(colecoesModel);
	}

	@Override
	public List<ColecoesModel> obterLista(final String... lazyFields) {
		logger.info("Obtendo lista de ColecoesModel");
		return colecoesJPA.findAllWithoutLazy(lazyFields);
	}

	@Override
	@CrudOperation(type = Operation.UPDATE)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void update(final ColecoesModel colecoesModel) {
		logger.info("Atualizando ColecoesModel ={}", colecoesModel.getId());
		colecoesJPA.update(colecoesModel);
	}

	@Override
	@CrudOperation(type = Operation.DELETE)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void remover(final ColecoesModel colecoesModel) {
		logger.info("Removendo colecoesModel ={}", colecoesModel.getId());
		colecoesJPA.delete(colecoesModel);
	}

	@Override
	public List<ColecoesModel> listarTodos() {
		return colecoesJPA.listarTodos();
	}

	@Override
	public void discardChanges(final ColecoesModel model) {
		colecoesJPA.refresh(model);

	}

	@Override
	public List<ColecoesModel> obterListaPorSubGrupo(final SubGrupoProdutoModel model) {
		logger.info("Obtendo lista de ColecoesModel por subgrupo = {} ", model.getId());
		return colecoesJPA.obterListaPorSubGrupo(model);
	}

}
