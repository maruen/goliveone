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
import br.com.golive.qualifier.DataBaseTest;
import br.com.golive.qualifier.DataBaseTradicao;
import br.com.golive.utils.ServiceUtils;

public class EntityManagerProdutor {

	private static final String UNIDADE_PERSISTENCIA_CENTRAL 	= "golive-one-central-PU";
	private static final String UNIDADE_PERSISTENCIA_ACAO 		= "golive-one-acao-PU";
	private static final String UNIDADE_PERSISTENCIA_TRADICAO	= "golive-one-tradicao-PU";
	private static final String UNIDADE_PERSISTENCIA_TEST		= "golive-one-test-PU";

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
	@DataBaseTest
	private EntityManagerFactory test;
	
	@Inject
	@DataBaseCentral
	private EntityManager entityCentral;

	@Inject
	@DataBaseAcao
	private EntityManager entityAcao;

	@Inject
	@DataBaseTradicao
	private EntityManager entityTradicao;
	
	@Inject
	@DataBaseTest
	private EntityManager entityTest;
	

	@Produces
	public EntityManager getEntityManager() {
		if (ServiceUtils.verificarNaSessaoPorChave(ChaveSessao.EMPRESA_SELECIONADA)) {
			final Empresa empresa = ServiceUtils.obterValorPorChave(Empresa.class, ChaveSessao.EMPRESA_SELECIONADA);
			switch (PersistenceContextEmpresa.findById(empresa.getId())) {
			case ACAO_PERSIANA:
				return entityAcao;
			case TRADICAO_DISTRIB:
				return entityTradicao;
			case TEST:
				return entityTest;
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
		return Persistence.createEntityManagerFactory(UNIDADE_PERSISTENCIA_ACAO);
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
		return Persistence.createEntityManagerFactory(UNIDADE_PERSISTENCIA_TRADICAO);
	}
	
	
	@Produces
	@SessionScoped
	@DataBaseTest
	public EntityManager getEntityManagerTest() {
		return test.createEntityManager();
	}

	@Produces
	@ApplicationScoped
	@DataBaseTest
	public EntityManagerFactory getEntityManagerFactoryTest() {
		return Persistence.createEntityManagerFactory(UNIDADE_PERSISTENCIA_TEST);
	}

}
