package br.com.golive.relatorio;

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

import lombok.Data;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;
import net.sf.jasperreports.export.PdfExporterConfiguration;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import net.sf.jasperreports.export.SimplePdfExporterConfiguration;
import br.com.golive.annotation.Jasper;
import br.com.golive.annotation.Label;
import br.com.golive.constants.TipoRelatorio;
import br.com.golive.exception.GoLiveException;
import br.com.golive.utils.GoliveOneProperties;

@Data
public class GeradorRelatorio<T> {

	private Class<T> clazz;
	private File jasperFile;
	private FacesContext facesContext;
	private HttpServletResponse response;

	public GeradorRelatorio() throws GoLiveException {
		super();
	}

	public void gerarRelatorio(final TipoRelatorio tipoRelatorio, final List<?> conteudo, final Map<String, Object> parametros, final GoliveOneProperties properties) throws JRException, IOException, GoLiveException {
		init();
		verificarProperiedades(conteudo, parametros, properties);

		prepararParametrosDeTemplate(clazz, parametros, properties);

		for (final Field field : clazz.getDeclaredFields()) {
			if (!inserirParametroAnotado(parametros, properties, field)) {
				for (final Field fieldChild : field.getType().getDeclaredFields()) {
					inserirParametroAnotado(parametros, properties, fieldChild);
				}
			}
		}

		prepararImpressao(tipoRelatorio, clazz, conteudo, parametros, properties);

	}

	private void prepararParametrosDeTemplate(final Class<?> clazz, final Map<String, Object> parametros, final GoliveOneProperties properties) throws IOException {
		inserirParametro(parametros, "tittle", getTitulo(clazz, properties));
		inserirParametro(parametros, "logoFooter", ImageIO.read(Thread.currentThread().getContextClassLoader().getResourceAsStream("footer.png")));
		inserirParametro(parametros, "label.pagina", properties.getField("label.pagina"));
		inserirParametro(parametros, "label.de", properties.getField("label.de"));
	}

	private void prepararImpressao(final TipoRelatorio tipoRelatorio, final Class<?> clazz, final List<?> conteudo, final Map<String, Object> parametros, final GoliveOneProperties properties) throws JRException, IOException {
		final JRBeanCollectionDataSource source = new JRBeanCollectionDataSource(conteudo);
		final JasperPrint jasperPrint = JasperFillManager.fillReport(jasperFile.getPath(), parametros, source);
		ServletOutputStream stream;

		if (tipoRelatorio.equals(TipoRelatorio.IMPRESSAO)) {
			stream = response.getOutputStream();
			gerarImpressao(jasperPrint, stream);

		} else {
			response.addHeader("Content-disposition", "attachment; filename=" + getNomeDoArquivo(clazz, properties) + "." + tipoRelatorio.getExtensao());
			stream = response.getOutputStream();
			gerarArquivos(tipoRelatorio, jasperPrint, stream);
		}
		stream.flush();
		stream.close();
		FacesContext.getCurrentInstance().responseComplete();
	}

	private boolean inserirParametroAnotado(final Map<String, Object> parametros, final GoliveOneProperties properties, final Field fieldChild) {
		if (fieldChild.isAnnotationPresent(Label.class)) {
			inserirParametro(parametros, fieldChild.getAnnotation(Label.class).name(), properties.getField(fieldChild.getAnnotation(Label.class).name()));
			return true;
		}
		return false;
	}

	private void gerarArquivos(final TipoRelatorio tipoRelatorio, final JasperPrint jasperPrint, final ServletOutputStream stream) throws JRException {
		if (tipoRelatorio.equals(TipoRelatorio.PDF)) {
			JasperExportManager.exportReportToPdfStream(jasperPrint, stream);
			FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("TESTE", JasperExportManager.exportReportToPdf(jasperPrint));

		} else if (tipoRelatorio.equals(TipoRelatorio.EXCEL)) {
			final JRXlsxExporter exporter = new JRXlsxExporter();
			exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
			exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(stream));
			exporter.exportReport();
		}
	}

	private void gerarImpressao(final JasperPrint jasperPrint, final ServletOutputStream stream) throws IOException, JRException {
		

		final JRPdfExporter exporter = new JRPdfExporter();
		final SimplePdfExporterConfiguration configuration = new SimplePdfExporterConfiguration();
		configuration.setPdfJavaScript(PdfExporterConfiguration.PROPERTY_PDF_JAVASCRIPT);
		exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
		exporter.setConfiguration(configuration);
		exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(stream));
		exporter.exportReport();
	}

	private void inserirParametro(final Map<String, Object> parametros, final String key, final Object value) {
		if (parametros.containsKey(key)) {
			parametros.remove(key);
		}
		parametros.put(key, value);
	}

	private void init() {

		if (jasperFile == null) {
			jasperFile = new File(FacesContext.getCurrentInstance().getExternalContext().getRealPath("/jasper/br/com/golive/" + getJasperName(clazz) + ".jasper"));
		}

		if (facesContext == null) {
			facesContext = FacesContext.getCurrentInstance();
		}

		response = (HttpServletResponse) FacesContext.getCurrentInstance().getExternalContext().getResponse();
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

	public Class<T> getClazz() {
		return clazz;
	}

	public void setClazz(final Class<T> clazz) {
		this.clazz = clazz;
	}

	public File getJasperFile() {
		return jasperFile;
	}

	public void setJasperFile(final File jasperFile) {
		this.jasperFile = jasperFile;
	}

	public FacesContext getFacesContext() {
		return facesContext;
	}

	public void setFacesContext(final FacesContext facesContext) {
		this.facesContext = facesContext;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(final HttpServletResponse response) {
		this.response = response;
	}

}
