package br.com.golive.bean.page.cadastro.rules;

import java.io.IOException;
import java.io.OutputStream;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.GregorianCalendar;
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
import javax.persistence.JoinTable;
import javax.persistence.Table;
import javax.servlet.http.HttpServletResponse;

import lombok.Getter;
import lombok.Setter;
import net.sf.jasperreports.engine.JRException;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.annotation.Jasper;
import br.com.golive.annotation.Label;
import br.com.golive.annotation.LogList;
import br.com.golive.bean.generics.parent.GenericFilterBean;
import br.com.golive.bean.page.manager.GenericBean;
import br.com.golive.constants.ChaveSessao;
import br.com.golive.constants.OrderColumnType;
import br.com.golive.constants.TipoFiltro;
import br.com.golive.constants.TipoRelatorio;
import br.com.golive.entity.Model;
import br.com.golive.entity.perfilconfiguracao.model.ColunaPerfil;
import br.com.golive.exception.GoLiveException;
import br.com.golive.filter.FilterManager;
import br.com.golive.filter.GoliveFilter;
import br.com.golive.navigation.component.OrderByDynamicColumn;
import br.com.golive.qualifier.FilterInjected;
import br.com.golive.qualifier.GeradorRelatorioInjected;
import br.com.golive.qualifier.ListGenericaInjected;
import br.com.golive.relatorio.GeradorRelatorio;
import br.com.golive.service.AuditoriaService;
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
@ManagedBean
@ViewScoped
public abstract class CadastroGenericBean<T extends Model> extends GenericBean implements Serializable {

	private static final long serialVersionUID = 2907332241303108246L;

	@Inject
	@GeradorRelatorioInjected
	@Getter
	@Setter
	protected GeradorRelatorio<T> relatorios;

	@Inject
	@FilterInjected
	@Getter
	@Setter
	private FilterManager<T> filterManager;

	@Inject
	@ListGenericaInjected
	@Getter
	@Setter
	protected List<T> filtrados;

	@Inject
	@ListGenericaInjected
	@Getter
	@Setter
	protected List<T> temp;

	@EJB
	protected PerfilService colunaPerfilService;

	@EJB
	protected AuditoriaService auditoriaService;

	@Getter
	@Setter
	private boolean selecionarTodos;

	@Getter
	@Setter
	private List<ColunaPerfil> colunasPagina;

	@Getter
	@Setter
	private OrderByDynamicColumn orderBy;

	@Getter
	@Setter
	protected Long widthColunasDinamicas;

	@Getter
	@Setter
	protected Fluxo fluxo = Fluxo.LISTAGEM;

	@Getter
	@Setter
	protected List<T> conteudo;

	@Getter
	@Setter
	protected T registro;

	@Getter
	@Setter
	protected Class<T> genericClazzInstance;

	@Getter
	@Setter
	protected List<ColunaPerfil> configuracaoPerfil;

	public abstract Logger getLogger();

	public abstract boolean validarCampos();

	public abstract void serviceSave(final T registro);

	public abstract void serviceUpdate(final T registro);

	public abstract void serviceRemove(final T registro);

	public abstract void serviceRefresh(final T registro);

	public abstract GenericFilterBean<T> getFiltros();

	public void validarComponent() {

	}

	protected void init(final List<T> listaConteudo) {

		if (usuario != null) {

			if (getLogger() == null) {
				throw new GoLiveException("ManagedBean nao possui log para acompanhamento dos processos, implemente o getLogger() para que a pagina possa ser renderizada");
			}
			getLogger().info("Inicializando = {}", this.getClass().getSimpleName());
			esvaziarLista(conteudo);
			esvaziarLista(filtrados);
			this.conteudo = listaConteudo;
			filtrados.addAll(conteudo);
			inicializarClasse();
			configuracaoPerfil = getConfiguracaoesByClasses();
			adicionarColunasNaPagina();
			fluxo = getFluxoListagem();
			definirPadraoFiltragem();
			orderBy = null;
			filtrar();
		}
	}

