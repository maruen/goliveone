package br.com.golive.interceptor;

import java.util.Calendar;

import javax.ejb.EJB;
import javax.inject.Inject;
import javax.interceptor.AroundInvoke;
import javax.interceptor.InvocationContext;

import org.slf4j.Logger;

import br.com.golive.annotation.CrudOperation;
import br.com.golive.constants.Operation;
import br.com.golive.entity.Model;
import br.com.golive.entity.empresas.empresa.model.Empresa;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.service.AuditoriaService;
import br.com.golive.service.UsuarioBeanService;

public class LogAuditoriaInterceptor {

	@Inject
	private Logger logger;

	@EJB
	private AuditoriaService auditoriaService;

	@EJB
	private UsuarioBeanService usuarioBeanService;

	@AroundInvoke
	public Object interceptarCrud(final InvocationContext ctx) throws Exception {
		logger.info("Verificando metodo interceptado, iniciando verificação da operacao");
		Object ret = null;

		final Object[] parameters = ctx.getParameters();
		final Model model = (Model) parameters[2];

		final Calendar logDate = Calendar.getInstance();

		logger.info("Carregando Usuario para geracao de log");
		final Usuario attached = usuarioBeanService.findById(((Usuario) parameters[0]).getId());

		model.setDataAlteracao(logDate);
		if (!model.hasId()) {
			model.setDataInclusao(logDate);
		}

		if (ctx.getMethod().isAnnotationPresent(CrudOperation.class)) {
			if (ctx.getMethod().getAnnotation(CrudOperation.class).type().equals(Operation.DELETE)) {
				logger.info("Interceptando Operacao de exclusao = {} ", model);
				auditoriaService.registrarDelete(attached, new Empresa(), model);
			}

			if (ctx.getMethod().getAnnotation(CrudOperation.class).type().equals(Operation.UPDATE)) {
				logger.info("Interceptando Operacao de atualizacao = {} ", model);
				auditoriaService.registrarUpdate(attached, new Empresa(), model);
			}

			ret = ctx.proceed();

			if (ctx.getMethod().getAnnotation(CrudOperation.class).type().equals(Operation.INSERT)) {
				logger.info("Interceptando Operacao de insert = {} ", model);
				auditoriaService.registrarInsert(attached, new Empresa(), model);
			}
		}
		return ret;
	}

}
