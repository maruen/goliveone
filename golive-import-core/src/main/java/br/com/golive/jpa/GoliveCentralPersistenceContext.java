package br.com.golive.jpa;

import javax.persistence.EntityManager;

public class GoliveCentralPersistenceContext {

	private EntityManager entityManager;

	public GoliveCentralPersistenceContext() {
		super();
	}

	public EntityManager getEntityManager() {
		return entityManager;
	}

	public void setEntityManager(final EntityManager entityManager) {
		this.entityManager = entityManager;
	}

}
