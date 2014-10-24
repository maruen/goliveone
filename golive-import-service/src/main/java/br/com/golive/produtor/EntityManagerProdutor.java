package br.com.golive.produtor;

import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.context.SessionScoped;
import javax.enterprise.inject.Produces;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import br.com.golive.constants.ChaveSessao;
import br.com.golive.constants.PersistenceContextEmpresa;
import br.com.golive.entity.empresas.empresa.model.Empresa;
import br.com.golive.qualifier.DataBaseAcao;
import br.com.golive.qualifier.DataBaseCentral;
import br.com.golive.qualifier.DataBaseTradicao;
import br.com.golive.utils.ServiceUtils;

public class EntityManagerProdutor {

	private static final String UNIDADE_PERSISTENCIA_CENTRAL = "golive-one-central-PU";

	@Inject
	@DataBaseAcao
	private EntityManagerFactory acao;

	@Inject
	@DataBaseTradicao
	private EntityManagerFactory tradicao;

	@Inject
	@DataBaseCentral
	private EntityManagerFactory central;

	@Inject
	@DataBaseCentral
	private EntityManager entityCentral;

	@Inject
	@DataBaseAcao
	private EntityManager entityAcao;

	@Inject
	@DataBaseTradicao
	private EntityManager entityTradicao;

	@Produces
	public EntityManager getEntityManager() {
		if (ServiceUtils.verificarNaSessaoPorChave(ChaveSessao.EMPRESA_SELECIONADA)) {
			final Empresa empresa = ServiceUtils.obterValorPorChave(Empresa.class, ChaveSessao.EMPRESA_SELECIONADA);
			switch (PersistenceContextEmpresa.findById(empresa.getId())) {
			case ACAO_PERSIANA:
				return entityAcao;
			case TRADICAO_DISTRIB:
				return entityTradicao;
			default:
				break;
			}
		}
		return entityCentral;
	}

	@Produces
	@SessionScoped
	@DataBaseCentral
	public EntityManager getEntityManagerCentral() {
		return central.createEntityManager();
	}

	@Produces
	@ApplicationScoped
	@DataBaseCentral
	public EntityManagerFactory getEntityManagerFactoryCentral() {
		return Persistence.createEntityManagerFactory(UNIDADE_PERSISTENCIA_CENTRAL);
	}

	@Produces
	@SessionScoped
	@DataBaseAcao
	public EntityManager getEntityManagerAcao() {
		return acao.createEntityManager();
	}

	@Produces
	@ApplicationScoped
	@DataBaseAcao
	public EntityManagerFactory getEntityManagerFactoryAcao() {
		return Persistence.createEntityManagerFactory("golive-one-acao-PU");
	}

	@Produces
	@SessionScoped
	@DataBaseTradicao
	public EntityManager getEntityManagerTradicao() {
		return tradicao.createEntityManager();
	}

	@Produces
	@ApplicationScoped
	@DataBaseTradicao
	public EntityManagerFactory getEntityManagerFactoryTradicao() {
		return Persistence.createEntityManagerFactory("golive-one-tradicao-PU");
	}

}
