package br.com.golive.bean.page.cadastro.rules;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import lombok.Data;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import br.com.golive.exception.GoLiveException;
import br.com.golive.qualifier.GeradorRelatorioInjected;
import br.com.golive.relatorio.GeradorRelatorio;
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
	protected Class<T> genericClazzInstance;
//	protected GeradorRelatorio relatorios;

	@Inject
	@GeradorRelatorioInjected
	protected GeradorRelatorio<T> relatorios;
	
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
		genericClazzInstance = (Class<T>) ((ParameterizedType) type).getActualTypeArguments()[0];
		relatorios.setClazz(genericClazzInstance);
	}

	public String nomePagina() {
		return JSFUtils.getLabelPageName(this.getClass());
	}

	public Class<?> getPojoClass(final String fieldName) {
		try {
			return Utils.getClazz(genericClazzInstance, fieldName);
		} catch (NoSuchFieldException | SecurityException e) {
			e.printStackTrace();
		}
		throw new GoLiveException("Erro ao obter classe de pojo, a classe: " + genericClazzInstance.getName() + " nao possui o campo: " + fieldName);
	}

	public void exportarPdf() {
		final File jasper = new File(FacesContext.getCurrentInstance().getExternalContext().getRealPath("/jasper/br/com/golive/relatorio_branco.jasper"));
		try {

			final Map<String, Object> parametros = new HashMap<String, Object>();

			parametros.put("tittle", "Relatório Teste");
			parametros.put("label.usuario", "Usuário Logado");
			parametros.put("usuarioLogado", "Guilherme Desenvolvimento");

			final JasperPrint jasperPrint = JasperFillManager.fillReport(jasper.getPath(), parametros, new JRBeanCollectionDataSource(conteudo));

			final HttpServletResponse response = (HttpServletResponse) FacesContext.getCurrentInstance().getExternalContext().getResponse();
			response.addHeader("Content-disposition", "attachment; filename=jsfReport.pdf");

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
