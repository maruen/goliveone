package br.com.golive.utils;

import java.lang.reflect.Field;

import javax.faces.application.FacesMessage;
import javax.faces.application.FacesMessage.Severity;
import javax.faces.context.FacesContext;

import br.com.golive.annotation.LabelPage;
import br.com.golive.exception.GoLiveException;

public class JSFUtils {

	public static FacesContext getContext() {
		return FacesContext.getCurrentInstance();
	}

	public static void infoMessage(final String titulo, final String msg) {
		message(FacesMessage.SEVERITY_INFO, titulo, msg);
	}

	public static void warnMessage(final String titulo, final String msg) {
		message(FacesMessage.SEVERITY_WARN, titulo, msg);
	}

	public static void errorMessage(final String titulo, final String msg) {
		message(FacesMessage.SEVERITY_ERROR, titulo, msg);
	}

	public static void fatalMessage(final String titulo, final String msg) {
		message(FacesMessage.SEVERITY_FATAL, titulo, msg);
	}

	private static void message(final Severity typeMessage, final String titulo, final String msg) {
		getContext().addMessage(null, new FacesMessage(typeMessage, titulo, msg));
	}

	public static String getLabelPageName(final Class<?> clazz){
		if(clazz == null){
			throw new NullPointerException("Classe nula");
		} else if(clazz.isAnnotationPresent(LabelPage.class)){
			return clazz.getAnnotation(LabelPage.class).name();			
		}
		throw new GoLiveException("A classe " + clazz.getName() + "não foi anotada com a anotacao " + LabelPage.class.getName());
	}
	

	public static String getLabelPageName(final Field field){
		if(field == null){
			throw new NullPointerException("Field nulo");
		} else if(field.isAnnotationPresent(LabelPage.class)){
			return field.getAnnotation(LabelPage.class).name();			
		}
		throw new GoLiveException("O Field " + field.getName() + "não foi anotada com a anotacao " + LabelPage.class.getName());
	}
	
	
}
