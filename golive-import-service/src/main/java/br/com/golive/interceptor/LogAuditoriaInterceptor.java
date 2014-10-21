package br.com.golive.interceptor;

import static br.com.golive.constants.Operation.DELETE;
import static br.com.golive.constants.Operation.INSERT;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.interceptor.AroundInvoke;
import javax.interceptor.InvocationContext;

import org.slf4j.Logger;

import br.com.golive.annotation.CrudOperation;
import br.com.golive.annotation.Label;
import br.com.golive.entity.Model;
import br.com.golive.entity.auditoria.model.AuditoriaItemModel;
import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.auditoria.repositorio.AuditoriaItemJPA;
import br.com.golive.entity.auditoria.repositorio.AuditoriaJPA;
import br.com.golive.entity.perfil.usuario.model.Usuario;
import br.com.golive.qualifier.UsuarioLogadoInjected;

public class LogAuditoriaInterceptor {

	@Inject
	private Logger logger;

	@Inject
	private AuditoriaJPA auditoriaJPA;
	
	@Inject
	private AuditoriaItemJPA auditoriaItemJPA;
	

	@Inject
	@UsuarioLogadoInjected
	private Usuario usuario;

	@AroundInvoke
	public Object interceptarCrud(final InvocationContext ctx) throws Exception {
		logger.info("Verificando método interceptado, iniciando verificação da operação");
		final Object[] parameters = ctx.getParameters();

		final Model model = (Model) parameters[0];
		Object ret = null;

		if (ctx.getMethod().isAnnotationPresent(CrudOperation.class)) {
			if (ctx.getMethod().getAnnotation(CrudOperation.class).type().equals(DELETE)) {

			}
			ret = ctx.proceed();

			if (ctx.getMethod().getAnnotation(CrudOperation.class).type().equals(INSERT)) {
				inserirLogEntidade(ctx, model);
			}
		}
		
		return ret;
	}

	private void inserirLogEntidade(final InvocationContext ctx, final Model model) {
		
		List<AuditoriaItemModel> auditoriaItemList = new ArrayList<AuditoriaItemModel>();
		AuditoriaItemModel auditoriaItem = new AuditoriaItemModel();
		
		Field[] fields = model.getClass().getDeclaredFields();
		for(int i=0; i< fields.length; i++ ) {
			String fieldName  = fields[i].getName();
			if (fieldName.contains("serialVersion")) {
				continue;
			}
			
			fields[i].setAccessible(true);
			String fieldValue;
			try {
				fieldValue = String.valueOf(fields[i].get(model));
			} catch (IllegalArgumentException | IllegalAccessException e) {
				continue;
			} 
			
			auditoriaItem.setCampo(fieldName);
			auditoriaItem.setInformacaoAnterior("");
			auditoriaItem.setInformacaoAtual(fieldValue);
			auditoriaItem.setDataInclusao(Calendar.getInstance());
			auditoriaItem.setDataAlteracao(Calendar.getInstance());
			auditoriaItemList.add(auditoriaItem);
		}
		auditoriaItemJPA.saveAll(auditoriaItemList);
		
				
		AuditoriaModel auditoria = new AuditoriaModel();
		auditoria.setDataInclusao(Calendar.getInstance());
		auditoria.setDataAlteracao(Calendar.getInstance());
		auditoria.setFormularioNome(model.getClass().getAnnotation(Label.class).name());
		auditoria.setAcaoUsuario(ctx.getMethod().getAnnotation(CrudOperation.class).type().getDescricao());
		auditoriaJPA.save(auditoria);
		auditoriaJPA.saveJoins(auditoria, auditoriaItemList, usuario, model);
		auditoriaItemJPA.saveJoins(auditoria,auditoriaItemList,usuario);
		
		
	}

}
