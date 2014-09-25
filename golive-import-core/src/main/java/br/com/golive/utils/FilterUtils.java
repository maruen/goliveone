package br.com.golive.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import lombok.Data;

import org.slf4j.Logger;

import br.com.golive.constants.TipoFiltroData;

@Data
public abstract class FilterUtils<T> {

	private final Logger logger;

	protected abstract void setDataMB(final String field, final DateFilter data);

	protected abstract Date getDatePorFieldEntity(final T entity, final String field);

	protected abstract DateFilter getDataMB(final String field);

	protected abstract List<DateFilter> getFiltros(final String field);

	protected abstract void verificarTipoDeFiltro(final DateFilter date);

	public abstract void setTipoFiltroMB(final String field, final TipoFiltroData filter);

	protected FilterUtils(final Logger logger) {
		this.logger = logger;
	}

	public TipoFiltroData[] getFiltros() {
		return TipoFiltroData.values();
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
	public void filtrarPorData(final List<T> conteudo, final List<T> temp, final List<T> filtrados, final DateFilter date) {
		try {
			verificarTipoDeFiltro(date);
			logger.info("Filtrando lista por data, campo = {}", date.getFieldManagedBean());
			setDataMB(date.getFieldManagedBean(), date);
			final SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			temp.addAll(conteudo);
			if (getDataMB(date.getFieldManagedBean()) != null) {
				for (final T index : conteudo) {
					switch (date.getTipo()) {
					case IGUAL:
						if (getDataMB(date.getFieldManagedBean()).getInicio().getTime() != getDatePorFieldEntity(index, date.getFieldManagedBean()).getTime()) {
							temp.remove(index);
						}
						break;

					case MENOR:
						if (getDataMB(date.getFieldManagedBean()).getInicio().getTime() <= getDatePorFieldEntity(index, date.getFieldManagedBean()).getTime()) {
							temp.remove(index);
						}
						break;

					case MAIOR:
						if (getDataMB(date.getFieldManagedBean()).getInicio().getTime() >= getDatePorFieldEntity(index, date.getFieldManagedBean()).getTime()) {
							temp.remove(index);
						}
						break;

					case PERIODO:
						if ((getDataMB(date.getFieldManagedBean()).getInicio().getTime() >= getDatePorFieldEntity(index, date.getFieldManagedBean()).getTime()) && (getDataMB(date.getFieldManagedBean()).getFim().getTime() <= getDatePorFieldEntity(index, date.getFieldManagedBean()).getTime())) {
							temp.remove(index);
						}
						break;

					default:
						break;
					}
					// if
					// (!sdf.format(getDataMB(field)).equals(sdf.format(getDatePorFieldEntity(index,
					// field)))) {
					// temp.remove(index);
					// }
				}
			}
			atualizarListaDeFiltrados(conteudo, temp, filtrados);
			filtrarPorPelosCamposRestantes(date.getFieldManagedBean(), sdf, temp, filtrados);
			atualizarListaDeFiltrados(conteudo, temp, filtrados);
			temp.removeAll(conteudo);
		} catch (final Exception e) {
			logger.error("Houve um ao realizar o filtro com esta data");
			e.printStackTrace();
		}
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
	private void filtrarPorPelosCamposRestantes(final String field, final SimpleDateFormat sdf, final List<T> temp, final List<T> filtrados) {
		for (final DateFilter filtro : getFiltros(field)) {
			// if (filtro != null) {
			// for (final T index : filtrados) {
			// if
			// (!sdf.format(getDataMB(filtro)).equals(sdf.format(getDatePorFieldEntity(index,
			// filtro)))) {
			// temp.remove(index);
			// }
			// }
			// }
		}
	}
}
