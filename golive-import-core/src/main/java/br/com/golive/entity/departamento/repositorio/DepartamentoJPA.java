package br.com.golive.entity.departamento.repositorio;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import br.com.golive.constants.OrderColumnType;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.filter.GoliveFilter;
import br.com.golive.jpa.JpaGoLive;
import br.com.golive.navigation.component.LazyModel;
import br.com.golive.navigation.component.OrderByDynamicColumn;
import br.com.golive.utils.Utils;

public class DepartamentoJPA extends JpaGoLive<DepartamentoModel, Long> {

	public List<DepartamentoModel> obterDepartamentos() {
		final Criteria criteria = createNativeCriteria();
		criteria.addOrder(Order.asc("id"));
		return extractListByCriteria(criteria);
	}

	public LazyModel<DepartamentoModel> obterDepartamentosLazy(final int startIndex, final int pageSize, final Map<String, GoliveFilter> parameters, final OrderByDynamicColumn order) {

		final Map<Long, List<DepartamentoModel>> retorno = new HashMap<Long, List<DepartamentoModel>>();
		final Criteria criteria = createNativeCriteria();

		final Criteria contCriteria = createNativeCriteria();

		if (parameters != null) {
			GoliveFilter filter;
			for (final String key : parameters.keySet()) {
				filter = parameters.get(key);
				switch (filter.getTipo()) {
				case CONTEM:
					if (verificarFiltroInicio(filter)) {
						criteria.add(Restrictions.like(key, filter.getInicio()));
						contCriteria.add(Restrictions.like(key, filter.getInicio()));
					}
					break;
				case IGUAL:
					if (verificarFiltroInicio(filter)) {
						criteria.add(Restrictions.eq(key, filter.getInicio()));
						contCriteria.add(Restrictions.eq(key, filter.getInicio()));
					}
					break;
				case INTERVALO:
					if (verificarFiltroInicio(filter)
							&& verificarFiltroFim(filter)) {
						criteria.add(Restrictions.lt(key, filter.getInicio()));
						contCriteria.add(Restrictions.lt(key, filter.getInicio()));
						criteria.add(Restrictions.gt(key, filter.getFim()));
						contCriteria.add(Restrictions.gt(key, filter.getFim()));
					}
					break;
				case MAIOR:
					if (verificarFiltroInicio(filter)) {
						criteria.add(Restrictions.gt(key, filter.getInicio()));
						contCriteria.add(Restrictions.gt(key, filter.getInicio()));
					}
					break;
				case MENOR:
					if (verificarFiltroInicio(filter)) {
						criteria.add(Restrictions.lt(key, filter.getInicio()));
						contCriteria.add(Restrictions.lt(key, filter.getInicio()));
					}
					break;
				case PERIODO:
					if (verificarFiltroInicio(filter)
							&& verificarFiltroFim(filter)) {
						criteria.add(Restrictions.lt(key, filter.getInicio()));
						contCriteria.add(Restrictions.lt(key, filter.getInicio()));
						criteria.add(Restrictions.gt(key, filter.getFim()));
						contCriteria.add(Restrictions.gt(key, filter.getFim()));
					}
					break;
				}
			}
		}

		final Long count = (Long) contCriteria.setProjection(Projections.rowCount()).uniqueResult();

		if (order != null) {

			final String property = Utils.getPathEntityByColumnWithClass(DepartamentoModel.class, order.getColuna());

			if (order.getOrder().equals(OrderColumnType.ASC)) {
				criteria.addOrder(Order.asc(property));
			} else {
				criteria.addOrder(Order.desc(property));
			}
		}

		criteria.setFirstResult(startIndex);
		criteria.setMaxResults(pageSize);

		return new LazyModel<>(count, extractListByCriteria(criteria));
	}

	private boolean verificarFiltroInicio(final GoliveFilter filter) {
		return (filter.getInicio() != null)
				&& (!filter.getInicio().toString().isEmpty());
	}

	private boolean verificarFiltroFim(final GoliveFilter filter) {
		return (filter.getFim() != null)
				&& (!filter.getFim().toString().isEmpty());
	}

}
