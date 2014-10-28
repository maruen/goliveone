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
	public void salvar(SubGrupoProdutoModel model) {
		logger.info("Salvando subGrupoProdutoModel");
		subGrupoProdutoJPA.save(model);
	}

	@Override
	@CrudOperation(type = Operation.UPDATE)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void alterar(SubGrupoProdutoModel model) {
		subGrupoProdutoJPA.update(model);
	}

	@Override
	public List<SubGrupoProdutoModel> listarTodos() {
		return subGrupoProdutoJPA.findAll();
	}

	@Override
	public List<SubGrupoProdutoModel> listarPorFiltro(String... args) {
		return subGrupoProdutoJPA.findByFilter(args);
	}

	@Override
	@CrudOperation(type = Operation.DELETE)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void excluir(SubGrupoProdutoModel departamentoModel) {
		subGrupoProdutoJPA.delete(departamentoModel);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<AuditoriaModel> getAuditoriaLogs(SubGrupoProdutoModel model) {
		return auditoriaJPA.getAuditoriaLogs(model.getId(), model.getClass());
	}

	@Override
	public String getUsuarioLog(SubGrupoProdutoModel model) {
		return auditoriaJPA.getUsuarioLog(model.getId(), model.getClass());
	}

}
