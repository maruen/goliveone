package br.com.golive.entity.departamento.repositorio;

import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.jpa.JpaGoLive;

public class DepartamentoJPA extends JpaGoLive<DepartamentoModel, Long> {

	@Override
	public void save(final DepartamentoModel entity) {
		super.save(entity);
	}

}
