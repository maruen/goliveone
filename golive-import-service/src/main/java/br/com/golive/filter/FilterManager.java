package br.com.golive.filter;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang.WordUtils;
import org.slf4j.Logger;

import br.com.golive.annotation.Fake;
import br.com.golive.annotation.Filter;
import br.com.golive.constants.TipoFiltro;
import br.com.golive.exception.GoLiveException;

public class FilterManager<T> {

	@Inject
	private Logger logger;

	private Object instance;

	private final List<T> temp;

	public FilterManager() {
		super();
		this.temp = new ArrayList<T>();
	}

	@SuppressWarnings({ "rawtypes" })
	public void filtrar(final List<T> conteudo, final List<T> filtrados, final GoliveFilter filtro, final String field) {
		try {
			temp.addAll(conteudo);
			if (filtro != null) {
				setFilterOnBean(filtro, field);

				if (verificarFiltro(filtro)) {
					if (filtro.getGenericType().getSimpleName().equals("Long")) {
						retirarNumerosForaDoParametro(conteudo, temp, filtro, field);
					} else if (filtro.getGenericType().getSimpleName().equals("String")) {
						retirarStringForaDoParametro(conteudo, temp, filtro, field);
					} else if (filtro.getGenericType().getSimpleName().equals("Date")) {
						retirarDatasForaDoParametro(conteudo, temp, filtro, field);
					}
				}
			} else {
				setFilterOnBean(null, field);
			}
			atualizarListaDeFiltrados(conteudo, temp, filtrados);
			filtrarPorPelosCamposRestantes(field, temp, filtrados);
			atualizarListaDeFiltrados(conteudo, temp, filtrados);
			temp.removeAll(conteudo);
		} catch (final Exception e) {
			temp.removeAll(conteudo);
			filtrados.removeAll(conteudo);
			filtrados.addAll(conteudo);
			logger.error("Houve um ao realizar o filtro");
			e.printStackTrace();
		}
	}

	public void setTipoFiltroMB(final String field, final TipoFiltro filter) {

		try {
			for (final Field campo : getInstance().getClass().getDeclaredFields()) {
				if (campo.isAnnotationPresent(Filter.class)) {
					if (campo.getAnnotation(Filter.class).name().equals(field)) {
						((DateFilter) getInstance().getClass().getDeclaredMethod("get" + WordUtils.capitalize(campo.getName())).invoke(getInstance())).setTipo(filter);
					}
				}
			}
		} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException | NoSuchMethodException | SecurityException e) {
			logger.error("Erro ao acessar o setter do filtro no managedBean");
			throw new GoLiveException("Não existe o campo anotado com " + Filter.class.getName() + " no managedBean");
		}
		logger.error("Erro ao acessar o setter do filtro no managedBean");
		throw new GoLiveException("Não existe o campo anotado com " + Filter.class.getName() + " no managedBean");

	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void selecionarTipoFiltro(final GoliveFilter filter) {
		try {
			if (filter.getTipo() != null) {
				if ((filter != null) && (((filter.getTipo().equals(TipoFiltro.INTERVALO))) || ((filter.getTipo().equals(TipoFiltro.PERIODO))))) {
					filter.setFim(null);
				}
			}
		} catch (final Exception e) {
			logger.error("Erro selecionar Tipo Filtro");
			e.printStackTrace();
		}

	}

