package br.com.golive.utils.jasper;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.faces.context.FacesContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import br.com.golive.annotation.Jasper;
import br.com.golive.exception.GoLiveException;
import br.com.golive.utils.JSFUtils;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

public class GeradorRelatorio<T> {

	public void exportarPdf(final Class<T> clazz, final List<T> conteudo, final Map<String, Object> parametros) {
		verificarProperiedades(clazz, conteudo, parametros);
		
		File jasper = new File(JSFUtils.getExternalContext().getRealPath("/jasper/br/com/golive/" + getJasperName(clazz)));
		try {
			
			parametros.put("tittle", getTitulo(clazz));
				//TODO Arrumar os labels
			 JasperPrint jasperPrint = JasperFillManager.fillReport(jasper.getPath(), parametros,  new JRBeanCollectionDataSource(conteudo));
			
			 HttpServletResponse response = (HttpServletResponse) JSFUtils.getExternalContext().getResponse();
			 response.addHeader("Content-disposition", "attachment; filename=jsfReport.pdf");
			
			 ServletOutputStream stream = response.getOutputStream();
			
			 JasperExportManager.exportReportToPdfStream(jasperPrint, stream);
			 stream.flush();
			 stream.close();
			 FacesContext.getCurrentInstance().responseComplete();			
		} catch (JRException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	private String getTitulo(final Class<T> clazz){
		if(clazz.isAnnotationPresent(Jasper.class)){
			if(!clazz.getAnnotation(Jasper.class).titulo().isEmpty()){
				return clazz.getAnnotation(Jasper.class).titulo();	
			}
			throw new GoLiveException("Class "+clazz.getName()+" possui titulo do arquivo em branco");
		}
		throw new GoLiveException("Class "+clazz.getName()+" nao possui anotacao para geracao de relatório");
	}
	
	private String getJasperName(final Class<T> clazz){
		if(clazz.isAnnotationPresent(Jasper.class)){
			if(!clazz.getAnnotation(Jasper.class).nomeArquivoJasper().isEmpty()){
				return clazz.getAnnotation(Jasper.class).nomeArquivoJasper();	
			}
			throw new GoLiveException("Class "+clazz.getName()+" possui nome do arquivo em branco");
		}
		throw new GoLiveException("Class "+clazz.getName()+" nao possui anotacao para geracao de relatório");
	}
	
	private void verificarProperiedades(final Class<T> clazz, final List<T> conteudo, final Map<String, Object> parametros){
		if((clazz == null) || (conteudo == null) || (parametros == null)){
			throw new GoLiveException("Parametros nulos para geracao de relatório");
		} 
	}
	
}
