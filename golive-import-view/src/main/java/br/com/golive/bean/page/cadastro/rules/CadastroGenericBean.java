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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.imageio.ImageIO;
import javax.inject.Inject;
import javax.persistence.Column;
import javax.persistence.Table;

import lombok.Data;
import net.sf.jasperreports.engine.JRException;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang.WordUtils;
import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.annotation.PropriedadesTemplate;
import br.com.golive.bean.page.manager.GenericBean;
import br.com.golive.constants.ChaveSessao;
import br.com.golive.constants.TipoRelatorio;
import br.com.golive.entity.perfilconfiguracao.model.ColunaPerfil;
import br.com.golive.exception.GoLiveException;
import br.com.golive.filter.FilterManager;
import br.com.golive.filter.GoliveFilter;
import br.com.golive.qualifier.FilterInjected;
import br.com.golive.qualifier.GeradorRelatorioInjected;
import br.com.golive.qualifier.ListGenericaInjected;
import br.com.golive.relatorio.GeradorRelatorio;
import br.com.golive.service.PerfilService;
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
@Data
@ManagedBean
@ViewScoped
@PropriedadesTemplate(form = "conteudoForm", idTabela = "conteudoTable", component = "modelTable")
public abstract class CadastroGenericBean<T> extends GenericBean implements Serializable {

	private static final long serialVersionUID = 2907332241303108246L;

	@Inject
	@GeradorRelatorioInjected
	protected GeradorRelatorio<T> relatorios;

	@Inject
	@FilterInjected
	protected FilterManager<T> filterManager;

	@Inject
	@ListGenericaInjected
	protected List<T> filtrados;

	@Inject
	@ListGenericaInjected
	protected List<T> temp;

	@EJB
	protected PerfilService colunaPerfilService;

	private boolean selecionarTodos;

	protected Long widthColunasDinamicas;

	protected Fluxo fluxo = Fluxo.LISTAGEM;
	protected List<T> conteudo;
	protected T registro;

	protected Class<T> genericClazzInstance;

	protected List<ColunaPerfil> configuracaoPerfil;

	private List<ColunaPerfil> colunasPagina;

	public abstract void init();

	@Deprecated
	public String getUsuarioLog() {
		return "USUARIO";
	}
	
	protected void init(final List<T> listaConteudo, final List<ColunaPerfil> configuracoes) {
		showMenuBar(500, 600);
		if(usuario != null){
			if (getLogger() == null) {
				throw new GoLiveException("ManagedBean não possui log para acompanhamento dos processos, implemente o getLogger() para que a página possa ser renderizada");
			}
			getLogger().info("Inicializando = {}", this.getClass().getSimpleName());

			esvaziarLista(conteudo);
			esvaziarLista(filtrados);

			this.conteudo = listaConteudo;
			filtrados.addAll(conteudo);
			inicializarClasse();
			configuracaoPerfil = configuracoes;

			if (verificarNecessidadeDeConfiguracao()) {

			}
			colunasPagina = new ArrayList<ColunaPerfil>();
			for (final ColunaPerfil colunaPerfil : configuracaoPerfil) {
				if (colunaPerfil.isVisivel()) {
					colunasPagina.add(colunaPerfil);
				}
			}
			fluxo = getFluxoListagem();	
		}
	}

	private void resizeColumns() {
		JSFUtils.chamarJs(new FuncaoJavaScript("getWidthTable"));
	}


	protected List<ColunaPerfil> getConfiguracaoesByClasses(final Class<?> ...classes) {
		if(usuario != null){
			return colunaPerfilService.obterListaDeConfiguracoesPagina(usuario, this.getClass().getSimpleName(), classes);
		}
		return null;
	}
	
	protected void preencherTodosCamposMessage(){
		JSFUtils.infoMessage(usuario.getLabels().getField("title.msg.inserido.sucesso"), usuario.getLabels().getField("msg.inserido.sucesso"));
	}
	
	protected boolean salvoMessagem(){
		JSFUtils.infoMessage(usuario.getLabels().getField("title.msg.inserido.sucesso"), usuario.getLabels().getField("msg.inserido.sucesso"));
		return true;
	}
	
