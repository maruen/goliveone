package br.com.golive.produtor;

import java.io.IOException;

import javax.enterprise.context.SessionScoped;
import javax.enterprise.inject.Produces;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import br.com.golive.constants.ChaveSessao;
import br.com.golive.entity.empresas.empresa.model.Empresa;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.qualifier.UsuarioLogadoInjected;
import br.com.golive.utils.GoliveOneProperties;
import br.com.golive.utils.ServiceUtils;

public class EntityManagerProdutor {

	private static final String UNIDADE_PERSISTENCIA_CENTRAL = "golive-one-central-PU";

	@Inject
	@UsuarioLogadoInjected
	private Usuario usuario;

	private EntityManager entityManager;

	private Empresa empresa;

	private GoliveOneProperties persistenceProperties;

	private EntityManagerFactory factory;

	@Produces
	@SessionScoped
	public EntityManager getEntityManager() {

		obterPropertyConfiguracao();

		if (ServiceUtils.verificarNaSessaoPorChave(ChaveSessao.EMPRESA_SELECIONADA)) {
			final Empresa atual = ServiceUtils.obterValorPorChave(Empresa.class, ChaveSessao.EMPRESA_SELECIONADA);
			if (!empresa.equals(atual)) {
				factory = Persistence.createEntityManagerFactory(persistenceProperties.getField(empresa.getRazaoSocial()));
				entityManager = factory.createEntityManager();
			} else {
				createEntityManager();
			}
		} else {
			if (factory == null) {
				factory = Persistence.createEntityManagerFactory(UNIDADE_PERSISTENCIA_CENTRAL);
				createEntityManager();
			}
		}

		return entityManager;
	}

	private void createEntityManager() {
		if (entityManager == null) {
			entityManager = factory.createEntityManager();
		}
	}

	private void obterPropertyConfiguracao() {
		if (persistenceProperties == null) {
			try {
				persistenceProperties = new GoliveOneProperties("config");
			} catch (final IOException e) {
				e.printStackTrace();
			}
		}
	}

}
