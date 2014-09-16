package br.com.golive.bean.page.cadastro.rules;

import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.lucene.util.Constants;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JRParameter;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.util.JRLoader;
import lombok.Data;
import br.com.golive.exception.GoLiveException;
import br.com.golive.utils.Fluxo;
import br.com.golive.utils.JSFUtils;
import br.com.golive.utils.Utils;

@Data
@ManagedBean
@ViewScoped
public abstract class CadastroBeanRules<T> implements Serializable {

	private static final long serialVersionUID = 1L;

	@Deprecated
	protected boolean implementada = true;

	protected List<T> conteudo;
	protected List<T> filtrados;
	protected T registro;
	protected Fluxo fluxo;
	protected Class<T> clazz;

	public abstract void init();

	public abstract void imprimir();

	public abstract void exportarXls();

	protected void init(final List<T> listaConteudo) {
		this.conteudo = listaConteudo;
		this.filtrados = new ArrayList<T>();
		fluxo = getFluxoListagem();
		inicializarClasse();
	}

	@SuppressWarnings("unchecked")
	private void inicializarClasse() {
		Type type = getClass().getGenericSuperclass();
		if (!(type instanceof ParameterizedType)) {
			type = this.getClass().getSuperclass().getGenericSuperclass();
		}
		clazz = (Class<T>) ((ParameterizedType) type).getActualTypeArguments()[0];
	}

	public String nomePagina() {
		return JSFUtils.getLabelPageName(this.getClass());
	}

	public Class<?> getPojoClass(final String fieldName) {
		try {
			return Utils.getClazz(clazz, fieldName);
		} catch (NoSuchFieldException | SecurityException e) {
			e.printStackTrace();
		}
		throw new GoLiveException("Erro ao obter classe de pojo, a classe: "
				+ clazz.getName() + " nao possui o campo: " + fieldName);
	}

	public void exportarPdf() {
		 File jasper = new File(FacesContext.getCurrentInstance().getExternalContext().getRealPath("/jasper/br/com/golive/relatorio_branco.jasper"));
		try {
			
			Map<String, Object> parametros = new HashMap<String, Object>();

			parametros.put("tittle", "Relatório Teste");
			parametros.put("label.usuario", "Usuário Logado");
			parametros.put("usuarioLogado", "Guilherme Desenvolvimento");
			
			 JasperPrint jasperPrint = JasperFillManager.fillReport(jasper.getPath(), parametros,
			 new JRBeanCollectionDataSource(conteudo));
			
			 
			 HttpServletResponse response = (HttpServletResponse) FacesContext
			 .getCurrentInstance().getExternalContext().getResponse();
			 response.addHeader("Content-disposition",
			 "attachment; filename=jsfReport.pdf");
			
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

	public void incluir() {
		fluxoInclusao();
	}

	public void editarRegistro() {
		fluxoEdicao();
	}

	public void excluir() {
		fluxoListagem();
	}

	public void salvar() {
		fluxoListagem();
	}

	public void cancelar() {
		fluxoListagem();
		registro = null;
	}

	private void fluxoListagem() {
		fluxo = Fluxo.LISTAGEM;
	}

	private void fluxoEdicao() {
		fluxo = Fluxo.EDICAO;
	}

	private void fluxoInclusao() {
		fluxo = Fluxo.INCLUSAO;
	}

	public Fluxo getFluxoListagem() {
		return Fluxo.LISTAGEM;
	}

	public Fluxo getFluxoInclusao() {
		return Fluxo.INCLUSAO;
	}

	public Fluxo getFluxoEdicao() {
		return Fluxo.EDICAO;
	}

}
