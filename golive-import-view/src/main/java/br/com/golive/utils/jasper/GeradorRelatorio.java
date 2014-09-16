package br.com.golive.utils.jasper;

import java.io.File;
import java.io.IOException;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;

import javax.faces.context.FacesContext;
import javax.imageio.ImageIO;
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
import br.com.golive.utils.GoliveOneProperties;
import br.com.golive.utils.JSFUtils;

public class GeradorRelatorio {

	public void gerarPdf(final Class<?> clazz, final List<?> conteudo, final Map<String, Object> parametros, final GoliveOneProperties properties) throws JRException, IOException, GoLiveException {
		verificarProperiedades(clazz, conteudo, parametros, properties);

		final File jasper = new File(JSFUtils.getExternalContext().getRealPath("/jasper/br/com/golive/" + getJasperName(clazz) + ".jasper"));

		parametros.put("tittle", getTitulo(clazz, properties));
		parametros.put("label.usuario", properties.getField("label.usuario"));
		parametros.put("logoFooter", ImageIO.read(Thread.currentThread().getContextClassLoader().getResourceAsStream("footer.png")));

		for (final Field field : clazz.getDeclaredFields()) {
			if (field.isAnnotationPresent(Label.class)) {
				parametros.put(field.getAnnotation(Label.class).name(), properties.getField(field.getAnnotation(Label.class).name()));
			}
		}
		final JasperPrint jasperPrint = JasperFillManager.fillReport(jasper.getPath(), parametros, new JRBeanCollectionDataSource(conteudo));

		final HttpServletResponse response = (HttpServletResponse) JSFUtils.getExternalContext().getResponse();
		response.addHeader("Content-disposition", "attachment; filename=" + getNomeDoArquivo(clazz, properties) + ".pdf");

		final ServletOutputStream stream = response.getOutputStream();

		JasperExportManager.exportReportToPdfStream(jasperPrint, stream);
		stream.flush();
		stream.close();
		FacesContext.getCurrentInstance().responseComplete();

	}

	private String getNomeDoArquivo(final Class<?> clazz, final GoliveOneProperties properties) throws GoLiveException {
		verificarAnnotation(clazz, Jasper.class);
		if (!clazz.getAnnotation(Jasper.class).nomeArquivoJasper().isEmpty()) {
			return properties.getField(clazz.getAnnotation(Jasper.class).nomeDoArquivoGerado());
		}
		throw new GoLiveException("Class " + clazz.getName() + " possui nome do arquivo final em branco");
	}

	private String getTitulo(final Class<?> clazz, final GoliveOneProperties properties) throws GoLiveException {
		verificarAnnotation(clazz, Jasper.class);
		if (!clazz.getAnnotation(Jasper.class).titulo().isEmpty()) {
			return properties.getField(clazz.getAnnotation(Jasper.class).titulo());
		}
		throw new GoLiveException("Class " + clazz.getName() + " possui titulo do arquivo em branco");
	}

	private String getJasperName(final Class<?> clazz) throws GoLiveException {
		verificarAnnotation(clazz, Jasper.class);
		if (!clazz.getAnnotation(Jasper.class).nomeArquivoJasper().isEmpty()) {
			return clazz.getAnnotation(Jasper.class).nomeArquivoJasper();
		}
		throw new GoLiveException("Class " + clazz.getName() + " possui nome do arquivo jasper em branco");
	}

	private void verificarAnnotation(final Class<?> clazz, final Class<? extends Annotation> annotation) throws GoLiveException {
		if (!clazz.isAnnotationPresent(annotation)) {
			throw new GoLiveException("Class " + clazz.getName() + " nao possui anotacao para geracao de relatório");
		}
	}

	private void verificarProperiedades(final Object... parametros) {
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
