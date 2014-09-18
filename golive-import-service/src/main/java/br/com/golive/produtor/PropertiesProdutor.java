package br.com.golive.produtor;

import java.io.IOException;
import java.util.Locale;

import javax.enterprise.inject.Produces;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

public class PropertiesProdutor {

	@Inject
	private Logger logger;

	@Produces
	@LabelSystemInjected
	public GoliveOneProperties getLabelProperties() {
		final Locale locale = Locale.getDefault();
		try {
			return new GoliveOneProperties(locale);
		} catch (final IOException e) {
			logger.error("Erro ao Carregar o properties de labels do sistema, verifique se existe o label no container, label = {} ", locale);
			logger.error(e.getMessage());
			return new GoliveOneProperties();
		}

	}

}
