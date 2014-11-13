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
import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.auditoria.repositorio.AuditoriaJPA;
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

	@Inject
	private AuditoriaJPA auditoriaJPA;

	@Override
	@CrudOperation(type = Operation.INSERT)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void salvar(final CorProdutoModel model) {
		logger.info("Salvando corProdutoModel");
		corProdutoJPA.refresh(model.getDepartamentoSelected());
		corProdutoJPA.refresh(model.getGrupoProdutoSelected());
		corProdutoJPA.refresh(model.getSubGrupoProdutoSelected());
		corProdutoJPA.refresh(model.getColecaoSelected());
		corProdutoJPA.save(model);
	}

	@Override
	@CrudOperation(type = Operation.UPDATE)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void alterar(final CorProdutoModel model) {
		corProdutoJPA.update(model);
	}

	@Override
	public List<CorProdutoModel> listarTodos() {
		return corProdutoJPA.findAll();
	}

	@Override
	public List<CorProdutoModel> listarPorFiltro(final String... args) {
		return corProdutoJPA.obterLista();
	}

	@Override
	@CrudOperation(type = Operation.DELETE)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void excluir(final CorProdutoModel departamentoModel) {
		corProdutoJPA.delete(departamentoModel);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AuditoriaModel> getAuditoriaLogs(final CorProdutoModel model) {
		return auditoriaJPA.getAuditoriaLogs(model.getId(), model.getClass());
	}

	@Override
	public String getUsuarioLog(final CorProdutoModel model) {
		return auditoriaJPA.getUsuarioLog(model.getId(), model.getClass());
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

}
