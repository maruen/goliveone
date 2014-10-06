package br.com.golive.filter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Ignore;

import br.com.golive.bean.FakeBean;
import br.com.golive.constants.TipoFiltro;
import br.com.golive.exception.GoLiveException;

public class FiltroTesteIntegrationTest {

	private static FakeBean bean;
	private static SimpleDateFormat sdf;
	private static Map<Object, Object> parametroRetorno;
	private static NumberFilter numberFilter;
	private static DateFilter dateFilter;
	private static StringFilter stringFilter;
	private String widget;

	@BeforeClass
	public static void init() {
		bean = new FakeBean(FiltroTesteIntegrationTest.class);
		sdf = new SimpleDateFormat("dd/MM/yyyy");
		parametroRetorno = new HashMap<Object, Object>();
		numberFilter = bean.getFiltroNumero();
		dateFilter = bean.getFiltroData();
		stringFilter = bean.getFiltroString();
	}

	// <Number>
	@Ignore
	public <T> void filtrarId() {
		limparFiltrosELista(numberFilter, stringFilter, dateFilter);

		widget = "id";
		parametroRetorno.put(10L, 5);
		parametroRetorno.put(30L, 4);
		parametroRetorno.put(60L, 2);
		filtrarSetInicio(parametroRetorno, numberFilter, widget, TipoFiltro.IGUAL);

		parametroRetorno.put(10L, 64);
		parametroRetorno.put(130L, 3);
		parametroRetorno.put(50L, 29);
		filtrarSetInicio(parametroRetorno, numberFilter, widget, TipoFiltro.MAIOR);

		parametroRetorno.put(10L, 5);
		parametroRetorno.put(130L, 70);
		parametroRetorno.put(50L, 42);
		filtrarSetInicio(parametroRetorno, numberFilter, widget, TipoFiltro.MENOR);

		parametroRetorno.put(10L, 8);
		parametroRetorno.put(5L, 42);
		parametroRetorno.put(0L, 36);
		filtrarSetInicio(parametroRetorno, numberFilter, widget, TipoFiltro.CONTEM);

		numberFilter.setFim(70L);

		parametroRetorno.put(10L, 49);
		parametroRetorno.put(100L, 0);
		parametroRetorno.put(50L, 12);
		filtrarSetInicio(parametroRetorno, numberFilter, widget, TipoFiltro.INTERVALO);

	}

	// </Number>

	// <Date>

	@Ignore
	public <T> void filtrarData() {
		limparFiltrosELista(numberFilter, stringFilter, dateFilter);

		widget = "data";

		parametroRetorno.put(dataPorString("02/09/2014"), 3);
		parametroRetorno.put(dataPorString("05/09/2014"), 2);
		parametroRetorno.put(dataPorString("10/10/2014"), 1);
		parametroRetorno.put(dataPorString("01/09/2014"), 3);
		parametroRetorno.put(dataPorString("15/11/2014"), 1);
		filtrarSetInicio(parametroRetorno, dateFilter, widget, TipoFiltro.IGUAL);

		parametroRetorno.put(dataPorString("02/09/2014"), 68);
		parametroRetorno.put(dataPorString("05/09/2014"), 60);
		parametroRetorno.put(dataPorString("10/10/2014"), 38);
		parametroRetorno.put(dataPorString("01/09/2014"), 71);
		parametroRetorno.put(dataPorString("15/11/2014"), 14);
		filtrarSetInicio(parametroRetorno, dateFilter, widget, TipoFiltro.MAIOR);

		parametroRetorno.put(dataPorString("02/09/2014"), 3);
		parametroRetorno.put(dataPorString("05/09/2014"), 12);
		parametroRetorno.put(dataPorString("10/10/2014"), 35);
		parametroRetorno.put(dataPorString("01/09/2014"), 0);
		parametroRetorno.put(dataPorString("15/11/2014"), 59);
		filtrarSetInicio(parametroRetorno, dateFilter, widget, TipoFiltro.MENOR);

		dateFilter.setFim(dataPorString("15/10/2014"));
		parametroRetorno.put(dataPorString("02/09/2014"), 38);
		parametroRetorno.put(dataPorString("05/09/2014"), 29);
		parametroRetorno.put(dataPorString("10/10/2014"), 6);
		parametroRetorno.put(dataPorString("01/09/2014"), 41);
		parametroRetorno.put(dataPorString("15/11/2014"), 0);
		filtrarSetInicio(parametroRetorno, dateFilter, widget, TipoFiltro.PERIODO);
	}

	// </Date>

	// <Number>

	@Ignore
	public <T> void filtrarNome() {
		limparFiltrosELista(numberFilter, stringFilter, dateFilter);

		widget = "nome";
		limparFiltrosELista();

		parametroRetorno.put("1", 34);
		parametroRetorno.put("10", 8);
		parametroRetorno.put("5", 16);
		parametroRetorno.put("2", 16);
		parametroRetorno.put("05", 1);
		parametroRetorno.put("16", 3);
		parametroRetorno.put("35", 3);
		parametroRetorno.put("150", 1);
		filtrarSetInicio(parametroRetorno, stringFilter, widget, TipoFiltro.CONTEM);

	}

