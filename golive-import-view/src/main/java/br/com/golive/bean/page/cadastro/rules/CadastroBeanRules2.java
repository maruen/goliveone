package br.com.golive.bean.page.cadastro.rules;

import java.io.IOException;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.imageio.ImageIO;
import javax.inject.Inject;
import javax.persistence.Column;

import net.sf.jasperreports.engine.JRException;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang.WordUtils;
import org.primefaces.component.datatable.DataTable;
import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.annotation.PrimeInfoList;
import br.com.golive.annotation.PropriedadesTemplate;
import br.com.golive.bean.page.manager.GenericBean;
import br.com.golive.constants.ChaveSessao;
import br.com.golive.constants.TipoRelatorio;
import br.com.golive.entity.ColunaPerfil;
import br.com.golive.exception.GoLiveException;
import br.com.golive.filter.FilterManager;
import br.com.golive.filter.GoliveFilter;
import br.com.golive.qualifier.FilterInjected;
import br.com.golive.qualifier.GeradorRelatorioInjected;
import br.com.golive.qualifier.ListColunaInjected;
import br.com.golive.qualifier.ListGenericaInjected;
import br.com.golive.qualifier.PrimefacesDataTableInjected;
import br.com.golive.relatorio.GeradorRelatorio;
import br.com.golive.utils.Fluxo;
import br.com.golive.utils.GoliveOneProperties;
import br.com.golive.utils.JSFUtils;
import br.com.golive.utils.ServiceUtils;
import br.com.golive.utils.Utils;
import br.com.golive.utils.javascript.FuncaoJavaScript;

/**
 * 
 * @author Guilherme
 * @author Maruen
 * 
 *         <p>
 *         Classe responsavel por gerar metodos genericos para todas as
 *         managedBeans do modulo de cadastro
 *         </p>
 * 
 * @param <T>
 */

