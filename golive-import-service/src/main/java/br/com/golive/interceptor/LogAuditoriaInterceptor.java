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

public class LogAuditoriaInterceptor {

	@Inject
	private Logger logger;

	@EJB
	private AuditoriaService auditoriaService;
	
	@Inject
	@UsuarioLogadoInjected
	private Usuario usuario;

	@AroundInvoke
	public Object interceptarCrud(final InvocationContext ctx) throws Exception {
		logger.info("Verificando método interceptado, iniciando verificação da operação");
		
		Object[] parameters 	= ctx.getParameters();
		Model model 			= (Model) parameters[0];
		Object ret 				= null;

		model.setDataAlteracao(Calendar.getInstance());
		if (!model.hasId()) {
			model.setDataInclusao(Calendar.getInstance());
		}


		if (ctx.getMethod().isAnnotationPresent(CrudOperation.class)) {
			if (ctx.getMethod().getAnnotation(CrudOperation.class).type().equals(DELETE)) {
				 auditoriaService.registrarDelete(model,usuario);
			}

			if (ctx.getMethod().getAnnotation(CrudOperation.class).type().equals(UPDATE)) {
				auditoriaService.registrarUpdate(model,usuario);
			}
			
			ret = ctx.proceed();

			if (ctx.getMethod().getAnnotation(CrudOperation.class).type().equals(INSERT)) {
				auditoriaService.registrarInsert(model,usuario);
			}
		}

		return ret;
	}

		
	


}
