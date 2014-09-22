package br.com.golive.bean.page.cadastro.rules;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;

import lombok.Data;
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
	protected String nomeDaImpressoraSelecionada;
	protected PrintService [] impressoras;
	protected PrintService impressoraSelecionada;
	@Inject
	@GeradorRelatorioInjected
	protected GeradorRelatorio<T> relatorios;
	
	public abstract void init();
	public abstract void imprimir();
	public abstract void exportarXls();
	public abstract void exportarPdf();
	public abstract Map<String, Object> obterParametrosRelatório();
	public abstract boolean isSelecionado();

	
	protected void init(final List<T> listaConteudo) {
		this.conteudo = listaConteudo;
		this.filtrados = new ArrayList<T>();
		filtrados.addAll(conteudo);
		fluxo = getFluxoListagem();
		inicializarClasse();
		impressoras = PrintServiceLookup.lookupPrintServices(null, null);
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

	public void selecionarImpressoraPorNome(){
		for (PrintService impressora : impressoras) {
			if(impressora.toString().equals(nomeDaImpressoraSelecionada)){
				impressoraSelecionada = impressora;
			}
		}
	}
	
	public void incluir() {
		fluxo = getFluxoInclusao();
	}

	public void editarRegistro() {
		fluxo = getFluxoEdicao();
	}

	public void excluir() {
		fluxo = getFluxoListagem();
	}

	public void salvar() {
		fluxo = getFluxoListagem();
	}

	public void cancelar() {
		fluxo = getFluxoListagem();
		registro = null;
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
