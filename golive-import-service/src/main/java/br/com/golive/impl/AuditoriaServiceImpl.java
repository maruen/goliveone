package br.com.golive.impl;

import static br.com.golive.constants.Operation.DELETE;
import static br.com.golive.constants.Operation.INSERT;
import static br.com.golive.constants.Operation.UPDATE;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.inject.Inject;
import javax.persistence.Column;
import javax.persistence.JoinTable;
import javax.persistence.Transient;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.entity.Model;
import br.com.golive.entity.auditoria.model.AuditoriaItemModel;
import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.auditoria.repositorio.AuditoriaItemJPA;
import br.com.golive.entity.auditoria.repositorio.AuditoriaJPA;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.service.AuditoriaService;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class AuditoriaServiceImpl implements AuditoriaService {

	@Inject
	private Logger logger;

	@Inject
	private AuditoriaJPA auditoriaJPA;

	@Inject
	private AuditoriaItemJPA auditoriaItemJPA;

	private static String EMPTY_STRING = "";
	
	private static String SERIAL_VERSION = "serialVersion";
	

	@Override
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void registrarInsert(final Model model, final Usuario usuario) {
		logger.info("Registrando uma insercão na auditoria.");

		List<AuditoriaItemModel> auditoriaItemList;
		AuditoriaItemModel auditoriaItem;
		Field[] fields;
		AuditoriaModel auditoriaModel;

		auditoriaItemList = new ArrayList<AuditoriaItemModel>();

		fields = model.getClass().getDeclaredFields();
		for (int i = 0; i < fields.length; i++) {
			if (skipField(fields[i])) {
				continue;
			}

			fields[i].setAccessible(true);
			String fieldValue;
			try {
				fieldValue = String.valueOf(fields[i].get(model));
			} catch (IllegalArgumentException | IllegalAccessException e) {
				continue;
			}

			auditoriaItem = new AuditoriaItemModel();
			auditoriaItem.setCampo(fields[i].getName());
			auditoriaItem.setInformacaoAnterior(EMPTY_STRING);
			auditoriaItem.setInformacaoAtual(fieldValue);
			auditoriaItem.setDataInclusao(Calendar.getInstance());
			auditoriaItem.setDataAlteracao(Calendar.getInstance());
			auditoriaItemList.add(auditoriaItem);
		}
		auditoriaItemJPA.saveAll(auditoriaItemList);

		auditoriaModel = new AuditoriaModel();
		auditoriaModel.setDataInclusao(Calendar.getInstance());
		auditoriaModel.setDataAlteracao(Calendar.getInstance());
		try {
			auditoriaModel.setFormularioNome(model.getClass().getAnnotation(Label.class).name());
		} catch(Exception e) {
			auditoriaModel.setFormularioNome("Formulário não especificado");
		}
		auditoriaModel.setAcaoUsuario(INSERT.getDescricao());
		auditoriaJPA.save(auditoriaModel);
		auditoriaJPA.saveJoins(auditoriaModel, auditoriaItemList, usuario, model);
		auditoriaItemJPA.saveJoins(auditoriaModel, auditoriaItemList, usuario);
	}

	@Override
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void registrarUpdate(final Model model, final Usuario usuario) {

		List<AuditoriaItemModel> auditoriaItemList;
		AuditoriaItemModel auditoriaItem;
		Field[] fields;
		AuditoriaModel auditoriaModel;

		auditoriaItemList = new ArrayList<AuditoriaItemModel>();
		

		auditoriaJPA.getEntityManager().detach(model);
		final Criteria crit = auditoriaJPA.createCriteria(model.getClass());
		crit.add(Restrictions.eq("id", model.getId()));
		final Object objBeforeUpdate = crit.uniqueResult();

		fields = model.getClass().getDeclaredFields();
		for (int i = 0; i < fields.length; i++) {

			if (skipField(fields[i])) {
				continue;
			}

			fields[i].setAccessible(true);
			String fieldValue;
			String previousValue;
			try {
				fieldValue = String.valueOf(fields[i].get(model));
				previousValue = String.valueOf(fields[i].get(objBeforeUpdate));
				if ((fieldValue != null) && fieldValue.equals(previousValue)) {
					continue;
				}
			} catch (IllegalArgumentException | IllegalAccessException e) {
				continue;
			}

			auditoriaItem = new AuditoriaItemModel();
			auditoriaItem.setCampo(fields[i].getName());
			auditoriaItem.setInformacaoAnterior(previousValue);
			auditoriaItem.setInformacaoAtual(fieldValue);
			auditoriaItem.setDataInclusao(Calendar.getInstance());
			auditoriaItem.setDataAlteracao(Calendar.getInstance());
			auditoriaItemList.add(auditoriaItem);
			auditoriaItemJPA.save(auditoriaItem);
		}

		auditoriaModel = new AuditoriaModel();
		auditoriaModel.setDataInclusao(Calendar.getInstance());
		auditoriaModel.setDataAlteracao(Calendar.getInstance());
		try {
			auditoriaModel.setFormularioNome(model.getClass().getAnnotation(Label.class).name());
		} catch(Exception e) {
			auditoriaModel.setFormularioNome("Formulário não especificado");
		}
		auditoriaModel.setAcaoUsuario(UPDATE.getDescricao());
		auditoriaJPA.save(auditoriaModel);
		auditoriaJPA.saveJoins(auditoriaModel, auditoriaItemList, usuario, model);
		auditoriaItemJPA.saveJoins(auditoriaModel, auditoriaItemList, usuario);
	}

	@Override
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void registrarDelete(final Model model, final Usuario usuario) {

		auditoriaJPA.deleteJoins(model);

		AuditoriaModel auditoriaModel;
		auditoriaModel = new AuditoriaModel();
		auditoriaModel.setDataInclusao(Calendar.getInstance());
		auditoriaModel.setDataAlteracao(Calendar.getInstance());
		try {
			auditoriaModel.setFormularioNome(model.getClass().getAnnotation(Label.class).name());
		} catch(Exception e) {
			auditoriaModel.setFormularioNome("Formulário não especificado");
		}
		auditoriaModel.setAcaoUsuario(DELETE.getDescricao());
		auditoriaJPA.save(auditoriaModel);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AuditoriaModel> getAuditoriaLogs(final Model model) {
		logger.info("Buscando logs de auditoria = {}", model);
		return auditoriaJPA.getAuditoriaLogs(model.getId(), model.getClass());
	}
	
	private boolean skipField(final Field field) {
		
		if ( field.getName().contains(SERIAL_VERSION)  ) {
			return true;
		}
		
		if ( field.isAnnotationPresent(Transient.class)) {
			 return true;
	    }
		 
		if ( (!field.isAnnotationPresent(Column.class) && !field.isAnnotationPresent(JoinTable.class)) ) { 
			 return true;
		
		} 
		return false;
	
	}
	
}