	// </Number>

	// <Compostos>
	@Ignore
	public <T> void filtrarPorIdComData() {
		limparFiltrosELista(numberFilter, stringFilter, dateFilter);

		widget = "id";
		parametroRetorno.put(10L, 5);
		filtrarSetInicio(parametroRetorno, numberFilter, widget, TipoFiltro.IGUAL);

		widget = "data";
		parametroRetorno.put(dataPorString("02/10/2014"), 1);
		filtrarSetInicio(parametroRetorno, dateFilter, widget, TipoFiltro.IGUAL);

		parametroRetorno.put(dataPorString("02/09/2014"), 3);
		filtrarSetInicio(parametroRetorno, dateFilter, widget, TipoFiltro.IGUAL);

		widget = "id";
		parametroRetorno.put(5L, 0);
		filtrarSetInicio(parametroRetorno, numberFilter, widget, TipoFiltro.CONTEM);
		limparFiltro(dateFilter, "data", 42);

		widget = "data";
		parametroRetorno.put(dataPorString("15/09/2014"), 28);
		filtrarSetInicio(parametroRetorno, dateFilter, widget, TipoFiltro.MAIOR);

		widget = "id";
		parametroRetorno.put(5L, 38);
		numberFilter.setFim(90L);
		filtrarSetInicio(parametroRetorno, numberFilter, widget, TipoFiltro.INTERVALO);
		limparFiltro(dateFilter, "data", 62);

		parametroRetorno.put(70L, 52);
		filtrarSetInicio(parametroRetorno, numberFilter, widget, TipoFiltro.MENOR);
	}

	@Ignore
	public <T> void filtrar() {
		limparFiltrosELista(numberFilter, stringFilter, dateFilter);

		parametroRetorno.put(10L, 5);
		filtrarSetInicio(parametroRetorno, numberFilter, "id", TipoFiltro.IGUAL);

		parametroRetorno.put(dataPorString("15/09/2014"), 2);
		filtrarSetInicio(parametroRetorno, dateFilter, "data", TipoFiltro.MAIOR);

		parametroRetorno.put("2", 0);
		filtrarSetInicio(parametroRetorno, stringFilter, "nome", TipoFiltro.CONTEM);
		limparFiltro(numberFilter, "id", 11);

		parametroRetorno.put(10L, 11);
		filtrarSetInicio(parametroRetorno, numberFilter, "id", TipoFiltro.MAIOR);

		parametroRetorno.put("10", 6);
		filtrarSetInicio(parametroRetorno, stringFilter, "nome", TipoFiltro.CONTEM);
		limparFiltro(stringFilter, "nome", 46);

		parametroRetorno.put(10L, 32);
		numberFilter.setFim(80L);
		filtrarSetInicio(parametroRetorno, numberFilter, "id", TipoFiltro.INTERVALO);

	}

	// </Compostos>

	private void limparFiltrosELista(final GoliveFilter... filters) {

		for (final GoliveFilter filter : filters) {
			filter.setInicio(null);
			filter.setFim(null);
			filter.setTipo(TipoFiltro.IGUAL);
		}

	}

	private <T> void limparFiltro(final GoliveFilter<T> filter, final String campo, final int esperado) {
		limparFiltrosELista(filter);
		filtrarSetInicio(new HashMap<Object, Object>(), filter, campo, filter.getTipo());
		Assert.assertEquals(bean.getFiltrada().size(), esperado);

	}

	public <T> void filtrarSetInicio(final Map<Object, Object> parametroRetorno, final GoliveFilter<T> filter, final String campo, final TipoFiltro tipo) {
		filter.setTipo(tipo);
		if (parametroRetorno.keySet().isEmpty()) {
			bean.getFilter().filtrar(bean.getLista(), bean.getFiltrada(), filter, campo);
		}
		for (final Object key : parametroRetorno.keySet()) {
			filter.setInicio((T) key);
			bean.getFilter().filtrar(bean.getLista(), bean.getFiltrada(), filter, campo);
			Assert.assertEquals(bean.getFiltrada().size(), parametroRetorno.get(key));
		}

		parametroRetorno.clear();

	}

	public void filtrarDateDataSetInicio(final String date) {
		try {
			bean.getFiltroData().setInicio(dataPorString(date));
			bean.getFilter().filtrar(bean.getLista(), bean.getFiltrada(), bean.getFiltroData(), "data");
		} catch (final GoLiveException e) {
			bean.getLogger().error("Erro ao converter data");
		}
	}

	private Date dataPorString(final String date) throws GoLiveException {
		try {
			return sdf.parse(date);
		} catch (final ParseException e) {
			bean.getLogger().error("Erro ao converter data");
		}
		throw new GoLiveException("Erro ao converter string pra data");
	}

}