	public void mudarWidthColumns() {
		final String value = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("width");
		if (value != null) {
			widthColunasDinamicas = Long.valueOf(value) - 4L;
		}
	}

	protected void esvaziarLista(final List<?> lista) {
		if (lista != null) {
			lista.removeAll(lista);
		}
	}

	public void filtrar(final ColunaPerfil widgetFiltro) {
		JSFUtils.warnMessage("Funcionalidade nao implementada", "Funcionanlidade será implementada posteriormente");
//		filterManager.filtrar(conteudo, filtrados, getFilter(widgetFiltro), widgetFiltro.getId().getColuna());
	}

	public void limparFiltro(final String widgetFiltro) {
		JSFUtils.warnMessage("Funcionalidade nao implementada", "Funcionanlidade será implementada posteriormente");
//		filterManager.filtrar(conteudo, filtrados, null, widgetFiltro);
	}

	public Map<String, Object> obterParametrosRelatório() {
		getLogger().info("Obtendo parametros para carregar relatório");
		final Map<String, Object> parametros = new HashMap<String, Object>();
		parametros.put("usuarioLogado", getUsuario().getLogin());
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

	public void selecionarTodos() {
		for (final ColunaPerfil coluna : configuracaoPerfil) {
			coluna.setVisivel(selecionarTodos);
		}
	}

	public void mudarValorColunasSelecionadas() {
		for (final ColunaPerfil coluna : configuracaoPerfil) {
			if (!coluna.isVisivel()) {
				selecionarTodos = false;
				return;
			}
		}
	}

	private boolean verificarNecessidadeDeConfiguracao() {
		if (configuracaoPerfil.isEmpty()) {
			configuracaoPerfil = Utils.obterListaColunaTabela(genericClazzInstance, usuario, empresaSelecionada);
			colunaPerfilService.salvarLista(configuracaoPerfil);
			return false;
		}
		return true;
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
		showMenuBar();
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
		if (getFilterManager() != null) {
			getFilterManager().setInstance(this);
		}
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

	private void fixarMenu() {
		JSFUtils.chamarJs(new FuncaoJavaScript("fixarMenuBar"));
	}

	public void imprimir() {
		showMenuBar();
		gerarRelatorio(TipoRelatorio.IMPRESSAO, getLabels());
		JSFUtils.chamarJs(new FuncaoJavaScript("abrirPdf", new String(Base64.encodeBase64(ServiceUtils.obterValorPorChave(byte[].class, ChaveSessao.LISTA_IMPRESSAO)))));
	}

	private void showMenuBar(final long height, final long top) {
		JSFUtils.chamarJs(new FuncaoJavaScript("showMenuBar", Long.toString(height), Long.toString(top)));
		resizeColumns();
	}

	protected void showMenuBar() {
		showMenuBar(0, 0);
	}

	public String nomePagina() {
		return JSFUtils.getLabelPageName(this.getClass());
	}

	public void incluir() {
		fluxo = getFluxoInclusao();
		showMenuBar();
	}

	public void editarRegistro() {
		if (isSelecionado()) {
			fluxo = getFluxoEdicao();
			showMenuBar();
			getLogger().info("Edicao de registro = {} ", registro);
		}
	}

	public void excluir() {
		if (isSelecionado()) {
			fluxo = getFluxoExclusao();
			showMenuBar();
		}
	}

	public void salvar() {
		fluxo = getFluxoListagem();
		showMenuBar();
	}

	public void cancelar() {
		showMenuBar();
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
			showMenuBar();
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
	public GoliveFilter getFilter(final ColunaPerfil coluna) {

		final GoliveFilter filtro = null;

		final Field field = Utils.getFilterField(genericClazzInstance, coluna, this.getClass(), this.getClass().getSuperclass());
		if ((coluna != null) && (!coluna.getId().getColuna().isEmpty())) {
			try {
				return (GoliveFilter) Utils.invokeGetterByField(field, this, getLogger(), this.getClass(), this.getClass().getSuperclass());
			} catch (final Exception e) {
				getLogger().warn("Filtro nao existe na classe");
			}
		}
		return filtro;
	}

	public String getLabelFilter(final ColunaPerfil coluna) {
		try {
			final Field field = Utils.getFilterField(genericClazzInstance, coluna, this.getClass(), this.getClass().getSuperclass());
			if(field == null){
				throw new GoLiveException("Não foi possível encontrar o filtro para esta coluna = " + coluna.getId().getColuna());
			}
			return field.getAnnotation(Filter.class).label();
		} catch (final GoLiveException e) {
			getLogger().info("Erro ao obter filtro = {}", coluna);
			e.printStackTrace();
			return "";
		}

	}

	public void reorder() {
		for (final ColunaPerfil perfil : configuracaoPerfil) {
			perfil.setVisivel(false);
		}
	}

	public void reordenarLinha() {
		Long count = 1L;
		for (final ColunaPerfil perfil : configuracaoPerfil) {
			perfil.setOrdem(count++);
		}
	}

	public Object obterLabelColuna(final ColunaPerfil coluna, final T indice) {
		if (coluna == null) {
			return "";
		}
		Object ret = indice;
		Method getter = null;

		try {

			for (final Field field : genericClazzInstance.getDeclaredFields()) {
				if (getter == null) {

					if (Utils.getRelationShip(field)) {
						if (field.getType().getAnnotation(Table.class).name().equals(coluna.getId().getTabela())) {
							getter = genericClazzInstance.getMethod("get" + WordUtils.capitalize(field.getName()));
							ret = getter.invoke(indice);
						}
					}
				}
			}

			final Field field = obterNomeFieldPorNomeDeColuna(coluna, ret.getClass(), ret.getClass().getSuperclass());
			getter = ret.getClass().getMethod("get" + WordUtils.capitalize(field.getName()));
			ret = getter.invoke(ret);
		} catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
			getLogger().error("Erro ao obter label da coluna generica");
			e.printStackTrace();
		}

		if (ret != null) {
			final GoliveFilter filter = getFilter(coluna);
			if ((filter != null) && (filter.getGenericType().equals(Calendar.class))) {
				return ((Calendar) ret).getTime();
			} else {
				return ret;
			}
		} else {
			throw new GoLiveException("Não foi possivel obter label da coluna dinamica");
		}

	}

	public Field obterNomeFieldPorNomeDeColuna(final ColunaPerfil coluna, final Class<?>... classes) {
		for (final Class<?> clazz : classes) {
			for (final Field field : clazz.getDeclaredFields()) {
				if (field.isAnnotationPresent(Column.class)) {
					if (field.getAnnotation(Column.class).name().equals(coluna.getId().getColuna())) {
						return field;
					}
				}
			}
		}
		return null;
	}

	public void salvarPerfilPagina() {
		showMenuBar();
		reordenarLinha();

		for (final ColunaPerfil coluna : configuracaoPerfil) {
			final GoliveFilter filtro = getFilter(coluna);
			filtro.setInicio(null);
			filtro.setFim(null);
		}

		colunaPerfilService.atualizarLista(configuracaoPerfil);
		colunasPagina.removeAll(colunasPagina);

		for (final ColunaPerfil coluna : configuracaoPerfil) {
			if ((coluna.isVisivel()) && (!colunasPagina.contains(coluna))) {
				colunasPagina.add(coluna);
			}
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

	public List<ColunaPerfil> getConfiguracaoPerfil() {
		return configuracaoPerfil;
	}

	public void setConfiguracaoPerfil(final List<ColunaPerfil> configuracaoPerfil) {
		this.configuracaoPerfil = configuracaoPerfil;
	}

	public boolean isSelecionarTodos() {
		return selecionarTodos;
	}

	public void setSelecionarTodos(final boolean selecionarTodos) {
		this.selecionarTodos = selecionarTodos;
	}

	public List<ColunaPerfil> getColunasPagina() {
		return colunasPagina;
	}

	public void setColunasPagina(final List<ColunaPerfil> colunasPagina) {
		this.colunasPagina = colunasPagina;
	}

}
