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
import br.com.golive.entity.auditoria.repositorio.AuditoriaJPA;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.entity.subgrupoprodutos.repository.SubGrupoProdutoJPA;
import br.com.golive.interceptor.LogAuditoriaInterceptor;
import br.com.golive.service.SubGrupoProdutoService;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class SubGrupoProdutoServiceImpl implements SubGrupoProdutoService {

	@Inject
	private SubGrupoProdutoJPA subGrupoProdutoJPA;

	@Inject
	private Logger logger;

	@Inject
	private AuditoriaJPA auditoriaJPA;

	@Override
	@CrudOperation(type = Operation.INSERT)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void salvar(final SubGrupoProdutoModel model) {
		logger.info("Salvando subGrupoProdutoModel");
		subGrupoProdutoJPA.refreshModel(model.getDepartamentoSelected());
		subGrupoProdutoJPA.refreshModel(model.getGrupoProdutoSelected());
		subGrupoProdutoJPA.save(model);
	}

	@Override
	@CrudOperation(type = Operation.UPDATE)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void atualizar(final SubGrupoProdutoModel model) {
		logger.info("Atualizando SubgrupoProduto = {} ", model.getId());
		subGrupoProdutoJPA.update(model);
	}

	@Override
	public List<SubGrupoProdutoModel> obterLista() {
		return subGrupoProdutoJPA.findAll();
	}

	@Override
	public List<SubGrupoProdutoModel> listarPorFiltro(final String... args) {
		return subGrupoProdutoJPA.obterLista();
	}

	@Override
	@CrudOperation(type = Operation.DELETE)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void remover(final SubGrupoProdutoModel model) {
		logger.info("Removendo SubGrupoProduto = {} ", model.getId());
		subGrupoProdutoJPA.delete(model);
	}

	@Override
	public List<SubGrupoProdutoModel> obterSubGrupoProdutoPorGrupo(final GrupoProdutosModel model) {
		logger.info("obterSubGrupoProdutoPorGrupo");
		return subGrupoProdutoJPA.obterListaPorGrupo(model);
	}

	@Override
	public List<SubGrupoProdutoModel> obterSubGrupoProdutoPorGrupoId(final Long grupoId) {
		logger.info("obterSubGrupoProdutoPorGrupoId");
		return subGrupoProdutoJPA.obterListaPorGrupoId(grupoId);
	}

	@Override
	public void refresh(final SubGrupoProdutoModel model) {
		subGrupoProdutoJPA.refresh(model);

	}

}
