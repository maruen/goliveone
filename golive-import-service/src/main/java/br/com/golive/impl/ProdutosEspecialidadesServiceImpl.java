package br.com.golive.impl;

import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.service.ProdutosEspecialidadeService;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class ProdutosEspecialidadesServiceImpl implements ProdutosEspecialidadeService {

	@Inject
	private Logger logger;

	@Override
	public List<ColecoesModel> obterLista() {
		logger.info("Obtendo lista de Colecoes");
		return null;
	}

	@Override
	public void salvar(final ColecoesModel entity) {

	}

	@Override
	public void atualizar(final ColecoesModel entity) {

	}

	@Override
	public void remover(final ColecoesModel entity) {

	}

	@Override
	public void refresh(final ColecoesModel entity) {

	}

}
