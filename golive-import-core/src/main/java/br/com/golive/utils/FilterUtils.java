package br.com.golive.utils;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.WordUtils;
import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.constants.TipoFiltroData;
import br.com.golive.exception.GoLiveException;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.GoliveFilter;

public class FilterUtils<T> {

	private final Logger logger;

	private Object instance;

	private final List<T> temp;

	private final List<String> getterManagedBean;

	public FilterUtils(final Logger logger) {
		this.logger = logger;
		this.temp = new ArrayList<T>();
		this.getterManagedBean = new ArrayList<String>();
	}

	public void putGetter(final String... fields) throws NoSuchMethodException, SecurityException {

		for (final String definicoes : fields) {
			if (!getterManagedBean.contains(definicoes)) {
				getterManagedBean.add(definicoes);
			}
		}

	}

	public void setTipoFiltroMB(final String field, final TipoFiltroData filter) {

		try {
			for (final Field campo : getInstance().getClass().getDeclaredFields()) {
				if (campo.isAnnotationPresent(Filter.class)) {
					if (campo.getAnnotation(Filter.class).name().equals(field)) {
						((DateFilter) getInstance().getClass().getDeclaredMethod("get" + WordUtils.capitalize(campo.getName())).invoke(getInstance())).setTipo(filter);
					}
				}
			}
		} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException | NoSuchMethodException | SecurityException e) {
			throw new GoLiveException("Não existe o campo anotado com " + Filter.class.getName() + " no managedBean");
		}
		throw new GoLiveException("Não existe o campo anotado com " + Filter.class.getName() + " no managedBean");

	}

	@Deprecated
	public void selecionarTipoFiltragemData(final DateFilter data) {
		if (data.getTipo().equals(TipoFiltroData.PERIODO)) {
			data.setFim(data.getInicio());
		} else {
			data.setFim(null);
		}
	}

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

	public void setDateInicialNoFilter(final GoliveFilter filter, final String field) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {
		boolean inseriu = false;

		for (final Field campo : getInstance().getClass().getDeclaredFields()) {
			if (campo.isAnnotationPresent(Filter.class)) {
				if (campo.getAnnotation(Filter.class).name().equals(field)) {
					getInstance().getClass().getDeclaredMethod("set" + WordUtils.capitalize(campo.getName()), filter.getClass()).invoke(getInstance(), new Object[] { filter });
					inseriu = true;
				}
			}
		}
		if (!inseriu) {
			throw new GoLiveException("Não existe o campo anotado com " + Filter.class.getName() + " no managedBean");
		}
	}

	public TipoFiltroData getMenor() {
		return TipoFiltroData.MENOR;
	}

	public TipoFiltroData getIgual() {
		return TipoFiltroData.IGUAL;
	}

	public TipoFiltroData getMaior() {
		return TipoFiltroData.MAIOR;
	}

	public TipoFiltroData getPeriodo() {
		return TipoFiltroData.PERIODO;
	}

	/**
	 * @author Guilherme
	 * 
	 *         <p>
	 *         Método responsável por realizar um filtro das listas com Calendar
	 *         ou Date
	 *         </p>
	 * @param <T>
	 * 
	 * @param field
	 * @param date
	 */
	public void filtrarPorData(final List<T> conteudo, final List<T> filtrados, final DateFilter date, final String field) {
		try {
			temp.addAll(conteudo);
			logger.info("Filtrando lista por data, campo = {}", field);
			if (date != null) {
				setDateInicialNoFilter(date, field);
				if (verificarFiltro(date)) {
					retirarDadosForaDoParametro(conteudo, temp, date, field);
				}
				atualizarListaDeFiltrados(conteudo, temp, filtrados);
			} else {
				setDateInicialNoFilter(new DateFilter(), field);
			}
			filtrarPorPelosCamposRestantes(field, temp, filtrados);
			atualizarListaDeFiltrados(conteudo, temp, filtrados);
			temp.removeAll(conteudo);
		} catch (final Exception e) {
			logger.error("Houve um ao realizar o filtro com esta data");
			e.printStackTrace();
		}
	}

	private void retirarDadosForaDoParametro(final List<T> lista, final List<T> temp, final GoliveFilter filter, final String field) throws NoSuchFieldException, SecurityException, NoSuchMethodException {
		final DateFilter date = (DateFilter) filter;
		for (final T index : lista) {
			switch (date.getTipo()) {
			case IGUAL:
				if (date.getInicio().getTime() != getDatePorFieldEntity(index, field).getTime()) {
					temp.remove(index);
				}
				break;

			case MENOR:
				if (date.getInicio().getTime() <= getDatePorFieldEntity(index, field).getTime()) {
					temp.remove(index);
				}
				break;

			case MAIOR:
				if (date.getInicio().getTime() >= getDatePorFieldEntity(index, field).getTime()) {
					temp.remove(index);
				}
				break;

			case PERIODO:
				if (!(date.getInicio().getTime() <= getDatePorFieldEntity(index, field).getTime()) || !(getDatePorFieldEntity(index, field).getTime() <= date.getFim().getTime())) {
					temp.remove(index);
				}
				break;

			default:
				break;
			}
		}
	}

	private Date getDatePorFieldEntity(final T index, final String field) throws NoSuchFieldException, SecurityException, NoSuchMethodException {
		try {

			Object instances = null;

			for (final String key : getterManagedBean) {
				if (key.contains(field)) {
					for (final String string : key.replace(".", " ").split(" ")) {

						if (instances == null) {
							if (index.getClass().getDeclaredField(string) != null) {
								instances = index.getClass().getDeclaredMethod("get" + WordUtils.capitalize(string)).invoke(index);
							}
						} else {
							if (instances.getClass().getDeclaredField(string) != null) {
								instances = instances.getClass().getDeclaredMethod("get" + WordUtils.capitalize(string)).invoke(instances);
							}
						}
					}
				}
			}

			final Calendar cal = Calendar.getInstance();

			cal.set(Calendar.DAY_OF_MONTH, ((Calendar) instances).get(Calendar.DAY_OF_MONTH));
			cal.set(Calendar.MONTH, ((Calendar) instances).get(Calendar.MONTH));
			cal.set(Calendar.YEAR, ((Calendar) instances).get(Calendar.YEAR));
			cal.set(Calendar.HOUR_OF_DAY, 0);
			cal.set(Calendar.MINUTE, 0);
			cal.set(Calendar.MILLISECOND, 0);
			cal.set(Calendar.SECOND, 0);
			return cal.getTime();
		} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return null;

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

	private void filtrarPorPelosCamposRestantes(final String field, final List<T> temp, final List<T> filtrados) {

		final Map<String, GoliveFilter> filtrosRestantes = getFiltrosRestantes(field);

		for (final String filtro : filtrosRestantes.keySet()) {
			try {
				if (verificarFiltro(filtrosRestantes.get(filtro))) {
					retirarDadosForaDoParametro(filtrados, temp, filtrosRestantes.get(filtro), filtro);
				}
			} catch (NoSuchFieldException | SecurityException | NoSuchMethodException e) {
				e.printStackTrace();
			}
		}
	}

	private boolean verificarFiltro(final GoliveFilter filtro) {
		if (filtro.getClass().equals(DateFilter.class)) {
			final DateFilter dateFilter = (DateFilter) filtro;

			if (dateFilter.getTipo() != null) {
				if (dateFilter.getTipo().equals(TipoFiltroData.PERIODO)) {
					return ((dateFilter.getInicio() != null) && (dateFilter.getFim() != null));
				} else {
					return dateFilter.getInicio() != null;
				}
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

}