	@SuppressWarnings("rawtypes")
	private void definirPadraoFiltragem() {
		Field field;

		for (final String key : getFiltros().getMapFilters().keySet()) {
			field = getFiltros().getMapFilters().get(key);
			try {
				((GoliveFilter) Utils.invoke(field, getFiltros())).setTipo(TipoFiltro.obterPorDescricao(ServiceUtils.obterColunaPorField(configuracaoPerfil, field).getPadraoFiltro()));
			} catch (IllegalArgumentException | IllegalAccessException e) {
				e.printStackTrace();
			}
		}
	}

	public void sort(final ColunaPerfil coluna) {

		if ((orderBy != null) && (orderBy.getColuna().getId().equals(coluna.getId()))) {
			Collections.reverse(filtrados);
			if (orderBy.getOrder().equals(OrderColumnType.ASC)) {
				orderBy.setOrder(OrderColumnType.DESC);
			} else {
				orderBy.setOrder(OrderColumnType.ASC);
			}
		} else {
			orderBy = OrderByDynamicColumn.getInstance(coluna);
			Collections.sort(filtrados, new Comparator<T>() {
				@SuppressWarnings("rawtypes")
				@Override
				public int compare(final T o1, final T o2) {
					final GoliveFilter filtro = getFiltros().getFilter(coluna);
					switch (filtro.getGenericType().getSimpleName()) {
					case "Long":
						return new Long((long) obterLabelColuna(coluna, o1)).compareTo((Long) obterLabelColuna(coluna, o2));
					case "String":
						return obterLabelColuna(coluna, o1).toString().toLowerCase().compareTo(obterLabelColuna(coluna, o2).toString().toLowerCase());
					case "Date":
						return new Long(((Calendar) obterLabelColuna(coluna, o1)).getTime().getTime()).compareTo(((Calendar) obterLabelColuna(coluna, o2)).getTime().getTime());
					}
					return 0;
				}
			});
		}
	}

	public Long getMenorId() {
		Collections.sort(conteudo, new Comparator<Model>() {
			@Override
			public int compare(final Model o1, final Model o2) {
				return o1.getId().compareTo(o2.getId());
			}
		});
		return conteudo.get(0).getId();
	}

	public Object obterLabelColuna(final ColunaPerfil coluna, final T indice) {
		if (coluna == null) {
			return "";
		}
		Object ret = indice;

		try {
			try {
				ret = getField(coluna, ret);
			} catch (final NullPointerException e) {
				getLogger().error("Erro ao obter label coluna, revertendo objeto");
				serviceRefresh(indice);
				if (getField(coluna, ret) != null) {
					obterLabelColuna(coluna, indice);
				}
			}

		} catch (SecurityException | IllegalAccessException | IllegalArgumentException e) {
			getLogger().error("Erro ao obter label da coluna generica");
			e.printStackTrace();
		}
		return ret;

	}

	private Object getField(final ColunaPerfil coluna, Object ret) throws IllegalAccessException {
		for (final Field field : genericClazzInstance.getDeclaredFields()) {
			if (Utils.getRelationShip(field)) {
				if (field.getType().getAnnotation(Table.class).name().equals(coluna.getId().getTabela())) {
					ret = Utils.invoke(field, ret);
				}
			}
		}
		if (ret != null) {
			ret = Utils.invoke(Utils.getFieldByNameColumn(coluna, ret.getClass()), ret);
		}
		return ret;
	}

	public String getLabelFilter(final ColunaPerfil coluna) {
		try {
			final Field field = ServiceUtils.getFieldByColumn(coluna, getFiltros().getMapFilters());
			if (field == null) {
				throw new GoLiveException("NÃ£o foi possÃ­vel encontrar o filtro para esta coluna = " + coluna.getId().getColuna());
			}
			return field.getAnnotation(Filter.class).label();
		} catch (final GoLiveException e) {
			getLogger().info("Erro ao obter filtro = {}", coluna);
			e.printStackTrace();
			return "";
		}
	}

	private void adicionarColunasNaPagina() {
		colunasPagina = new ArrayList<ColunaPerfil>();
		for (final ColunaPerfil colunaPerfil : configuracaoPerfil) {
			if (colunaPerfil.isVisivel()) {
				colunasPagina.add(colunaPerfil);
			}
		}
	}

