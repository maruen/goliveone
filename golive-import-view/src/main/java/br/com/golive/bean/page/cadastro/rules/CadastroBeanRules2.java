package br.com.golive.bean.page.cadastro.rules;

import java.io.IOException;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.imageio.ImageIO;
import javax.inject.Inject;
import javax.persistence.Transient;

import net.sf.jasperreports.engine.JRException;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang.WordUtils;
import org.primefaces.component.datatable.DataTable;
import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.annotation.Label;
import br.com.golive.annotation.PrimeInfoList;
import br.com.golive.annotation.PropriedadesTemplate;
import br.com.golive.bean.component.ColumnModel;
import br.com.golive.bean.component.ColunaPerfil;
import br.com.golive.bean.page.manager.GenericBean;
import br.com.golive.constants.ChaveSessao;
import br.com.golive.constants.TipoRelatorio;
import br.com.golive.exception.GoLiveException;
import br.com.golive.filter.FilterManager;
import br.com.golive.filter.GoliveFilter;
import br.com.golive.qualifier.FilterInjected;
import br.com.golive.qualifier.GeradorRelatorioInjected;
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

	private Logger logger;

	@Inject
	@GeradorRelatorioInjected
	protected GeradorRelatorio<T> relatorios;

	@Inject
	@FilterInjected
	protected FilterManager<T> filterManager;

	protected Fluxo fluxo;

	protected List<T> conteudo;
	protected List<T> filtrados;
	protected List<T> temp;
	protected T registro;
	protected Class<T> genericClazzInstance;

	private List<ColunaPerfil> colunas;

	private List<ColumnModel> columns;

	@Inject
	@PrimeInfoList(list = "cadastroAreaAtuacao")
	@PrimefacesDataTableInjected
	private DataTable dataTable;

	public abstract void init();

	public Map<String, Object> obterParametrosRelatório() {
		logger.info("Obtendo parametros para carregar relatório");
		final Map<String, Object> parametros = new HashMap<String, Object>();
		parametros.put("usuarioLogado", getUsuario().getNome());
		parametros.put("label.usuario", getUsuario().getLabels().getField("label.usuario"));
		try {
			logger.info("Carregando logo da empresa");
			parametros.put("logo", ImageIO.read(Thread.currentThread().getContextClassLoader().getResourceAsStream("01.png")));
		} catch (final IOException e) {
			logger.error("Erro ao carregar logo da empresa");
		}
		return parametros;
	}

	protected abstract Logger getLogger();

	protected void init(final List<T> listaConteudo) {
		showMenuBar(500, 600);
		logger = getLogger();
		if (logger == null) {
			throw new GoLiveException("ManagedBean não possui log para acompanhamento dos processos, implemente o logger para que a página possa ser renderizada");
		}

		this.conteudo = listaConteudo;
		this.filtrados = new ArrayList<T>();
		this.temp = new ArrayList<T>();
		filtrados.addAll(conteudo);
		fluxo = getFluxoListagem();
		inicializarClasse();
		if (getFilterManager() != null) {
			getFilterManager().setInstance(this);
			for (final Field field : this.getClass().getDeclaredFields()) {
				if (field.isAnnotationPresent(Filter.class)) {
					getFilterManager().putGetter(field.getAnnotation(Filter.class).campo());
				}
			}
		}
		try {
			verificarConfiguracaoDeOrdenacao();
		} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException | NoSuchMethodException | SecurityException e) {
			e.printStackTrace();
		}

	}

	private final String columnTemplate = "id brand year";
	private final static List<String> VALID_COLUMN_KEYS = Arrays.asList("id", "brand", "year", "color", "price");


	private void createDynamicColumns() {

		for (final ColunaPerfil col : colunas) {

		}

		final String[] columnKeys = columnTemplate.split(" ");
		columns = new ArrayList<ColumnModel>();

		for (final String columnKey : columnKeys) {
			final String key = columnKey.trim();

			if (VALID_COLUMN_KEYS.contains(key)) {
				columns.add(new ColumnModel(columnKey.toUpperCase(), columnKey));
			}
		}
	}

	public List<GoliveFilter> obterFiltros() {
		final List<GoliveFilter> filtros = new ArrayList<GoliveFilter>();

		for (final Field field : this.getClass().getDeclaredFields()) {
			if (field.isAnnotationPresent(Filter.class)) {
				try {
					filtros.add((GoliveFilter) this.getClass().getDeclaredMethod("get" + WordUtils.capitalize(field.getName())).invoke(this));
				} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException | NoSuchMethodException | SecurityException e) {
					e.printStackTrace();
				}
			}
		}
		return filtros;

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

	public void updateColumns() {
		// reset table state
		final UIComponent table = FacesContext.getCurrentInstance().getViewRoot().findComponent(":form:cars");
		table.setValueExpression("sortBy", null);

		// update columns
		createDynamicColumns();
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

	/**
	 * @author Guilherme
	 * 
	 *         <p>
	 *         Método responsável por obter a classe genérica instanciada.
	 *         </p>
	 */
	@SuppressWarnings("unchecked")
	private void inicializarClasse() {
		logger.info("Inicializando Classe Generica");
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
			logger.info("Não existe registro para processar");
			fixarMenu();
			return false;
		}
		return true;
	}

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

	/**
	 * @author Guilherme
	 * 
	 *         <p>
	 *         Método responsável por o label da pagina, definindo assim o
	 *         titulo na toolbar da pagina, para que este método funcione é
	 *         necessario que a classe seja anotada com a anotação {@link Label}
	 *         </p>
	 * 
	 * @return {@link String}
	 * 
	 */
	public String nomePagina() {
		return JSFUtils.getLabelPageName(this.getClass());
	}

	/**
	 * @author Guilherme
	 * 
	 *         <p>
	 *         Método responsável por obter a {@link Class} do pojo no qual
	 *         deverá ser passado para os includes nas páginas de edição estas
	 *         classes deverão ser propriedade da classe generica estendida
	 *         </p>
	 * 
	 * @param fieldName
	 * @return {@link Class}
	 */
	public Class<?> getPojoClass(final String fieldName) {
		try {
			return Utils.getClazz(genericClazzInstance, fieldName);
		} catch (NoSuchFieldException | SecurityException e) {
			logger.error("Houve um erro ao tentar obter a classe membro da classe generica");
			logger.error(e.getMessage());
			e.printStackTrace();
		}
		throw new GoLiveException("Erro ao obter classe de pojo, a classe: " + genericClazzInstance.getName() + " nao possui o campo: " + fieldName);
	}

	/**
	 * @author Guilherme
	 * 
	 *         <p>
	 *         Método responsável por alterar o fluxo da pagina para inclusão,
	 *         deixando de listar os objetos e habilitando a inclusão de um novo
	 *         objeto
	 *         </p>
	 * 
	 */

	public void incluir() {
		fluxo = getFluxoInclusao();
		showMenuBar(0, 0);
	}

	/**
	 * @author Guilherme
	 * 
	 *         <p>
	 *         Método responsável por alterar o fluxo da pagina para edição,
	 *         deixando de listar os objetos e habilitando a edição de um objeto
	 *         selecionado
	 *         </p>
	 * 
	 */
	public void editarRegistro() {
		if (isSelecionado()) {
			fluxo = getFluxoEdicao();
			showMenuBar(0, 0);
			logger.info("Edicao de registro = {} ", registro);
		}
	}

	/**
	 * @author Guilherme
	 * 
	 *         <p>
	 *         Método responsável por alterar o fluxo da pagina para exclusão
	 *         </p>
	 * 
	 */
	public void excluir() {
		if (isSelecionado()) {
			fluxo = getFluxoExclusao();
			showMenuBar(0, 0);
		}
	}

	/**
	 * @author Guilherme
	 * 
	 *         <p>
	 *         Método responsável por salvar o objeto alterado ou criado.
	 *         </p>
	 */
	public void salvar() {
		fluxo = getFluxoListagem();
		showMenuBar(0, 0);
	}

	/**
	 * @author Guilherme
	 * 
	 *         <p>
	 *         Método responsável por cancelar a edição o objeto alterado ou
	 *         criado.
	 *         </p>
	 * 
	 */
	public void cancelar() {
		showMenuBar(0, 0);
		fluxo = getFluxoListagem();
		if (registro == null) {
			logger.info("Cancelando inclusao de registro");
		} else {
			logger.info("Cancelando edicao do registro = {} ", registro);
		}

	}

	/**
	 * @author Guilherme
	 * 
	 *         <p>
	 *         Método responável por obter o fluxo de listagem
	 *         </p>
	 * 
	 * @return {@link Fluxo}
	 */
	public Fluxo getFluxoExclusao() {
		return Fluxo.EXCLUSAO;
	}

	/**
	 * @author Guilherme
	 * 
	 *         <p>
	 *         Método responável por obter o fluxo de listagem
	 *         </p>
	 * 
	 * @return {@link Fluxo}
	 */
	public Fluxo getFluxoListagem() {
		return Fluxo.LISTAGEM;
	}

	/**
	 * @author Guilherme
	 * 
	 *         <p>
	 *         Método responável por obter o fluxo de inclusao
	 *         </p>
	 * 
	 * @return {@link Fluxo}
	 * 
	 */
	public Fluxo getFluxoInclusao() {
		return Fluxo.INCLUSAO;
	}

	/**
	 * @author Guilherme
	 * 
	 *         <p>
	 *         Método responável por obter o fluxo de edicao
	 *         </p>
	 * 
	 * @return {@link Fluxo}
	 */
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
			logger.info("Gerando relatório para classe = {}", genericClazzInstance.getName());
			relatorios.gerarRelatorio(tipoRelatorio, filtrados, obterParametrosRelatório(), labels);
		} catch (GoLiveException | JRException | IOException e) {
			logger.error("Erro ao gerar relatorio = {}", genericClazzInstance.getName());
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

	@SuppressWarnings("rawtypes")
	private void verificarConfiguracaoDeOrdenacao() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {
		setColunas(obterConfiruacaoTela());
		final Field[] fields = getPojoClass("cadastroAreaAtuacao").getDeclaredFields();
		// Verificar se o campo ainda nao foi cadastrado na tabela de ordem

		verificarConfiguracaoDeOrdenacaoComEntidade(fields);

		List<ColunaPerfil> reorder = null;

		// Verifica se o campo foi excluído da tabela.

		for (final ColunaPerfil conf : getColunas()) {
			if (!Utils.obterColumnName(conf.getColuna(), fields)) {
				if (reorder == null) {
					reorder = new ArrayList<ColunaPerfil>();
				}
				reorder.add(conf);
			}
		}

		if (reorder != null) {
			getColunas().removeAll(reorder);
			for (int i = 0; i < getColunas().size(); i++) {
				getColunas().get(i).setOrdem(new Integer(i + 1).longValue());
			}
			// TODO update
		}
		
		for (final ColunaPerfil coluna : colunas) {
			for(final Field filtro : this.getClass().getDeclaredFields()){
				if(filtro.isAnnotationPresent(Filter.class)){
					if(filtro.getAnnotation(Filter.class).name().equals(coluna.getColuna())){
						coluna.setFiltro((GoliveFilter) this.getClass().getMethod("get" + WordUtils.capitalize(filtro.getName())).invoke(this));
					}
				}
			}
			
		}
	}

	public boolean obterTipoFiltroPagina(final ColunaPerfil coluna, final String tipo) {
		
		if (coluna.getFiltro() != null) {
			return true;
		}
		return false;
	}

	public Object obterLabelColuna(final ColunaPerfil coluna, final T indice, final String caminho) {
		Object ret = indice;
		Method getter;
		try {
			if (caminho != null) {
				for (final String string : caminho.replace(".", "_").split("_")) {
					getter = genericClazzInstance.getMethod("get" + WordUtils.capitalize(string));
					ret = getter.invoke(ret);
				}
				getter = ret.getClass().getMethod("get" + WordUtils.capitalize(coluna.getColuna()));
				ret = getter.invoke(ret);
			} else {
				getter = genericClazzInstance.getMethod("get" + WordUtils.capitalize(coluna.getColuna()));
				ret = getter.invoke(indice);				
			}
		} catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
			logger.error("Erro ao obter label da coluna generica");
			e.printStackTrace();
		}
		
		if (ret != null) {
			if ((coluna.getFiltro() != null) && (coluna.getFiltro().getGenericType().equals(Date.class))) {
				return ((Calendar) ret).getTime();
			} else {
				return ret;
			}
		} else {
			throw new GoLiveException("Não foi possivel obter label da coluna dinamica");
		}

	}

	private void verificarConfiguracaoDeOrdenacaoComEntidade(final Field[] fields) {
		for (final Field field : fields) {
			// TODO mudar este 'true' e Incluir apenas os @Column
			if (!field.isAnnotationPresent(Transient.class)) {
				if ((true) && (!JSFUtils.verificarColuna(getColunas(), field.getName()))) {
					// TODO inserir na base tambem;
					// TODO Alterar o field.getname para o nome da colunas
					// @COlumn
					getColunas().add(new ColunaPerfil(usuario.getId(), new Integer(getColunas().size() + 1).longValue(), genericClazzInstance.getName(), field.getName(), false, getEmpresaSelecionada()));
				}
			}
		}
	}

	public void guardarOrdemTabela() {

		getColunas().removeAll(getColunas());

		Long cont = 1L;

		for (int i = 0; i < dataTable.getColumns().size(); i++) {
			if (!dataTable.getColumns().get(i).getClientId().contains("seletor")) {
				getColunas().add(new ColunaPerfil(usuario.getId(), cont++, getPojoClass("cadastroAreaAtuacao").getName(), dataTable.getColumns().get(i).getClientId().replace(getForm(), "").replace(getIdTable(), "").replace(":", ""), true, getEmpresaSelecionada()));
			}
		}
		verificarConfiguracaoDeOrdenacaoComEntidade(getPojoClass("cadastroAreaAtuacao").getDeclaredFields());

		System.out.println("UPDATE");

	}

	@Deprecated
	public List<ColunaPerfil> obterConfiruacaoTela() {
		final List<ColunaPerfil> returnList = new ArrayList<ColunaPerfil>();
		returnList.add(new ColunaPerfil(usuario.getId(), 1L, getPojoClass("cadastroAreaAtuacao").getName(), "teste2", true, getEmpresaSelecionada()));
		returnList.add(new ColunaPerfil(usuario.getId(), 2L, getPojoClass("cadastroAreaAtuacao").getName(), "id", true, getEmpresaSelecionada()));
		returnList.add(new ColunaPerfil(usuario.getId(), 3L, getPojoClass("cadastroAreaAtuacao").getName(), "teste", true, getEmpresaSelecionada()));
		returnList.add(new ColunaPerfil(usuario.getId(), 4L, getPojoClass("cadastroAreaAtuacao").getName(), "areaDeAtuacao", true, getEmpresaSelecionada()));

		return returnList;
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

	public void setLogger(final Logger logger) {
		this.logger = logger;
	}

	public GoliveOneProperties getLabels() {
		return usuario.getLabels();
	}

	public List<ColunaPerfil> getColunas() {
		return colunas;
	}

	public void setColunas(final List<ColunaPerfil> colunas) {
		this.colunas = colunas;
	}

	public List<ColumnModel> getColumns() {
		return columns;
	}

	public void setColumns(final List<ColumnModel> columns) {
		this.columns = columns;
	}

	public DataTable getDataTable() {
		return dataTable;
	}

	public void setDataTable(final DataTable dataTable) {
		this.dataTable = dataTable;
	}

	public String getColumnTemplate() {
		return columnTemplate;
	}

	public static List<String> getValidColumnKeys() {
		return VALID_COLUMN_KEYS;
	}

}
