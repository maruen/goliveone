package br.com.golive.bean.page.cadastro.rules;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.slf4j.Logger;

import lombok.Data;
import br.com.golive.annotation.Label;
import br.com.golive.exception.GoLiveException;
import br.com.golive.qualifier.GeradorRelatorioInjected;
import br.com.golive.relatorio.GeradorRelatorio;
import br.com.golive.utils.Fluxo;
import br.com.golive.utils.JSFUtils;
import br.com.golive.utils.Utils;

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
public abstract class CadastroBeanRules<T> implements Serializable {

	private static final long serialVersionUID = 1L;
	private Logger logger;

	@Deprecated
	protected boolean implementada = true;

	@Inject
	@GeradorRelatorioInjected
	protected GeradorRelatorio<T> relatorios;

	protected Fluxo fluxo;

	protected List<T> conteudo;
	protected List<T> filtrados;
	protected List<T> temp;
	protected T registro;
	protected Class<T> genericClazzInstance;

	public abstract void init();

	public abstract void imprimir();

	public abstract void exportarXls();

	public abstract void exportarPdf();

	public abstract boolean isSelecionado();

	public abstract Map<String, Object> obterParametrosRelatório();

	protected abstract void setDataMB(final String field, final Date data);

	protected abstract Date getDatePorFieldEntity(final T entity, final String field);

	protected abstract Date getDataMB(final String field);

	protected abstract List<String> getFiltros(final String field);

	protected abstract Logger getLogger();

	/**
	 * @author Guilherme
	 * @author Maruen
	 * 
	 *         <p>
	 *         Método responsável por inicializar as listas e objetos para
	 *         selecao nas páginas de cadastro este método é OBRIGATORIO, e lhe
	 *         é esperado uma lista com a entidade definida como parametro esta
	 *         entidade podera ser obtida através de algum {@link EJB}.
	 *         </p>
	 * 
	 * @param listaConteudo
	 */
	protected void init(final List<T> listaConteudo) {

		logger = getLogger();
		if(logger == null){
			throw new GoLiveException("ManagedBean não possui log para acompanhamento dos processos, implemente o logger para que a página possa ser renderizada");
		}
		
		this.conteudo = listaConteudo;
		this.filtrados = new ArrayList<T>();
		this.temp = new ArrayList<T>();
		filtrados.addAll(conteudo);
		fluxo = getFluxoListagem();
		inicializarClasse();
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
			logger.info("Obtendo Subclasse da Classe Generica, por field = {}", fieldName);
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
	 *         Método responsável por realizar um filtro das listas com Calendar
	 *         ou Date
	 *         </p>
	 * 
	 * @param field
	 * @param date
	 */
	public void filtrarPorData(final String field, final Date date) {
		try {
			logger.info("Filtrando lista por data, campo = {}", field);
			setDataMB(field, date);
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			temp.addAll(conteudo);
			if (getDataMB(field) != null) {
				for (T index : conteudo) {
					if (!sdf.format(getDataMB(field)).equals(sdf.format(getDatePorFieldEntity(index, field)))) {
						temp.remove(index);
					}
				}
			}
			atualizarListaDeFiltrados();
			filtrarPorPelosCamposRestantes(field, sdf);
			atualizarListaDeFiltrados();
			temp.removeAll(conteudo);
		} catch (Exception e) {
			logger.error("Houve um ao realizar o filtro com esta data");
			logger.error(e.getMessage());
			
		}
	}

	/**
	 * @author Guilherme
	 * 
	 *         <p>
	 *         Método utilizado pelo método filtrarPorData
	 *         </p>
	 * 
	 * @param field
	 * @param sdf
	 */
	private void filtrarPorPelosCamposRestantes(final String field, SimpleDateFormat sdf) {
		for (String filtro : getFiltros(field)) {
			if (filtro != null) {
				for (T index : filtrados) {
					if (!sdf.format(getDataMB(filtro)).equals(sdf.format(getDatePorFieldEntity(index, filtro)))) {
						temp.remove(index);
					}
				}
			}
		}
	}

	/**
	 * @author Guilherme
	 * 
	 *         <p>
	 *         Método utilizado pelo método filtrarPorData
	 *         </p>
	 * 
	 */
	private void atualizarListaDeFiltrados() {
		filtrados.removeAll(conteudo);
		filtrados.addAll(temp);
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
		fluxo = getFluxoEdicao();
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
		fluxo = getFluxoListagem();
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
		fluxo = getFluxoListagem();
		registro = null;
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

}