	public String getImageSorter(final ColunaPerfil colunaPerfil) {
		if (orderBy != null) {
			if (colunaPerfil.getId().equals(orderBy.getColuna().getId())) {
				if (orderBy.getOrder().equals(OrderColumnType.ASC)) {
					return "/resources/images/stylistica-icons-set/24x24/down_arrow.png";
				} else {
					return "/resources/images/stylistica-icons-set/24x24/up_arrow.png";
				}
			}
		}
		return "/resources/images/stylistica-icons-set/24x24/record.png";
	}

	public Filter getFieldFilter(final ColunaPerfil coluna) {
		return getFieldByColuna(coluna).getAnnotation(Filter.class);
	}

	private String getPropertyValueByColumn(final ColunaPerfil coluna) {
		final Filter filter = getFieldFilter(coluna);
		if (filter != null) {
			return usuario.getLabels().getField(filter.label());
		}
		throw new GoLiveException("Erro ao Obter o Filtro para a coluna");
	}

	private Field getFieldByColuna(final ColunaPerfil coluna) {
		return ServiceUtils.getFieldByColumn(coluna, getFiltros().getMapFilters());
	}

	public Label getLabelEntity(final ColunaPerfil coluna) {
		return getFieldByColuna(coluna).getAnnotation(Filter.class).entityClazz().getAnnotation(Label.class);
	}

	public String getWidget(final ColunaPerfil coluna) {
		return coluna.getId().getTabela() + "_" + coluna.getId().getColuna();
	}

	protected void removidoComSucesso() {
		JSFUtils.infoMessage(getLabels().getField("title.msg.inserido.sucesso"), getLabels().getField("msg.registro.excluido"));
	}

	private GoliveOneProperties getLabels() {
		return usuario.getLabels();
	}

	protected void listaVaziaMessage(final String label) {
		JSFUtils.warnMessage(getLabels().getField("label.cadastroSegmentos.msnNaoHaRegistros"), getLabels().getField(label));
	}

	protected void erroAoRemover() {
		JSFUtils.errorMessage(getLabels().getField("title.msg.erro.ao.excluir"), getLabels().getField("msg.erro.registro.vinculado"));
	}

	protected List<ColunaPerfil> getConfiguracaoesByClasses(final Class<?>... classes) {

		final List<Class<?>> classesList = new ArrayList<Class<?>>();

		classesList.add(genericClazzInstance);

		for (final Field field : genericClazzInstance.getDeclaredFields()) {
			if (!field.isAnnotationPresent(LogList.class)) {
				if (field.isAnnotationPresent(JoinTable.class)) {
					classesList.add(field.getType());
				}
			}
		}

		if (usuario != null) {
			return colunaPerfilService.obterListaDeConfiguracoesPagina(usuario, empresaSelecionada, this.getClass().getSimpleName(), classesList);
		}
		return null;
	}

	protected void preencherTodosCamposMessage() {
		JSFUtils.warnMessage(usuario.getLabels().getField("label.preencherTodosCampos"), usuario.getLabels().getField("label.preencherTodosCampos"));
	}

	protected boolean fatalError() {
		JSFUtils.fatalMessage(usuario.getLabels().getField("title.msg.erro.sistema"), usuario.getLabels().getField("msg.erro.ao.salvar"));
		return true;
	}

	protected boolean salvoMessagem() {
		JSFUtils.infoMessage(usuario.getLabels().getField("title.msg.inserido.sucesso"), usuario.getLabels().getField("msg.inserido.sucesso"));
		return true;
	}

