package br.com.golive.produtor;

import javax.enterprise.inject.Produces;
import javax.enterprise.inject.spi.InjectionPoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoggerProdutor {

	@Produces
	public Logger produtor(final InjectionPoint injectionPoint){
	      return LoggerFactory.getLogger(injectionPoint.getMember().getDeclaringClass()); 
	}
	
}
