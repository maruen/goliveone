package br.com.golive.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;

public abstract class FilterUtils<T> {

	@Inject
	private final Logger logger;

	protected abstract void setDataMB(final String field, final Date data);

	protected abstract Date getDatePorFieldEntity(final T entity, final String field);

	protected abstract Date getDataMB(final String field);

	protected abstract List<String> getFiltros(final String field);

	protected FilterUtils(final Logger logger) {
		this.logger = logger;
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
	public void filtrarPorData(final List<T> conteudo, final List<T> temp, final List<T> filtrados, final String field, final Date date) {
		try {
			logger.info("Filtrando lista por data, campo = {}", field);
			setDataMB(field, date);
			final SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			temp.addAll(conteudo);
			if (getDataMB(field) != null) {
				for (final T index : conteudo) {
					if (!sdf.format(getDataMB(field)).equals(sdf.format(getDatePorFieldEntity(index, field)))) {
						temp.remove(index);
					}
				}
			}
			atualizarListaDeFiltrados(conteudo, temp, filtrados);
			filtrarPorPelosCamposRestantes(field, sdf, temp, filtrados);
			atualizarListaDeFiltrados(conteudo, temp, filtrados);
			temp.removeAll(conteudo);
		} catch (final Exception e) {
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
		for (final String filtro : getFiltros(field)) {
			if (filtro != null) {
				for (final T index : filtrados) {
					if (!sdf.format(getDataMB(filtro)).equals(sdf.format(getDatePorFieldEntity(index, filtro)))) {
						temp.remove(index);
					}
				}
			}
		}
	}

}
