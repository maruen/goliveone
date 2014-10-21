package br.com.golive.impl;

import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.entity.empresas.empresa.model.Empresa;
import br.com.golive.entity.perfilconfiguracao.model.ColunaPerfil;
import br.com.golive.entity.perfilconfiguracao.model.ColunaPerfilId;
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
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public List<ColunaPerfil> obterListaDeConfiguracoesPagina(final Usuario usuario, final Empresa empresa, final String tabela) {
		logger.info("Obtendo configurações para a tabela = {}", tabela);
		return colunaPerfilJpa.obterColunaPerfil(new ColunaPerfilId(usuario, empresa), tabela);
	}

	@Override
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void salvar(final ColunaPerfil colunaPerfil) {
		logger.info("Salvando objeto = {}", colunaPerfil);
		colunaPerfilJpa.save(colunaPerfil);
	}

}
