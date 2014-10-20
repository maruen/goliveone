package br.com.golive.interceptor;

import java.util.Calendar;

import javax.inject.Inject;
import javax.interceptor.AroundInvoke;
import javax.interceptor.InvocationContext;

import org.slf4j.Logger;

import br.com.golive.annotation.CrudOperation;
import br.com.golive.annotation.Label;
import br.com.golive.constants.Operation;
import br.com.golive.entity.Model2;
import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.auditoria.repositorio.AuditoriaJPA;
import br.com.golive.entity.perfil.usuario.model.Usuario;
import br.com.golive.qualifier.UsuarioLogadoInjected;

public class LogAuditoriaInterceptor {

	@Inject
	private Logger logger;

	@Inject
	private AuditoriaJPA auditoriaJPA;

	@Inject
	@UsuarioLogadoInjected
	private Usuario usuario;

	@AroundInvoke
	public Object interceptarCrud(final InvocationContext ctx) throws Exception {
		logger.info("Verificando método interceptado, iniciando verificação da operação");
		final Object[] parameters = ctx.getParameters();

		final Model2 model = (Model2) parameters[0];
		Object ret = null;

		if (ctx.getMethod().isAnnotationPresent(CrudOperation.class)) {
			if (ctx.getMethod().getAnnotation(CrudOperation.class).type().equals(Operation.DELETE)) {
				// TODO Implementar exclusao do log
			}
			ret = ctx.proceed();

			if (!ctx.getMethod().getAnnotation(CrudOperation.class).type().equals(Operation.DELETE)) {
				inserirLogEntidade(ctx, model);
			}
		}
		return ret;
	}

	private void inserirLogEntidade(final InvocationContext ctx, final Model2 model) {
		final AuditoriaModel auditoria = new AuditoriaModel();
		final Calendar cal = Calendar.getInstance();
		auditoria.setDataInclusao(cal);
		auditoria.setDataAlteracao(cal);
		auditoria.setFormularioNome(model.getClass().getAnnotation(Label.class).name());
		auditoria.setAcaoUsuario(ctx.getMethod().getAnnotation(CrudOperation.class).type().getDescricao());
		auditoriaJPA.save(auditoria);
		auditoriaJPA.executarQueryLigacao(auditoria, usuario, model);
	}

}
