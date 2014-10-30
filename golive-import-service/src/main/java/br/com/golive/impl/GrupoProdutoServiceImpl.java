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
import br.com.golive.entity.grupoprodutodepartamento.model.GrupoProdutoDepartamento;
import br.com.golive.entity.grupoprodutodepartamento.repositorio.GrupoProdutoDepartamentoJPA;
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

	@Inject
	private GrupoProdutoDepartamentoJPA grupoProdutoDepartamentoJPA;

	@Override
	public List<GrupoProdutosModel> obterGrupoProdutos() {
		logger.info("Obtendo lista de grupos de produto");
		return grupoProdutoJPA.obterLista();
	}

	@Override
	public GrupoProdutosModel obterGrupoProdutoAtual(final Model model) {
		logger.info("Obtendo objeto atual de grupos de produto");
		return grupoProdutoJPA.findByIdWithLazys(model.getId(), "auditoriaLogs", "departamentoModel");
	}

	@Override
	public List<GrupoProdutoDepartamento> obterGrupoProdutoDepartamentos() {
		logger.info("Obtendo lista de grupos departamento");
		return grupoProdutoDepartamentoJPA.obterLista();
	}

	@Override
	@CrudOperation(type = Operation.INSERT)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void salvar(final GrupoProdutosModel grupoProdutosModel) {
		logger.info("Salvando grupo produto = {}", grupoProdutosModel);
		grupoProdutoJPA.save(grupoProdutosModel);
	}

	@Override
	@CrudOperation(type = Operation.UPDATE)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void update(final GrupoProdutosModel grupoProdutosModel) {
		logger.info("Atualizando grupo produto = {}", grupoProdutosModel);
		grupoProdutoJPA.update(grupoProdutosModel);
	}

}
