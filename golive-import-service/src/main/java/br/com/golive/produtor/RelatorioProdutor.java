package br.com.golive.produtor;

import javax.enterprise.inject.Produces;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.exception.GoLiveException;
import br.com.golive.qualifier.GeradorRelatorioInjected;
import br.com.golive.relatorio.GeradorRelatorio;

public class RelatorioProdutor {

	@Inject
	private Logger logger;

	@Produces
	@GeradorRelatorioInjected
	public <T> GeradorRelatorio<T> getRelatorio() {
		try {
			return new GeradorRelatorio<T>();
		} catch (final SecurityException e) {
			logger.error("Erro ao injetar GeradorRelatorio");
		} catch (final GoLiveException e) {
			logger.warn("Usuario não logado, tentando acessar urls do sistema");
		}
		return null;
	}
}
