package br.com.golive.produtor;

import javax.enterprise.inject.Produces;
import javax.enterprise.inject.spi.InjectionPoint;

import br.com.golive.filter.DateFilter;
import br.com.golive.filter.FilterManager;
import br.com.golive.filter.NumberFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;

public class FilterProdutor {

	@Produces
	@FilterInjected
	public <T> FilterManager<T> produtor(final InjectionPoint injectionPoint) {
		return new FilterManager<T>();
	}

	@Produces
	@FilterInjected
	public DateFilter CalendarFilterProdutor() {
		return new DateFilter();
	}

	@Produces
	@FilterInjected
	public NumberFilter numberFilterProdutor() {
		return new NumberFilter();
	}

	@Produces
	@FilterInjected
	public StringFilter stringFilter() {
		return new StringFilter();
	}

}
