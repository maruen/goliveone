package br.com.golive.produtor;

import javax.enterprise.inject.Produces;
import javax.enterprise.inject.spi.InjectionPoint;

import org.slf4j.LoggerFactory;

import br.com.golive.filter.DateFilter;
import br.com.golive.filter.FilterManager;
import br.com.golive.filter.NumberFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;

public class FilterProdutor {

	@Produces
	@FilterInjected
	public <T> FilterManager<T> produtor(final InjectionPoint injectionPoint) {
		final FilterManager<T> filter = new FilterManager<T>(LoggerFactory.getLogger(FilterManager.class));

		// for (final Field field :
		// injectionPoint.getMember().getDeclaringClass().getDeclaredFields()) {
		// if (field.isAnnotationPresent(Filter.class)) {
		// filter.putGetter(field.getAnnotation(Filter.class).campo());
		// }
		// }
		return filter;
	}

	@Produces
	@FilterInjected
	public DateFilter dateFilterProdutor() {
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