@ManagedBean
@ViewScoped
@PropriedadesTemplate(form = "conteudoForm", idTabela = "conteudoTable")
public abstract class CadastroBeanRules2<T> extends GenericBean implements
		Serializable {

	private static final long serialVersionUID = 2907332241303108246L;

	@Inject
	@GeradorRelatorioInjected
	protected GeradorRelatorio<T> relatorios;

	@Inject
	@FilterInjected
	protected FilterManager<T> filterManager;

	@Inject
	@ListColunaInjected
	private List<ColunaPerfil> colunasPagina;

	@Inject
	@ListGenericaInjected
	protected List<T> filtrados;

	@Inject
	@ListGenericaInjected
	protected List<T> temp;

	protected Fluxo fluxo = Fluxo.LISTAGEM;
	protected List<T> conteudo;
	protected T registro;

	protected Class<T> genericClazzInstance;


	private List<ColunaPerfil> configuracaoPerfil;

	@Inject
	@PrimeInfoList(list = "cadastroAreaAtuacao")
	@PrimefacesDataTableInjected
	private DataTable dataTable;

	public abstract void init();

	public void filtrar(final String widgetFiltro) {
		filterManager.filtrar(conteudo, filtrados, getFilter(widgetFiltro), widgetFiltro);
	}

	public void limparFiltro(final String widgetFiltro) {
		filterManager.filtrar(conteudo, filtrados, null, widgetFiltro);
	}

	public Map<String, Object> obterParametrosRelatório() {
		getLogger().info("Obtendo parametros para carregar relatório");
		final Map<String, Object> parametros = new HashMap<String, Object>();
		parametros.put("usuarioLogado", getUsuario().getNome());
		parametros.put("label.usuario", getUsuario().getLabels().getField("label.usuario"));
		try {
			getLogger().info("Carregando logo da empresa");
			parametros.put("logo", ImageIO.read(Thread.currentThread().getContextClassLoader().getResourceAsStream("01.png")));
		} catch (final IOException e) {
			getLogger().error("Erro ao carregar logo da empresa");
		}
		return parametros;
	}

	protected abstract Logger getLogger();

	public void formAction() {
		showMenuBar(500, 600);
	}

	protected void init(final List<T> listaConteudo) {
		showMenuBar(500, 600);
		if (getLogger() == null) {
			throw new GoLiveException("ManagedBean não possui log para acompanhamento dos processos, implemente o getLogger() para que a página possa ser renderizada");
		}

		this.conteudo = listaConteudo;
		filtrados.addAll(conteudo);
		inicializarClasse();
		if (getFilterManager() != null) {
			getFilterManager().setInstance(this);
		}

		Utils.obterLista(colunasPagina, genericClazzInstance, usuario, getEmpresaSelecionada());

		try {
			verificarConfiguracaoDeOrdenacao();
			popularColunasVisiveis();

		} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException | NoSuchMethodException | SecurityException e) {
			e.printStackTrace();
		}

	}

	private void popularColunasVisiveis() {
		if (configuracaoPerfil == null) {
			setConfiguracaoPerfil(new ArrayList<ColunaPerfil>());
		}

		for (final ColunaPerfil coluna : colunasPagina) {
			if ((coluna.getVisibilidade()) && (!getConfiguracaoPerfil().contains(coluna))) {
				getConfiguracaoPerfil().add(coluna);
			}
		}
	}

	public String getFilterLabel(final String filter) {
		try {
			final Field campoBean = this.getClass().getField(filter);
			if ((campoBean != null) && (campoBean.isAnnotationPresent(Filter.class))) {
				return campoBean.getAnnotation(Filter.class).label();
			}
		} catch (NoSuchFieldException | SecurityException e) {
			e.printStackTrace();
		}
		return "";

	}

	public void cancelarExclusao() {
		fluxo = getFluxoListagem();
		showMenuBar(0, 0);
	}

	public void exportarPdf() {
		gerarRelatorio(TipoRelatorio.PDF, getLabels());
	}

	public void exportarXls() {
		gerarRelatorio(TipoRelatorio.EXCEL, getLabels());
	}

	@SuppressWarnings("unchecked")
	private void inicializarClasse() {
		getLogger().info("Inicializando Classe Generica");
		Type type = getClass().getGenericSuperclass();
		if (!(type instanceof ParameterizedType)) {
			type = this.getClass().getSuperclass().getGenericSuperclass();
		}
		genericClazzInstance = (Class<T>) ((ParameterizedType) type).getActualTypeArguments()[0];
		relatorios.setClazz(genericClazzInstance);
	}

	public boolean isSelecionado() {
		if (registro == null) {
			JSFUtils.warnMessage(getLabels().getField("title.msg.selecione.registro") + ",", getLabels().getField("msg.selecionar.registro"));
			getLogger().info("Não existe registro para processar");
			fixarMenu();
			return false;
		}
		return true;
	}

	@Deprecated
	// ARRUMAR TIRAR O WEBKIT
	private void fixarMenu() {
		JSFUtils.chamarJs(new FuncaoJavaScript("fixarMenuBar"));
	}

	public void imprimir() {
		showMenuBar(0, 0);
		gerarRelatorio(TipoRelatorio.IMPRESSAO, getLabels());
		JSFUtils.chamarJs(new FuncaoJavaScript("abrirPdf", new String(Base64.encodeBase64(ServiceUtils.obterValorPorChave(byte[].class, ChaveSessao.LISTA_IMPRESSAO)))));
	}

	private void showMenuBar(final long height, final long top) {
		JSFUtils.chamarJs(new FuncaoJavaScript("showMenuBar", Long.toString(height), Long.toString(top)));
	}

	public String nomePagina() {
		return JSFUtils.getLabelPageName(this.getClass());
	}

	public void incluir() {
		fluxo = getFluxoInclusao();
		showMenuBar(0, 0);
	}

	public void editarRegistro() {
		if (isSelecionado()) {
			fluxo = getFluxoEdicao();
			showMenuBar(0, 0);
			getLogger().info("Edicao de registro = {} ", registro);
		}
	}

	public void excluir() {
		if (isSelecionado()) {
			fluxo = getFluxoExclusao();
			showMenuBar(0, 0);
		}
	}

	public void salvar() {
		fluxo = getFluxoListagem();
		showMenuBar(0, 0);
	}

	public void cancelar() {
		showMenuBar(0, 0);
		fluxo = getFluxoListagem();
		if (registro == null) {
			getLogger().info("Cancelando inclusao de registro");
		} else {
			getLogger().info("Cancelando edicao do registro = {} ", registro);
		}

	}

	public Fluxo getFluxoExclusao() {
		return Fluxo.EXCLUSAO;
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

	public void confirmarExclusao() {
		if ((fluxo.equals(Fluxo.EXCLUSAO)) && (registro != null)) {
			conteudo.remove(registro);
			filtrados.remove(registro);
			registro = null;
			JSFUtils.infoMessage(getLabels().getField("title.msg.inserido.sucesso"), getLabels().getField("msg.registro.excluido"));
			fluxo = Fluxo.LISTAGEM;
			showMenuBar(0, 0);
		}
	}

	public void gerarRelatorio(final TipoRelatorio tipoRelatorio, final GoliveOneProperties labels) {
		try {
			getLogger().info("Gerando relatório para classe = {}", genericClazzInstance.getName());
			relatorios.gerarRelatorio(tipoRelatorio, filtrados, obterParametrosRelatório(), labels);
		} catch (GoLiveException | JRException | IOException e) {
			getLogger().error("Erro ao gerar relatorio = {}", genericClazzInstance.getName());
			e.printStackTrace();
		}
	}

	@SuppressWarnings("rawtypes")
	public GoliveFilter getFilter(final String widgetName) {
		for (final Field field : this.getClass().getDeclaredFields()) {
			if ((field.isAnnotationPresent(Filter.class)) && (field.getAnnotation(Filter.class).name().equals(widgetName))) {
				try {
					final GoliveFilter ret = (GoliveFilter) this.getClass().getMethod("get" + WordUtils.capitalize(field.getName())).invoke(this);
					return ret;
				} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException | NoSuchMethodException | SecurityException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}

	public String getLabelFilter(final String widgetName) {
		for (final Field field : this.getClass().getDeclaredFields()) {
			if ((field.isAnnotationPresent(Filter.class)) && (field.getAnnotation(Filter.class).name().equals(widgetName))) {
				return field.getAnnotation(Filter.class).label();
			}
		}
		return null;
	}

	private void verificarConfiguracaoDeOrdenacao() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		System.out.println("Arrumando");

	}

	public Object obterLabelColuna(final ColunaPerfil coluna, final T indice) {
		if (coluna == null) {
			return "";
		}
		Object ret = indice;
		Method getter;
		try {
			getter = genericClazzInstance.getMethod("get" + WordUtils.capitalize(coluna.getColuna()));
			ret = getter.invoke(indice);
		} catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
			getLogger().error("Erro ao obter label da coluna generica");
			e.printStackTrace();
		}

		if (ret != null) {
			if ((getFilter(coluna.getColuna()) != null) && (getFilter(coluna.getColuna()).getGenericType().equals(Date.class))) {
				return ((Calendar) ret).getTime();
			} else {
				return ret;
			}
		} else {
			throw new GoLiveException("Não foi possivel obter label da coluna dinamica");
		}

	}

	private boolean verificarNovasColunas(final Field[] fields) {
		boolean inseriu = false;
		for (final Field field : fields) {
			// TODO mudar este 'true' e Incluir apenas os @Column
			if (field.isAnnotationPresent(Column.class)) {
				if ((true) && (!JSFUtils.verificarColuna(colunasPagina, field.getName()))) {
					// TODO inserir na base tambem;
					// TODO Alterar o field.getname para o nome da colunas
					// @COlumn
					inseriu = true;
					colunasPagina.add(new ColunaPerfil(usuario.getId(), new Integer(colunasPagina.size() + 1).longValue(), genericClazzInstance.getName(), field.getName(), false, getEmpresaSelecionada(), "igual"));
				}
			}
		}
		return inseriu;
	}

	public void salvarPerfilPagina() {
		showMenuBar(0, 0);

		for (final ColunaPerfil coluna : colunasPagina) {
			if (!configuracaoPerfil.contains(coluna)) {
				final GoliveFilter filtro = getFilter(coluna.getColuna());
				filtro.setInicio(null);
				filtro.setFim(null);
			}
		}

		if (configuracaoPerfil.size() > 0) {
			filtrar(configuracaoPerfil.get(0).getColuna());
		}
	}

	public String getForm() {
		return this.getClass().getSuperclass().getAnnotation(PropriedadesTemplate.class).form();
	}

	public String getIdTable() {
		return this.getClass().getSuperclass().getAnnotation(PropriedadesTemplate.class).idTabela();
	}

	public GeradorRelatorio<T> getRelatorios() {
		return relatorios;
	}

	public void setRelatorios(final GeradorRelatorio<T> relatorios) {
		this.relatorios = relatorios;
	}

	public Fluxo getFluxo() {
		return fluxo;
	}

	public FilterManager<T> getFilterManager() {
		return filterManager;
	}

	public void setFilterManager(final FilterManager<T> filterManager) {
		this.filterManager = filterManager;
	}

	public void setFluxo(final Fluxo fluxo) {
		this.fluxo = fluxo;
	}

	public List<T> getConteudo() {
		return conteudo;
	}

	public void setConteudo(final List<T> conteudo) {
		this.conteudo = conteudo;
	}

	public List<T> getFiltrados() {
		return filtrados;
	}

	public void setFiltrados(final List<T> filtrados) {
		this.filtrados = filtrados;
	}

	public List<T> getTemp() {
		return temp;
	}

	public void setTemp(final List<T> temp) {
		this.temp = temp;
	}

	public T getRegistro() {
		return registro;
	}

	public void setRegistro(final T registro) {
		this.registro = registro;
	}

	public Class<T> getGenericClazzInstance() {
		return genericClazzInstance;
	}

	public void setGenericClazzInstance(final Class<T> genericClazzInstance) {
		this.genericClazzInstance = genericClazzInstance;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public GoliveOneProperties getLabels() {
		return usuario.getLabels();
	}

	public DataTable getDataTable() {
		return dataTable;
	}

	public void setDataTable(final DataTable dataTable) {
		this.dataTable = dataTable;
	}

	public List<ColunaPerfil> getColunasPagina() {
		return colunasPagina;
	}

	public void setColunasPagina(final List<ColunaPerfil> colunasPagina) {
		this.colunasPagina = colunasPagina;
	}

	public List<ColunaPerfil> getConfiguracaoPerfil() {
		return configuracaoPerfil;
	}

	public void setConfiguracaoPerfil(final List<ColunaPerfil> configuracaoPerfil) {
		this.configuracaoPerfil = configuracaoPerfil;
	}

}
