package br.com.golive.entity.departamento.repositorio;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;

import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.jpa.JpaGoLive;

public class DepartamentoJPA extends JpaGoLive<DepartamentoModel, Long> {

	public List<DepartamentoModel> obterDepartamentos() {
		final Criteria criteria = createNativeCriteria();
		criteria.addOrder(Order.asc("id"));
		return extractListByCriteria(criteria);
	}

}
