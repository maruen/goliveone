package br.com.golive.filter;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import br.com.golive.annotation.Filter;
import br.com.golive.constants.TipoFiltro;
import br.com.golive.entity.EntidadeFakeSimples;

public class FiltroTesteIntegrationTest {

	private static List<EntidadeFakeSimples> lista;
	private static List<EntidadeFakeSimples> filtrada;

	@Filter(name = "data", label = "", campo = "data")
	private static DateFilter filtroData = new DateFilter();

	@Filter(name = "id", label = "", campo = "id")
	private static NumberFilter filtroNumero = new NumberFilter();

	@Filter(name = "nome", label = "", campo = "nome")
	private static StringFilter filtroString = new StringFilter();

	private static FilterManager<EntidadeFakeSimples> filter;

	private static Logger logger = LoggerFactory.getLogger(FiltroTesteIntegrationTest.class);

	@BeforeClass
	public static void init() {

		logger.debug("----------------------------------------------------------");
		logger.debug("--------------Inicializando Testes de Filtro--------------");
		logger.debug("----------------------------------------------------------");
		lista = EntidadeFakeSimples.initList();
		filtrada = new ArrayList<EntidadeFakeSimples>();
		filter = new FilterManager<EntidadeFakeSimples>(logger);
		filter.setInstance(new EntidadeFakeSimples());
		filter.putGetter("id", "nome", "data");

		logger.debug("---------------------------Lista--------------------------");

		for (final EntidadeFakeSimples i : lista) {
			logger.debug(i.toString());
		}
	}

	@Test
	public void filtrarIdPorIgual() {
		logger.debug("Filtrando Id igual a 10");
		filtroNumero.setTipo(TipoFiltro.IGUAL);
		filtrarPorId(10L);
		Assert.assertEquals(filtrada.size(), 1);
		esvazia();
	}

	@Test
	public void filtrarIdPorMaior() {
		logger.debug("Filtrando Id maior 10");
		filtroNumero.setTipo(TipoFiltro.MAIOR);
		filtrarPorId(10L);
		Assert.assertEquals(filtrada.size(), 27);
		esvazia();
	}

	@Test
	public void filtrarIdPorMenor() {
		logger.debug("Filtrando Id menor 100");
		filtroNumero.setTipo(TipoFiltro.MENOR);
		filtrarPorId(100L);
		Assert.assertEquals(filtrada.size(), 19);
		esvazia();
	}

	@Test
	public void filtrarIdPorContem() {
		logger.debug("Filtrando Id contem 5");
		filtroNumero.setTipo(TipoFiltro.CONTEM);
		filtrarPorId(5L);
		Assert.assertEquals(filtrada.size(), 16);
		esvazia();
	}

	@Test
	public void filtrarIdPorIntervalo() {
		logger.debug("Filtrando Id intervalor 30 a 97");
		filtroNumero.setTipo(TipoFiltro.INTERVALO);
		filtroNumero.setFim(97L);
		filtrarPorId(30L);
		Assert.assertEquals(filtrada.size(), 14);
		esvazia();
	}

	private void esvazia() {
		filtrada.removeAll(lista);
	}

	public void filtrarPorId(final Long id) {
		filtroNumero.setInicio(id);
		filter.filtrar(lista, filtrada, filtroNumero, "id");
	}

}
