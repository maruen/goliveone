package br.com.golive.filter;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.constants.TipoFiltro;
import br.com.golive.utils.Utils;

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
	public void filtrarLista(final List<T> conteudo, final List<T> filtrados, final HashMap<String, Field> mapFilters) {
		try {

			Field field;
			GoliveFilter filtro;
			Filter anntotation;
			temp.addAll(conteudo);
			for (final String key : mapFilters.keySet()) {

				field = mapFilters.get(key);
				field.setAccessible(true);
				filtro = (GoliveFilter) field.get(instance);

				if (filtro != null) {
					anntotation = field.getAnnotation(Filter.class);
					if (verificarFiltro(filtro)) {
						switch (filtro.getGenericType().getSimpleName()) {
						case "Long":
							retirarLongForaDoParametro(conteudo, temp, filtro, anntotation);
						case "String":
							retirarStringForaDoParametro(conteudo, temp, filtro, anntotation);
						case "Date":
							retirarDatasForaDoParametro(conteudo, temp, filtro, anntotation);
						case "Double":
							retirarDoubleForaDoParametro(conteudo, temp, filtro, anntotation);
						}
					}
				}
			}
			atualizarListaDeFiltrados(conteudo, temp, filtrados);
			temp.removeAll(conteudo);
		} catch (IllegalArgumentException | IllegalAccessException | NoSuchFieldException | SecurityException e) {
			e.printStackTrace();
		}

	}

	@SuppressWarnings("rawtypes")
	private void retirarDatasForaDoParametro(final List<T> lista, final List<T> temp, final GoliveFilter filter, final Filter annotation) throws IllegalArgumentException, IllegalAccessException, NoSuchFieldException, SecurityException {
		final DateFilter filtro = (DateFilter) filter;

		Calendar dataEntity;
		Calendar dataInicial = null;
		Calendar dataFinal = null;

		for (final T index : lista) {

			dataEntity = (Calendar) getAtributoPorFieldEntity(index, annotation);
			if (filter.getInicio() != null) {
				dataInicial = Calendar.getInstance();
				dataInicial.setTime((Date) filter.getInicio());
			}

			if (filter.getFim() != null) {
				dataFinal = Calendar.getInstance();
				dataFinal.setTime((Date) filter.getFim());
			}

			switch (filtro.getTipo()) {
			case IGUAL:
				if (dataInicial.getTime().getTime() != dataEntity.getTime().getTime()) {
					temp.remove(index);
				}
				break;

			case MENOR:
				if (dataInicial.before(dataEntity)) {
					temp.remove(index);
				}
				break;

			case MAIOR:
				if (dataInicial.after(dataEntity)) {
					temp.remove(index);
				}
				break;

			case PERIODO:
				if (!(dataInicial.before(dataEntity)) || !(dataEntity.before(dataFinal))) {
					temp.remove(index);
				}
				break;

			default:
				break;
			}
		}
	}

	@SuppressWarnings("rawtypes")
	private void retirarLongForaDoParametro(final List<T> lista, final List<T> temp, final GoliveFilter filter, final Filter annotation) throws IllegalArgumentException, IllegalAccessException, NoSuchFieldException, SecurityException {
		final LongFilter filtro = (LongFilter) filter;
		Long entityLong;
		for (final T index : lista) {
			entityLong = (Long) getAtributoPorFieldEntity(index, annotation);
			switch (filtro.getTipo()) {
			case IGUAL:
				if (!filtro.getInicio().equals(entityLong)) {
					temp.remove(index);
				}
				break;

			case MENOR:
				if (filtro.getInicio() <= entityLong) {
					temp.remove(index);
				}
				break;

			case MAIOR:
				if (filtro.getInicio() >= entityLong) {
					temp.remove(index);
				}
				break;

			case INTERVALO:
				if (!(filtro.getInicio() <= entityLong) || !(entityLong <= filtro.getFim())) {
					temp.remove(index);
				}
				break;

			case CONTEM:
				if (!getAtributoPorFieldEntity(index, annotation).toString().contains(filtro.getInicio().toString())) {
					temp.remove(index);
				}
				break;

			default:
				break;
			}
		}
	}

	@SuppressWarnings("rawtypes")
	private void retirarDoubleForaDoParametro(final List<T> lista, final List<T> temp, final GoliveFilter filter, final Filter annotation) throws IllegalArgumentException, IllegalAccessException, NoSuchFieldException, SecurityException {
		final DoubleFilter filtro = (DoubleFilter) filter;
		Double entityLong;
		for (final T index : lista) {
			entityLong = (Double) getAtributoPorFieldEntity(index, annotation);
			switch (filtro.getTipo()) {
			case IGUAL:
				if (!filtro.getInicio().equals(entityLong)) {
					temp.remove(index);
				}
				break;

			case MENOR:
				if (filtro.getInicio() <= entityLong) {
					temp.remove(index);
				}
				break;

			case MAIOR:
				if (filtro.getInicio() >= entityLong) {
					temp.remove(index);
				}
				break;

			case INTERVALO:
				if (!(filtro.getInicio() <= entityLong) || !(entityLong <= filtro.getFim())) {
					temp.remove(index);
				}
				break;

			case CONTEM:
				if (!getAtributoPorFieldEntity(index, annotation).toString().contains(Long.toString(filtro.getInicio().longValue()))) {
					temp.remove(index);
				}
				break;

			default:
				break;
			}
		}
	}

	@SuppressWarnings("rawtypes")
	private void retirarStringForaDoParametro(final List<T> lista, final List<T> temp, final GoliveFilter filter, final Filter annotation) throws IllegalArgumentException, IllegalAccessException, NoSuchFieldException, SecurityException {
		final StringFilter filtro = (StringFilter) filter;
		String entityString;
		for (final T index : lista) {
			entityString = (String) getAtributoPorFieldEntity(index, annotation);
			switch (filter.getTipo()) {
			case IGUAL:
				if (!filtro.getInicio().toLowerCase().equals(entityString.toLowerCase())) {
					temp.remove(index);
				}
				break;

			case CONTEM:
				if (!entityString.toLowerCase().contains(filtro.getInicio().toLowerCase())) {
					temp.remove(index);
				}
				break;

			default:
				break;
			}
		}
	}

	private Object getAtributoPorFieldEntity(final T index, final Filter filter) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException {

		Object object = index;

		if (!filter.path().isEmpty()) {
			final Field join = object.getClass().getDeclaredField(filter.path());
			join.setAccessible(true);
			object = join.get(object);
		}

		Field returnValue = null;
		Class<?> clazz = object.getClass();
		while (clazz != null) {
			try {
				returnValue = clazz.getDeclaredField(Utils.getFieldByNameColumn(filter.name(), object.getClass()).getName());
				returnValue.setAccessible(true);
				clazz = null;
			} catch (NoSuchFieldException | SecurityException e) {
				clazz = clazz.getSuperclass();
			}
		}
		object = returnValue.get(object);
		if (object.getClass().getSimpleName().equals("GregorianCalendar")) {
			return returnCalendar(object);
		}
		return object;
	}

	private Calendar returnCalendar(final Object instances) {
		final Calendar cal = Calendar.getInstance();

		cal.set(Calendar.DAY_OF_MONTH, ((Calendar) instances).get(Calendar.DAY_OF_MONTH));
		cal.set(Calendar.MONTH, ((Calendar) instances).get(Calendar.MONTH));
		cal.set(Calendar.YEAR, ((Calendar) instances).get(Calendar.YEAR));
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.MILLISECOND, 0);
		cal.set(Calendar.SECOND, 0);
		return cal;
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
