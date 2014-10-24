package br.com.golive.impl;

import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.entity.empresas.empresa.model.Empresa;
import br.com.golive.entity.perfilconfiguracao.model.ColunaPerfil;
import br.com.golive.entity.perfilconfiguracao.repositorio.ColunaPerfilJpa;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.service.PerfilService;

@Stateless
public class PerfilServiceImpl implements PerfilService {

	@Inject
	private ColunaPerfilJpa colunaPerfilJpa;

	@Inject
	private Logger logger;

	@Override
	public List<ColunaPerfil> obterListaDeConfiguracoesPagina(final Usuario usuario, final Empresa empresa, final String tabela) {
		logger.info("Obtendo configurações para a tabela = {}", tabela);
		return colunaPerfilJpa.obterColunaPerfil();
	}

	@Override
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void salvarLista(final List<ColunaPerfil> colunaPerfil) {
		logger.info("Salvando configuracoes de usuario ={}", colunaPerfil);
		colunaPerfilJpa.saveAll(colunaPerfil);
	}

	@Override
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void salvar(final ColunaPerfil colunaPerfil) {
		colunaPerfilJpa.save(colunaPerfil);
	}

}