	@SuppressWarnings("rawtypes")
	public Map<String, GoliveFilter> getFiltrosRestantes(final String field) {

		final Map<String, GoliveFilter> ret = new HashMap<String, GoliveFilter>();

		try {
			for (final Field campo : getInstance().getClass().getDeclaredFields()) {
				if (campo.isAnnotationPresent(Filter.class)) {
					if (!campo.getAnnotation(Filter.class).name().equals(field)) {
						ret.put(campo.getAnnotation(Filter.class).name(), (GoliveFilter) getInstance().getClass().getDeclaredMethod("get" + WordUtils.capitalize(campo.getName())).invoke(getInstance()));
					}
				}
			}
		} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException | NoSuchMethodException | SecurityException e) {
			logger.error("Erro ao obterFiltro");
			e.printStackTrace();
		}
		return ret;

	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void setFilterOnBean(final GoliveFilter filter, final String field) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {
		boolean inseriu = false;

		for (final Field campo : getInstance().getClass().getDeclaredFields()) {
			if (campo.isAnnotationPresent(Filter.class)) {
				if (campo.getAnnotation(Filter.class).name().equals(field)) {

					if (filter == null) {
						final GoliveFilter instanceFilter = (GoliveFilter) getInstance().getClass().getDeclaredMethod("get" + WordUtils.capitalize(campo.getName())).invoke(getInstance());
						instanceFilter.setInicio(null);
						instanceFilter.setFim(null);
					} else {
						final Method setter = getInstance().getClass().getDeclaredMethod("set" + WordUtils.capitalize(campo.getName()), filter.getClass());
						setter.invoke(getInstance(), new Object[] { filter });
					}
					inseriu = true;
				}
			}
		}
		if (!inseriu) {
			/**
			 * Utilizado para testes
			 */
			if (!getInstance().getClass().isAnnotationPresent(Fake.class)) {
				throw new GoLiveException("Não existe o campo anotado com " + Filter.class.getName() + " no managedBean");
			}
		}
	}

	@SuppressWarnings("rawtypes")
	private void retirarDatasForaDoParametro(final List<T> lista, final List<T> temp, final GoliveFilter filter, final String field) throws NoSuchFieldException, SecurityException, NoSuchMethodException {
		final DateFilter filtro = (DateFilter) filter;
		for (final T index : lista) {
			switch (filtro.getTipo()) {
			case IGUAL:
				if (filtro.getInicio().getTime() != ( (Calendar)getAtributoPorFieldEntity(index, field)).getTime()) {
					temp.remove(index);
				}
				break;

			case MENOR:
				if (filtro.getInicio().before(getAtributoPorFieldEntity(index, field))) {
					temp.remove(index);
				}
				break;

			case MAIOR:
				if (filtro.getInicio().after(getAtributoPorFieldEntity(index, field))) {
					temp.remove(index);
				}
				break;

			case PERIODO:
				if (!(filtro.getInicio().before(getAtributoPorFieldEntity(index, field))) ||
				   !( (Calendar) getAtributoPorFieldEntity(index, field)).before(filtro.getFim())) {
					temp.remove(index);
				}
				break;

			default:
				break;
			}
		}
	}

	@SuppressWarnings("rawtypes")
	private void retirarNumerosForaDoParametro(final List<T> lista, final List<T> temp, final GoliveFilter filter, final String field) throws NoSuchFieldException, SecurityException, NoSuchMethodException {
		final NumberFilter filtro = (NumberFilter) filter;
		for (final T index : lista) {
			switch (filtro.getTipo()) {
			case IGUAL:
				if (!filtro.getInicio().equals(getAtributoPorFieldEntity(index, field))) {
					temp.remove(index);
				}
				break;

			case MENOR:
				if (filtro.getInicio() <= ((Long) getAtributoPorFieldEntity(index, field))) {
					temp.remove(index);
				}
				break;

			case MAIOR:
				if (filtro.getInicio() >= ((Long) getAtributoPorFieldEntity(index, field))) {
					temp.remove(index);
				}
				break;

			case INTERVALO:
				if (!(filtro.getInicio() <= ((Long) getAtributoPorFieldEntity(index, field))) || !(((Long) getAtributoPorFieldEntity(index, field)) <= filtro.getFim())) {
					temp.remove(index);
				}
				break;

			case CONTEM:
				if (!getAtributoPorFieldEntity(index, field).toString().contains(filtro.getInicio().toString())) {
					temp.remove(index);
				}
				break;

			default:
				break;
			}
		}
	}

	@SuppressWarnings("rawtypes")
	private void retirarStringForaDoParametro(final List<T> lista, final List<T> temp, final GoliveFilter filter, final String field) throws NoSuchFieldException, SecurityException, NoSuchMethodException {
		for (final T index : lista) {
			switch (filter.getTipo()) {
			case IGUAL:
				if (!filter.getInicio().equals(getAtributoPorFieldEntity(index, field))) {
					temp.remove(index);
				}
				break;

			case CONTEM:
				if (!getAtributoPorFieldEntity(index, field).toString().contains(filter.getInicio().toString())) {
					temp.remove(index);
				}
				break;

			default:
				break;
			}
		}
	}

