package br.com.golive.utils;

import java.io.IOException;
import java.lang.reflect.Field;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.application.FacesMessage.Severity;
import javax.faces.component.UIComponent;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

import org.primefaces.context.RequestContext;

import br.com.golive.annotation.Label;
import br.com.golive.exception.GoLiveException;
import br.com.golive.utils.javascript.FuncaoJavaScript;

import com.ocpsoft.pretty.PrettyContext;
import com.ocpsoft.pretty.faces.config.mapping.UrlMapping;

public class JSFUtils {

	public static FacesContext getContext() {
		return FacesContext.getCurrentInstance();
	}

	public static ExternalContext getExternalContext() {
		return FacesContext.getCurrentInstance().getExternalContext();
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

	public static String getLabelPageName(final Class<?> clazz) throws NullPointerException, GoLiveException {
		if (clazz == null) {
			throw new NullPointerException("Classe nula");
		} else if (clazz.isAnnotationPresent(Label.class)) {
			return clazz.getAnnotation(Label.class).name();
		}
		throw new GoLiveException("A classe " + clazz.getName() + "não foi anotada com a anotacao " + Label.class.getName());
	}

	public static String getLabelFieldName(final Field field) {
		if (field == null) {
			throw new NullPointerException("Field nulo");
		} else if (field.isAnnotationPresent(Label.class)) {
			return field.getAnnotation(Label.class).name();
		}
		throw new GoLiveException("O Field " + field.getName() + "não foi anotada com a anotacao " + Label.class.getName());
	}

	public static void redirect(final String pagePath) throws IOException {
		getContext().getExternalContext().redirect("/golive-one" + pagePath);
	}

	public static void forward(final String pagePath) throws IOException {
		getContext().getExternalContext().dispatch(pagePath);
	}

	public static void chamarJs(final FuncaoJavaScript funcaoJavaScript) {

		final StringBuilder sb = new StringBuilder();
		sb.append(funcaoJavaScript.getNome());

		if (!funcaoJavaScript.getParametros().isEmpty()) {
			sb.append("(");
			for (final String parametro : funcaoJavaScript.getParametros()) {
				sb.append("'" + parametro + "', ");
			}
			sb.append(")");
		} else {
			sb.append("()");
		}

		RequestContext.getCurrentInstance().execute(sb.toString().replace(", )", ")"));
	}

	public static List<UrlMapping> getPrettyPages() {
		return PrettyContext.getCurrentInstance().getConfig().getMappings();
	}

	public static PrettyUrl getPrettyPageAtual() {
		return new PrettyUrl(PrettyContext.getCurrentInstance().getCurrentMapping());
	}

	public static UIComponent obterComponentXhtml(final String formId, final String componentId) {
		return getContext().getViewRoot().findComponent(formId).findComponent(componentId);
	}
	//
	// public static <T> boolean verificarColuna(final List<ColunaPerfil>
	// colunas, final String name) {
	// for (final ColunaPerfil conf : colunas) {
	// if (conf.getColuna().equals(name)) {
	// return true;
	// }
	// }
	// return false;
	// }

}
