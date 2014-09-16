package br.com.golive.utils;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;

import javax.faces.application.FacesMessage;
import javax.faces.application.FacesMessage.Severity;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import br.com.golive.annotation.Jasper;
import br.com.golive.annotation.Label;
import br.com.golive.exception.GoLiveException;

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

	public static String getLabelPageName(final Class<?> clazz) {
		if (clazz == null) {
			throw new NullPointerException("Classe nula");
		} else if (clazz.isAnnotationPresent(Label.class)) {
			return clazz.getAnnotation(Label.class).name();
		}
		throw new GoLiveException("A classe " + clazz.getName() + "não foi anotada com a anotacao " + Label.class.getName());
	}

	public static String getLabelPageName(final Field field) {
		if (field == null) {
			throw new NullPointerException("Field nulo");
		} else if (field.isAnnotationPresent(Label.class)) {
			return field.getAnnotation(Label.class).name();
		}
		throw new GoLiveException("O Field " + field.getName() + "não foi anotada com a anotacao " + Label.class.getName());
	}

	public static void gerarPdf(final Class<?> clazz, final List<?> conteudo, final Map<String, Object> parametros, final GoliveOneProperties properties) {
		verificarProperiedades(clazz, conteudo, parametros, properties);

		final File jasper = new File(JSFUtils.getExternalContext().getRealPath("/jasper/br/com/golive/" + getJasperName(clazz) + ".jasper"));
		try {

			parametros.put("tittle", getTitulo(clazz));
			for (final Field field : clazz.getDeclaredFields()) {
				if (field.isAnnotationPresent(Label.class)) {
					parametros.put(field.getAnnotation(Label.class).name(), properties.getField(field.getAnnotation(Label.class).name()));
				}
			}
			final JasperPrint jasperPrint = JasperFillManager.fillReport(jasper.getPath(), parametros, new JRBeanCollectionDataSource(conteudo));

			final HttpServletResponse response = (HttpServletResponse) JSFUtils.getExternalContext().getResponse();
			response.addHeader("Content-disposition", "attachment; filename=" + getJasperName(clazz) + ".pdf");

			final ServletOutputStream stream = response.getOutputStream();

			JasperExportManager.exportReportToPdfStream(jasperPrint, stream);
			stream.flush();
			stream.close();
			FacesContext.getCurrentInstance().responseComplete();
		} catch (final JRException e) {
			e.printStackTrace();
		} catch (final IOException e) {
			e.printStackTrace();
		}

	}

	private static <T> String getTitulo(final Class<T> clazz) {
		if (clazz.isAnnotationPresent(Jasper.class)) {
			if (!clazz.getAnnotation(Jasper.class).titulo().isEmpty()) {
				return clazz.getAnnotation(Jasper.class).titulo();
			}
			throw new GoLiveException("Class " + clazz.getName() + " possui titulo do arquivo em branco");
		}
		throw new GoLiveException("Class " + clazz.getName() + " nao possui anotacao para geracao de relatório");
	}

	private static <T> String getJasperName(final Class<T> clazz) {
		if (clazz.isAnnotationPresent(Jasper.class)) {
			if (!clazz.getAnnotation(Jasper.class).nomeArquivoJasper().isEmpty()) {
				return clazz.getAnnotation(Jasper.class).nomeArquivoJasper();
			}
			throw new GoLiveException("Class " + clazz.getName() + " possui nome do arquivo em branco");
		}
		throw new GoLiveException("Class " + clazz.getName() + " nao possui anotacao para geracao de relatório");
	}

	private static void verificarProperiedades(final Object... parametros) {
		if (parametros == null) {
			throw new GoLiveException("Parametros nulos para geracao de relatório");
		}

		for (final Object param : parametros) {
			if (param == null) {
				throw new GoLiveException("Parametros nulos para geracao de relatório");
			}
		}
	}

}
