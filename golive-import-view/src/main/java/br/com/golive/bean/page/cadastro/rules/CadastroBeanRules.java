package br.com.golive.bean.page.cadastro.rules;

import java.io.IOException;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.imageio.ImageIO;
import javax.inject.Inject;

import net.sf.jasperreports.engine.JRException;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang.WordUtils;
import org.primefaces.component.api.UIColumn;
import org.primefaces.component.datatable.DataTable;
import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.annotation.Label;
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
public abstract class CadastroBeanRules<T> extends GenericBean implements
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

	protected List<ColunaPerfil> colunas;

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
		// verificarConfiguracaoDeOrdenacao();
		if (getFilterManager() != null) {
			getFilterManager().setInstance(this);
			// for (final Field field : this.getClass().getDeclaredFields()) {
			// if (field.isAnnotationPresent(Filter.class)) {
			// getFilterManager().putGetter(field.getAnnotation(Filter.class).campo());
			// }
			// }
			// getFilterManager().setPrimeFacesDataTable(dataTable);
			// getFilterManager().setColunas(colunas);
			// getFilterManager().setForm(getForm());
		}
		// ServiceUtils.ordenarTabela(dataTable, colunas, getIdTable(),
		// getForm());
	}

	@Deprecated
	public void ordernarTabela() {
		final List<UIColumn> colunasDataTable = new ArrayList<UIColumn>();
		colunasDataTable.addAll(dataTable.getColumns());
		dataTable.getColumns().removeAll(colunasDataTable);
		dataTable.getColumns().add(colunasDataTable.get(0));

		for (final ColunaPerfil conf : colunas) {
			for (int i = 1; i < colunasDataTable.size(); i++) {
				if (colunasDataTable.get(i).getClientId().replace(getForm(), "").replace(getIdTable(), "").replace(":", "").equals(conf.getColuna())) {
					if (conf.getVisibilidade()) {
						dataTable.getColumns().add(colunasDataTable.get(i));
						i = colunasDataTable.size();
					}
				}
			}
		}
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

	protected void showMenuBar(final long height, final long top) {
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
					return (GoliveFilter) this.getClass().getMethod("get" + WordUtils.capitalize(field.getName())).invoke(this);
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

}
