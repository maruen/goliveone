package br.com.golive.entity.departamento.repositorio;

import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.filter.GoliveFilter;
import br.com.golive.jpa.JpaGoLive;

public class DepartamentoJPA extends JpaGoLive<DepartamentoModel, Long> {

	public List<DepartamentoModel> obterDepartamentos() {
		final Criteria criteria = createNativeCriteria();
		criteria.addOrder(Order.asc("id"));
		return extractListByCriteria(criteria);
	}

	public List<DepartamentoModel> obterDepartamentosLazy(final int startIndex, final int pageSize, final Map<String, GoliveFilter> parameters) {
		final Criteria criteria = createNativeCriteria();
		criteria.addOrder(Order.asc("id"));

		if (parameters != null) {
			GoliveFilter filter;
			for (final String key : parameters.keySet()) {
				filter = parameters.get(key);
				switch (filter.getTipo()) {
				case CONTEM:
					if (verificarFiltroInicio(filter)) {
						criteria.add(Restrictions.like(key, verificarFiltroInicio(filter)));
					}
					break;
				case IGUAL:
					if (verificarFiltroInicio(filter)) {
						criteria.add(Restrictions.eq(key, verificarFiltroInicio(filter)));
					}
					break;
				case INTERVALO:
					if (verificarFiltroInicio(filter) && verificarFiltroFim(filter)) {
						criteria.add(Restrictions.lt(key, verificarFiltroInicio(filter)));
						criteria.add(Restrictions.gt(key, filter.getFim()));
					}
					break;
				case MAIOR:
					if (verificarFiltroInicio(filter)) {

						criteria.add(Restrictions.gt(key, verificarFiltroInicio(filter)));
					}
					break;
				case MENOR:
					if (verificarFiltroInicio(filter)) {

						criteria.add(Restrictions.lt(key, verificarFiltroInicio(filter)));
					}
					break;
				case PERIODO:
					if (verificarFiltroInicio(filter) && verificarFiltroFim(filter)) {

						criteria.add(Restrictions.lt(key, verificarFiltroInicio(filter)));
						criteria.add(Restrictions.gt(key, filter.getFim()));
					}
					break;
				}
			}

		}

		criteria.setFirstResult(startIndex);
		criteria.setMaxResults(pageSize);
		return extractListByCriteria(criteria);
	}

	private boolean verificarFiltroInicio(final GoliveFilter filter) {
		return (filter.getInicio() != null) && (!filter.getInicio().toString().isEmpty());
	}

	private boolean verificarFiltroFim(final GoliveFilter filter) {
		return (filter.getFim() != null) && (!filter.getFim().toString().isEmpty());
	}

}
