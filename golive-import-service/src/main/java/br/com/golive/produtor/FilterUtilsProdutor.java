package br.com.golive.produtor;

import javax.enterprise.inject.Produces;
import javax.enterprise.inject.spi.InjectionPoint;

import org.slf4j.LoggerFactory;

import br.com.golive.qualifier.FilterUtilsInjected;
import br.com.golive.utils.FilterUtils;

public class FilterUtilsProdutor {

	@Produces
	@FilterUtilsInjected
	public <T> FilterUtils<T> produtor(final InjectionPoint injectionPoint) {
		return new FilterUtils<T>(LoggerFactory.getLogger(injectionPoint.getMember().getDeclaringClass()));
	}

}
