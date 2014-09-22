package br.com.golive.relatorio;

import java.io.File;
import java.io.IOException;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.faces.context.FacesContext;
import javax.imageio.ImageIO;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.print.attribute.HashPrintServiceAttributeSet;
import javax.print.attribute.PrintRequestAttributeSet;
import javax.print.attribute.PrintServiceAttributeSet;
import javax.print.attribute.standard.Destination;
import javax.print.attribute.standard.MediaSizeName;
import javax.print.attribute.standard.PrinterName;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import lombok.Data;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.design.JRDesignStyle;
import net.sf.jasperreports.engine.export.JRPrintServiceExporter;
import net.sf.jasperreports.engine.export.JRPrintServiceExporterParameter;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import net.sf.jasperreports.export.SimplePrintServiceExporterConfiguration;
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

	public void gerarRelatorio(final TipoRelatorio tipoRelatorio, final Class<?> clazz, final List<?> conteudo, final Map<String, Object> parametros, final GoliveOneProperties properties, final PrintService impressora) throws JRException, IOException, GoLiveException {
		init(clazz);
		verificarProperiedades(clazz, conteudo, parametros, properties);
		if (verificarClazz(clazz)) {

			inserirParametro(parametros, "tittle", getTitulo(clazz, properties));
			inserirParametro(parametros, "logoFooter", ImageIO.read(Thread.currentThread().getContextClassLoader().getResourceAsStream("footer.png")));
			inserirParametro(parametros, "label.pagina", properties.getField("label.pagina"));
			inserirParametro(parametros, "label.de", properties.getField("label.de"));

			for (final Field field : clazz.getDeclaredFields()) {
				if (field.isAnnotationPresent(Label.class)) {
					inserirParametro(parametros, field.getAnnotation(Label.class).name(), properties.getField(field.getAnnotation(Label.class).name()));
				}
			}

			final JRBeanCollectionDataSource source = new JRBeanCollectionDataSource(conteudo);
			final JasperPrint jasperPrint = JasperFillManager.fillReport(jasperFile.getPath(), parametros, source);

			if (tipoRelatorio.equals(TipoRelatorio.IMPRESSAO)) {

				if (impressora != null) {
					
					PrintRequestAttributeSet printRequestAttributeSet = new HashPrintRequestAttributeSet();
					printRequestAttributeSet.add(MediaSizeName.ISO_A4);
					
					
					PrintServiceAttributeSet printServiceAttributeSet = new HashPrintServiceAttributeSet();
//				    printServiceAttributeSet.add(new PrinterName(impressora.getName(), null));
				    printServiceAttributeSet.add(new PrinterName(impressora.getName(), Locale.getDefault()));
				    
					JRPrintServiceExporter exporter = new JRPrintServiceExporter();
					
					exporter.setExporterInput(new SimpleExporterInput(jasperPrint));

					SimplePrintServiceExporterConfiguration configuration = new SimplePrintServiceExporterConfiguration();
					configuration.setPrintRequestAttributeSet(printRequestAttributeSet);
					configuration.setPrintServiceAttributeSet(printServiceAttributeSet);
					configuration.setDisplayPageDialog(false);
					configuration.setDisplayPrintDialog(false);
					
					exporter.setConfiguration(configuration);
					
//					exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
//					exporter.setParameter(JRPrintServiceExporterParameter.PRINT_SERVICE_ATTRIBUTE_SET, impressora.getAttributes());
//					exporter.setParameter(JRPrintServiceExporterParameter.DISPLAY_PAGE_DIALOG, Boolean.FALSE);
//					exporter.setParameter(JRPrintServiceExporterParameter.DISPLAY_PRINT_DIALOG, Boolean.FALSE);
					exporter.exportReport();
				} else {
					throw new GoLiveException("Impressora nao foi selecionada");
				}

			} else {

				response.addHeader("Content-disposition", "attachment; filename=" + getNomeDoArquivo(clazz, properties) + "." + tipoRelatorio.getExtensao());
				ServletOutputStream stream = response.getOutputStream();

				if (tipoRelatorio.equals(TipoRelatorio.PDF)) {
					JasperExportManager.exportReportToPdfStream(jasperPrint, stream);
				} else if (tipoRelatorio.equals(TipoRelatorio.EXCEL)) {
					JRXlsxExporter exporter = new JRXlsxExporter();
					exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
					exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(stream));
					exporter.exportReport();
				}
				stream.flush();
				stream.close();
				FacesContext.getCurrentInstance().responseComplete();

			}

		}

	}

	private void inserirParametro(final Map<String, Object> parametros, final String key, final Object value) {
		if (parametros.containsKey(key)) {
			parametros.remove(key);
		}
		parametros.put(key, value);
	}

	private void init(final Class<?> clazz) {

		if (jasperFile == null) {
			jasperFile = new File(FacesContext.getCurrentInstance().getExternalContext().getRealPath("/jasper/br/com/golive/" + getJasperName(clazz) + ".jasper"));
		}

		if (facesContext == null) {
			facesContext = FacesContext.getCurrentInstance();
		}

		response = (HttpServletResponse) FacesContext.getCurrentInstance().getExternalContext().getResponse();
	}

	private boolean verificarClazz(final Class<?> clazzChild) {
		if (clazz.equals(clazzChild)) {
			return true;
		}

		for (final Field field : clazz.getDeclaredFields()) {
			if (field.getType().equals(clazzChild)) {
				return true;
			}
		}
		return false;
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
