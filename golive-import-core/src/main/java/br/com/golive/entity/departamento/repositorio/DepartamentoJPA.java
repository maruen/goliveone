package br.com.golive.entity.departamento.repositorio;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.jpa.JpaGoLive;

public class DepartamentoJPA extends JpaGoLive<DepartamentoModel, Long> {
	@Inject
	protected DepartamentoJPA(final EntityManager entityManager) {
		super(entityManager);
		// TODO Auto-generated constructor stub
	}

}
