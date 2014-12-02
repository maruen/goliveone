package br.com.golive.interceptor;

import javax.inject.Inject;
import javax.interceptor.AroundInvoke;
import javax.interceptor.InvocationContext;

import org.slf4j.Logger;

public class EntityManagerInjectionInterceptor {

	@Inject
	private Logger logger;

	@AroundInvoke
	public Object interceptarCrud(final InvocationContext ctx) throws Exception {
		logger.info("Verificando metodo interceptado, iniciando verificação da operacao");
		Object ret = null;
		//
		// final Object[] parameters = ctx.getParameters();
		// final Model model = (Model) parameters[2];
		// final Usuario usuario = (Usuario) parameters[0];

		// Inserir funcionalidades antes da execucao do metodo do ejb

		// ctx.proceed executa o metodo interpectado
		ret = ctx.proceed();

		// System.out.println("Interceptou metodo do ejb " + model + usuario);
		// se precisar executar final do metodo

		return ret;

	}

}
