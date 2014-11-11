package br.com.golive.impl;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.entity.perfilconfiguracao.model.ColunaPerfil;
import br.com.golive.entity.perfilconfiguracao.repositorio.ColunaPerfilJpa;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.navigation.component.KeyMapDataTableTemplate;
import br.com.golive.service.PerfilService;
import br.com.golive.utils.Utils;

@Stateless
public class PerfilServiceImpl implements PerfilService {

	@Inject
	private ColunaPerfilJpa colunaPerfilJpa;

	@Inject
	private Logger logger;

	@Override
	public List<ColunaPerfil> obterListaDeConfiguracoesPagina(final Usuario usuario, final String managedBeanName, final List<Class<?>> classes) {
		logger.info("Obtendo configurações para a tabela = {}", classes);

		final Comparator<ColunaPerfil> comparator = new Comparator<ColunaPerfil>() {
			@Override
			public int compare(final ColunaPerfil o1, final ColunaPerfil o2) {
				return o1.getId().getTabela().compareTo(o2.getId().getTabela());
			}
		};

		List<ColunaPerfil> conf = colunaPerfilJpa.obterColunaPerfil(usuario.getId(), managedBeanName, Utils.getNameTablesByClasses(classes));
		if (conf.isEmpty()) {
			conf = Utils.obterColunasPagina(usuario, managedBeanName, classes);
			Collections.sort(conf, comparator);
			Utils.reordernar(conf);
			salvarLista(conf);
		}
		return conf;
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

	@Override
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void atualizarLista(final List<ColunaPerfil> colunas) {
		logger.info("Atualizando configuracoes de usuario ={}", colunas);
		ColunaPerfil update;
		for (final ColunaPerfil colunaPerfil : colunas) {
			update = colunaPerfilJpa.obterPorId(colunaPerfil.getId());
			update.setOrdem(colunaPerfil.getOrdem());
			update.setPadraoFiltro(colunaPerfil.getPadraoFiltro());
			colunaPerfilJpa.update(update);
		}
	}

	@Override
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void atualizarListas(final Map<KeyMapDataTableTemplate, List<ColunaPerfil>> map) {
		logger.info("Atualizando configuracoes de usuario");
		for (final KeyMapDataTableTemplate key : map.keySet()) {
			for (final ColunaPerfil colunaPerfil : map.get(key)) {
				colunaPerfilJpa.update(colunaPerfil);
			}
		}

	}

	@Override
	public void atualizar(final ColunaPerfil colunaPerfil) {
		logger.info("Atualizando Coluna Perfil");
		colunaPerfilJpa.update(colunaPerfil);
	}

}