	private Object getAtributoPorFieldEntity(final T index, final String field) throws NoSuchFieldException, SecurityException, NoSuchMethodException {
		try {

			if (index.getClass().getDeclaredField(field) != null) {
				final Object retorno = index.getClass().getDeclaredMethod("get" + WordUtils.capitalize(field)).invoke(index);
				switch (retorno.getClass().getSimpleName()) {
				case "Long":
					return Long.parseLong(retorno.toString());
				case "GregorianCalendar":
					return returnDate(retorno);
				case "String":
					return retorno.toString();
				default:
					break;
				}
			}
		} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
			logger.error("Erro ao obterCampo da entidade no indice da lista");
			e.printStackTrace();
		}
		return null;

	}

	private Date returnDate(final Object instances) {
		final Calendar cal = Calendar.getInstance();

		cal.set(Calendar.DAY_OF_MONTH, ((Calendar) instances).get(Calendar.DAY_OF_MONTH));
		cal.set(Calendar.MONTH, ((Calendar) instances).get(Calendar.MONTH));
		cal.set(Calendar.YEAR, ((Calendar) instances).get(Calendar.YEAR));
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.MILLISECOND, 0);
		cal.set(Calendar.SECOND, 0);
		return cal.getTime();
	}

	/**
	 * @author Guilherme
	 * 
	 *         <p>
	 *         Método utilizado pelo método filtrarPorData
	 *         </p>
	 * @param <T>
	 * 
	 */
	private void atualizarListaDeFiltrados(final List<T> conteudo, final List<T> temp, final List<T> filtrados) {
		filtrados.removeAll(conteudo);
		filtrados.addAll(temp);
	}

	/**
	 * @author Guilherme
	 * 
	 *         <p>
	 *         Método utilizado pelo método filtrarPorData
	 *         </p>
	 * @param <T>
	 * 
	 * @param field
	 * @param sdf
	 */

	@SuppressWarnings("rawtypes")
	private void filtrarPorPelosCamposRestantes(final String field, final List<T> temp, final List<T> filtrados) {

		final Map<String, GoliveFilter> filtrosRestantes = getFiltrosRestantes(field);

		for (final String key : filtrosRestantes.keySet()) {
			try {
				if (verificarFiltro(filtrosRestantes.get(key))) {
					if (filtrosRestantes.get(key).getGenericType().getSimpleName().equals("Long")) {
						retirarNumerosForaDoParametro(filtrados, temp, filtrosRestantes.get(key), key);
					} else if (filtrosRestantes.get(key).getGenericType().getSimpleName().equals("String")) {
						retirarStringForaDoParametro(filtrados, temp, filtrosRestantes.get(key), key);
					} else if (filtrosRestantes.get(key).getGenericType().getSimpleName().equals("Date")) {
						retirarDatasForaDoParametro(filtrados, temp, filtrosRestantes.get(key), key);
					}
				}
			} catch (NoSuchFieldException | SecurityException | NoSuchMethodException e) {
				logger.error("Erro ao filtrar por parametros restantes");
				e.printStackTrace();
			}
		}
	}

	@SuppressWarnings("rawtypes")
	private boolean verificarFiltro(final GoliveFilter filtro) {

		if (filtro.getTipo() != null) {
			if ((filtro.getTipo().equals(TipoFiltro.INTERVALO)) || (filtro.getTipo().equals(TipoFiltro.PERIODO))) {
				return ((filtro.getInicio() != null) && (filtro.getFim() != null));
			} else {
				return ((filtro.getInicio() != null) && (!filtro.getInicio().toString().isEmpty()));
			}
		}

		return false;
	}

	public Object getInstance() {
		return instance;
	}

	public void setInstance(final Object instance) {
		this.instance = instance;
	}

	public TipoFiltro getIgual() {
		return TipoFiltro.IGUAL;
	}

	public TipoFiltro getMaior() {
		return TipoFiltro.MAIOR;
	}

	public TipoFiltro getMenor() {
		return TipoFiltro.MENOR;
	}

	public TipoFiltro getPeriodo() {
		return TipoFiltro.PERIODO;
	}

	public TipoFiltro getIntervalo() {
		return TipoFiltro.INTERVALO;
	}

	public TipoFiltro getContem() {
		return TipoFiltro.CONTEM;
	}

}