	protected boolean updateMessagem() {
		JSFUtils.infoMessage(usuario.getLabels().getField("title.msg.inserido.sucesso"), usuario.getLabels().getField("msg.atualizado.sucesso"));
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

	public void saveConfig(final ColunaPerfil coluna) {
		coluna.setPadraoFiltro(getFiltros().getFilter(coluna).getTipo().getDescricao());
		colunaPerfilService.atualizar(usuario, empresaSelecionada, coluna);
		filtrar();
	}

	public void filtrar() {
		filterManager.filtrarLista(conteudo, filtrados, getFiltros().getMapFilters());
		orderBy = null;
	}

	public Map<String, Object> obterParametrosRelatorio() {
		getLogger().info("Obtendo parametros para carregar relatÃ³rio");
		final Map<String, Object> parametros = new HashMap<String, Object>();
		parametros.put("usuarioLogado", getUsuario().getLogin());
		parametros.put("label.usuario", getUsuario().getLabels().getField("label.usuario"));
		colocarLabelParametros(parametros, genericClazzInstance);

		for (final Field field : genericClazzInstance.getDeclaredFields()) {
			if (field.isAnnotationPresent(JoinTable.class)) {
				colocarLabelParametros(parametros, field.getType());
			}
		}

		try {
			getLogger().info("Carregando logo da empresa");
			parametros.put("logo", ImageIO.read(Thread.currentThread().getContextClassLoader().getResourceAsStream(empresaSelecionada.getId() + ".png")));
		} catch (final IOException e) {
			getLogger().error("Erro ao carregar logo da empresa");
		}
		return parametros;
	}

	public void colocarLabelParametros(final Map<String, Object> parametros, final Class<?> clazz) {
		Class<?> atual = clazz;
		while (atual != null) {
			for (final Field field : atual.getDeclaredFields()) {
				if ((field.isAnnotationPresent(Label.class)) && (field.isAnnotationPresent(Column.class))) {
					if (!parametros.containsKey(field.getAnnotation(Label.class).name())) {
						parametros.put(field.getAnnotation(Label.class).name(), getUsuario().getLabels().getField(field.getAnnotation(Label.class).name()));
					}
				}
			}
			atual = atual.getSuperclass();
		}
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
	}

	public void exportarPdf() {
		gerarRelatorio(TipoRelatorio.PDF, getLabels());
	}

	protected void validarLista(final List<?>... lists) {
		for (int i = 0; i < lists.length; i++) {
			if ((lists[i] == null) || (lists[i].isEmpty())) {
				if ((i + 1) < lists.length) {
					lists[i + 1] = null;
				}
			}

		}
	}

	protected boolean verificarLista(final List<?> list, final Model model) {

		if (model == null) {
			return true;
		}
		if (list == null) {
			return true;
		}
		if (list.isEmpty()) {
			return true;
		}
		if (!list.contains(model)) {
			return true;
		}
		return false;
	}

	public void exportarXls() {

		try {
			final String filename = usuario.getLabels().getField(genericClazzInstance.getAnnotation(Jasper.class).nomeDoArquivoGerado()).concat(".csv");

			final FacesContext fc = FacesContext.getCurrentInstance();
			final HttpServletResponse response = (HttpServletResponse) fc.getExternalContext().getResponse();

			response.reset();
			response.setContentType("text/comma-separated-values");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

			final OutputStream output = response.getOutputStream();

			final StringBuilder csv = new StringBuilder();

			final SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");

			csv.append(usuario.getLabels().getField("label.usuario").concat(":;").concat(usuario.getLogin()).concat("\n"));
			csv.append(usuario.getLabels().getField("label.data.geracao").concat(":;").concat(sdf.format(Calendar.getInstance().getTime()).concat("\n")));
			csv.append("\n\n");

			for (final ColunaPerfil conf : configuracaoPerfil) {
				if (conf.isVisivel()) {
					csv.append(usuario.getLabels().getField(getLabelEntity(conf).name()).concat(" - ").concat(getPropertyValueByColumn(conf)).concat(";"));
				}
			}

			csv.append("\n");

			for (final T indice : filtrados) {
				for (final ColunaPerfil conf : configuracaoPerfil) {
					if (conf.isVisivel()) {
						final Object ret = obterLabelColuna(conf, indice);
						if (ret.getClass().equals(GregorianCalendar.class)) {
							csv.append(sdf.format(((Calendar) ret).getTime()).concat(";"));
						} else {
							csv.append(ret.toString().concat(";"));
						}
					}
				}
				csv.append("\n");
			}

			output.write(csv.toString().getBytes());

			output.flush();
			output.close();

			fc.responseComplete();

		} catch (final IOException e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	private void inicializarClasse() {
		Type type = getClass().getGenericSuperclass();
		if (!(type instanceof ParameterizedType)) {
			type = this.getClass().getSuperclass().getGenericSuperclass();
		}
		genericClazzInstance = (Class<T>) ((ParameterizedType) type).getActualTypeArguments()[0];
		relatorios.setClazz(genericClazzInstance);
		if (filterManager != null) {
			filterManager.setInstance(getFiltros());
		}
	}

	public boolean isSelecionado() {
		if (registro == null) {
			JSFUtils.warnMessage(getLabels().getField("title.msg.selecione.registro") + ",", getLabels().getField("msg.selecionar.registro"));
			getLogger().info("NÃ£o existe registro para processar");
			fixarMenu();
			return false;
		}
		return true;
	}

	private void fixarMenu() {
		JSFUtils.chamarJs(new FuncaoJavaScript("fixarMenuBar"));
	}

	public void imprimir() {
		gerarRelatorio(TipoRelatorio.IMPRESSAO, getLabels());
		JSFUtils.chamarJs(new FuncaoJavaScript("abrirPdf", new String(Base64.encodeBase64(ServiceUtils.obterValorPorChave(byte[].class, ChaveSessao.LISTA_IMPRESSAO)))));
	}

	public String nomePagina() {
		return JSFUtils.getLabelPageName(this.getClass());
	}

	public void incluir() {
		fluxo = getFluxoInclusao();
	}

	public void editarRegistro() {
		if (isSelecionado()) {
			fluxo = getFluxoEdicao();
			getLogger().info("Edicao de registro = {} ", registro);
			registro.setAuditoriaLogs(auditoriaService.getAuditoriaLogs(usuario, empresaSelecionada, registro));
		}
	}

	public void excluir() {
		if (isSelecionado()) {
			fluxo = getFluxoExclusao();
		}
	}

	public void salvar() {
		getLogger().info("Salvando = {} ", registro);

		boolean success = false;

		try {
			if (registro != null) {
				if (validarCampos()) {
					if (registro.getId() == null) {
						serviceSave(registro);
						success = salvoMessagem();
					} else {
						serviceUpdate(registro);
						success = updateMessagem();
					}
				}
			}
		} catch (final Exception e) {
			getLogger().error("Erro ao salvar ou atualizar registro");
			e.printStackTrace();
			fluxo = getFluxoListagem();
			init();
			fatalError();
		}

		if (success) {
			fluxo = getFluxoListagem();
			init();
		}
	}

	public void cancelar() {

		fluxo = getFluxoListagem();
		if (registro == null) {
			getLogger().info("Cancelando inclusao de registro");
		} else {
			getLogger().info("Cancelando edicao do registro e desconsiderando os dados editados  {} ", registro);
			if (registro.getId() != null) {
				serviceRefresh(registro);
			}
		}
		init();
		registro = null;
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
		try {
			serviceRemove(registro);
			removidoComSucesso();
		} catch (final Exception e) {
			getLogger().error("Erro ao excluir registro ={} ", registro.getId());
			erroAoRemover();
		}
		init();
	}

	public void gerarRelatorio(final TipoRelatorio tipoRelatorio, final GoliveOneProperties labels) {
		try {
			getLogger().info("Gerando relatÃ³rio para classe = {}", genericClazzInstance.getName());
			relatorios.gerarRelatorio(tipoRelatorio, filtrados, obterParametrosRelatorio(), labels);
		} catch (GoLiveException | JRException | IOException e) {
			getLogger().error("Erro ao gerar relatorio = {}", genericClazzInstance.getName());
			e.printStackTrace();
		}
	}

	public void reorder() {
		for (final ColunaPerfil perfil : configuracaoPerfil) {
			perfil.setVisivel(false);
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

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void salvarPerfilPagina() {
		Utils.reordernar(configuracaoPerfil);

		for (final ColunaPerfil coluna : configuracaoPerfil) {
			final GoliveFilter filtro = getFiltros().getFilter(coluna);
			filtro.setInicio(null);
			filtro.setFim(null);
		}

		colunaPerfilService.atualizarLista(usuario, empresaSelecionada, configuracaoPerfil);
		colunasPagina.removeAll(colunasPagina);

		for (final ColunaPerfil coluna : configuracaoPerfil) {
			if ((coluna.isVisivel()) && (!colunasPagina.contains(coluna))) {
				colunasPagina.add(coluna);
			}
		}
	}

}
