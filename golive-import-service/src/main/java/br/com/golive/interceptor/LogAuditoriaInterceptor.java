package br.com.golive.interceptor;

import static br.com.golive.constants.Operation.DELETE;
import static br.com.golive.constants.Operation.INSERT;
import static br.com.golive.constants.Operation.UPDATE;

import java.util.Calendar;

import javax.ejb.EJB;
import javax.inject.Inject;
import javax.interceptor.AroundInvoke;
import javax.interceptor.InvocationContext;

import org.slf4j.Logger;

import br.com.golive.annotation.CrudOperation;
import br.com.golive.entity.Model;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.qualifier.UsuarioLogadoInjected;
import br.com.golive.service.AuditoriaService;
import br.com.golive.service.UsuarioBeanService;

public class LogAuditoriaInterceptor {

	@Inject
	private Logger logger;

	@EJB
	private AuditoriaService auditoriaService;

	@EJB
	private UsuarioBeanService usuarioBeanService;

	@Inject
	@UsuarioLogadoInjected
	private Usuario usuario;

	@AroundInvoke
	public Object interceptarCrud(final InvocationContext ctx) throws Exception {
		logger.info("Verificando metodo interceptado, iniciando verificação da operacao");
		Object ret = null;

		final Calendar logDate = Calendar.getInstance();

		logger.info("Carregando Usuario para geracao de log");
		final Usuario attached = usuarioBeanService.findById(usuario.getId());

		final Object[] parameters = ctx.getParameters();
		final Model model = (Model) parameters[0];

		model.setDataAlteracao(logDate);
		if (!model.hasId()) {
			model.setDataInclusao(logDate);
		}

		if (ctx.getMethod().isAnnotationPresent(CrudOperation.class)) {
			if (ctx.getMethod().getAnnotation(CrudOperation.class).type().equals(DELETE)) {
				logger.info("Interceptando Operacao de exclusao = {} ", model);
				auditoriaService.registrarDelete(model, attached);
			}

			if (ctx.getMethod().getAnnotation(CrudOperation.class).type().equals(UPDATE)) {
				logger.info("Interceptando Operacao de atualizacao = {} ", model);
				auditoriaService.registrarUpdate(model, attached);
			}

			ret = ctx.proceed();

			if (ctx.getMethod().getAnnotation(CrudOperation.class).type().equals(INSERT)) {
				logger.info("Interceptando Operacao de insert = {} ", model);
				auditoriaService.registrarInsert(model, attached);
			}
		}
		return ret;
	}

}
