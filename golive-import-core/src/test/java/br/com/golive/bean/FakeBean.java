package br.com.golive.bean;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import br.com.golive.annotation.Fake;
import br.com.golive.annotation.Filter;
import br.com.golive.entity.EntidadeFakeSimples;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.FilterManager;
import br.com.golive.filter.NumberFilter;
import br.com.golive.filter.StringFilter;

@Fake
public class FakeBean {

	private final Logger logger;

	private List<EntidadeFakeSimples> lista;
	private List<EntidadeFakeSimples> filtrada;

	@Filter(name = "data", label = "", campo = "data")
	private DateFilter filtroData = new DateFilter();

	@Filter(name = "id", label = "", campo = "id")
	private NumberFilter filtroNumero = new NumberFilter();

	@Filter(name = "nome", label = "", campo = "nome")
	private StringFilter filtroString = new StringFilter();

	private FilterManager<EntidadeFakeSimples> filter;

	public FakeBean(final Class<?> clazz) {
		super();
		logger = LoggerFactory.getLogger(clazz);
		logger.debug("----------------------------------------------------------");
		logger.debug("--------------Inicializando Testes de Filtro--------------");
		logger.debug("----------------------------------------------------------");
		lista = EntidadeFakeSimples.initList();
		filtrada = new ArrayList<EntidadeFakeSimples>();
		filter = new FilterManager<EntidadeFakeSimples>(logger);

		filter.putGetter("id", "nome", "data");
		filter.setInstance(this);
		// System.out.println("---------------------------Lista--------------------------");
		//
		// for (final EntidadeFakeSimples i : lista) {
		// System.out.println(i.toString());
		// }
	}

	public Logger getLogger() {
		return logger;
	}

	public List<EntidadeFakeSimples> getLista() {
		return lista;
	}

	public List<EntidadeFakeSimples> getFiltrada() {
		return filtrada;
	}

	public DateFilter getFiltroData() {
		return filtroData;
	}

	public NumberFilter getFiltroNumero() {
		return filtroNumero;
	}

	public StringFilter getFiltroString() {
		return filtroString;
	}

	public FilterManager<EntidadeFakeSimples> getFilter() {
		return filter;
	}

	public void setLista(final List<EntidadeFakeSimples> lista) {
		this.lista = lista;
	}

	public void setFiltrada(final List<EntidadeFakeSimples> filtrada) {
		this.filtrada = filtrada;
	}

	public void setFiltroData(final DateFilter filtroData) {
		this.filtroData = filtroData;
	}

	public void setFiltroNumero(final NumberFilter filtroNumero) {
		this.filtroNumero = filtroNumero;
	}

	public void setFiltroString(final StringFilter filtroString) {
		this.filtroString = filtroString;
	}

	public void setFilter(final FilterManager<EntidadeFakeSimples> filter) {
		this.filter = filter;
	}

}
