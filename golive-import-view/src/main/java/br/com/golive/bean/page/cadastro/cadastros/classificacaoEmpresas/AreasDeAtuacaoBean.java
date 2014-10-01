package br.com.golive.bean.page.cadastro.cadastros.classificacaoEmpresas;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.imageio.ImageIO;
import javax.inject.Inject;

import lombok.Data;
import lombok.EqualsAndHashCode;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroBeanRules;
import br.com.golive.constants.TipoRelatorio;
import br.com.golive.entity.areaDeAtuacao.AreaDeAtuacaoEmbed;
import br.com.golive.entity.areaDeAtuacao.AuditoriaLog;
import br.com.golive.entity.areaDeAtuacao.Cadastro;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.FilterManager;
import br.com.golive.filter.NumberFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;
import br.com.golive.utils.JSFUtils;

@Data
@EqualsAndHashCode(callSuper = false)
@Label(name = "label.cadastroDeAreaDeAtuacao")
@ManagedBean
@ViewScoped
public class AreasDeAtuacaoBean extends CadastroBeanRules<AreaDeAtuacaoEmbed> {

	private static final long serialVersionUID = 6286581844381749904L;

	@Inject
	private Logger logger;

	@Inject
	@FilterInjected
	private FilterManager<AreaDeAtuacaoEmbed> filterManager;

	@Inject
	@LabelSystemInjected
	private GoliveOneProperties labels;

	@Inject
	@FilterInjected
	@Filter(name = "dataInclusao", label = "label.dataInclusao", campo = "cadastroAreaAtuacao.dataInclusao")
	private DateFilter filtroDataInclusao;

	@Inject
	@FilterInjected
	@Filter(name = "dataAlteracao", label = "label.dataAlteracao", campo = "cadastroAreaAtuacao.dataAlteracao")
	private DateFilter filtroDataAlteracao;

	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id", campo = "cadastroAreaAtuacao.id")
	private NumberFilter filtroId;

	@Inject
	@FilterInjected
	@Filter(name = "areaDeAtuacao", label = "label.areaDeAtuacao", campo = "cadastroAreaAtuacao.areaDeAtuacao")
	private StringFilter filtroAtuacao;

	private String tipoFiltro;

	@Override
	@PostConstruct
	public void init() {
		try {
			super.init(criarList());
		} catch (final ParseException e) {
			e.printStackTrace();
		}
		logger.info("Inicializando = {}", this.getClass().getName());
		setFiltroDataInclusao(new DateFilter());
	}

	@Override
	public void excluir() {
		if (isSelecionado()) {
			super.excluir();
		}
	}

	@Override
	public void editarRegistro() {
		if (isSelecionado()) {
			super.editarRegistro();
			logger.info("Edicao de registro = {} ", registro);
		}
	}

	@Override
	public Map<String, Object> obterParametrosRelatório() {
		logger.info("Obtendo parametros para carregar relatório");
		final Map<String, Object> parametros = new HashMap<String, Object>();
		parametros.put("usuarioLogado", "Guilherme Desenvolvimento");
		parametros.put("label.usuario", labels.getField("label.usuario"));
		try {
			logger.info("Carregando logo da empresa");
			parametros.put("logo", ImageIO.read(Thread.currentThread().getContextClassLoader().getResourceAsStream("01.png")));
		} catch (final IOException e) {
			logger.error("Erro ao carregar logo da empresa");
		}
		return parametros;
	}

	@Override
	public void exportarPdf() {
		gerarRelatorio(TipoRelatorio.PDF, labels);
	}

	@Override
	public void exportarXls() {
		gerarRelatorio(TipoRelatorio.EXCEL, labels);
	}

	@Override
	public void imprimir() {
		gerarRelatorio(TipoRelatorio.IMPRESSAO, labels);
	}

	@Override
	public void salvar() {
		super.salvar();
		logger.info("Salvando = {} ");
	}

	@Override
	public void cancelar() {
		super.cancelar();
		if (registro == null) {
			logger.info("Cancelando inclusao de registro");
		} else {
			logger.info("Cancelando edicao do registro = {} ", registro);
		}
	}

	@Override
	public boolean isSelecionado() {
		if (registro == null) {
			JSFUtils.warnMessage(labels.getField("title.msg.selecione.registro") + ",", labels.getField("msg.selecionar.registro"));
			logger.info("Não existe registro para processar");
			return false;
		}
		return true;
	}

	@Deprecated
	public List<AreaDeAtuacaoEmbed> criarList() throws ParseException {
		final List<AreaDeAtuacaoEmbed> lista = new ArrayList<AreaDeAtuacaoEmbed>();
		Long id = 0L;
		Calendar cal;
		Long value = 10L;
		final Date data;
		final SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		final String str = "String";
		for (int i = 1; i < 25; i++) {
			cal = Calendar.getInstance();

			cal.setTime(sdf.parse(id.toString() + "/01/2014"));
			lista.add(conteudoLinha(id, cal, value, str, sdf));

			id++;
			value = (value * id) / 2;
		}
		return lista;

	}

	@Deprecated
	public AreaDeAtuacaoEmbed conteudoLinha(final Long id, final Calendar cal, final Long valor, final String string, final SimpleDateFormat sdf) throws ParseException {
		final Calendar cal2 = Calendar.getInstance();
		cal2.setTime(sdf.parse(id.toString() + "/03/2014"));

		return new AreaDeAtuacaoEmbed(new Cadastro(id, cal, cal2, cal.getTime().getTime() + string), new AuditoriaLog(id, cal, string + "123", id + valor, string, new BigDecimal(valor), new BigDecimal(valor), string + "aa", string + "bb"));
	}

	@Override
	public Logger getLogger() {
		return logger;
	}

	public GoliveOneProperties getLabels() {
		return labels;
	}

	public void setLabels(final GoliveOneProperties labels) {
		this.labels = labels;
	}

	public String getTipoFiltro() {
		return tipoFiltro;
	}

	public void setTipoFiltro(final String tipoFiltro) {
		this.tipoFiltro = tipoFiltro;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public void setLogger(final Logger logger) {
		this.logger = logger;
	}

	public DateFilter getFiltroDataInclusao() {
		return filtroDataInclusao;
	}

	public void setFiltroDataInclusao(final DateFilter filtroDataInclusao) {
		this.filtroDataInclusao = filtroDataInclusao;
	}

	@Override
	public void inicializarFiltros() {
		// TODO Auto-generated method stub

	}

	public DateFilter getFiltroDataAlteracao() {
		return filtroDataAlteracao;
	}

	public void setFiltroDataAlteracao(final DateFilter filtroDataAlteracao) {
		this.filtroDataAlteracao = filtroDataAlteracao;
	}

	public FilterManager<AreaDeAtuacaoEmbed> getFilterManager() {
		return filterManager;
	}

	public void setFilterManager(FilterManager<AreaDeAtuacaoEmbed> filterManager) {
		this.filterManager = filterManager;
	}

}
