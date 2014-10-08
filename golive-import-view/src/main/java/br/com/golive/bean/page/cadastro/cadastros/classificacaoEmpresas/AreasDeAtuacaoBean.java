package br.com.golive.bean.page.cadastro.cadastros.classificacaoEmpresas;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.imageio.ImageIO;
import javax.inject.Inject;

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
import br.com.golive.utils.Fluxo;
import br.com.golive.utils.JSFUtils;

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
	public void incluir() {
		super.incluir();

		final Cadastro cadastro = new Cadastro();
		cadastro.setId(conteudo.get(conteudo.size() - 1).getCadastroAreaAtuacao().getId() + 1);
		cadastro.setDataInclusao(Calendar.getInstance());

		registro = new AreaDeAtuacaoEmbed(cadastro, new AuditoriaLog());
		registro.setListaAuditoriaLogs(new ArrayList<AuditoriaLog>());

	}

	@Override
	public void confirmarExclusao() {
		if ((fluxo.equals(Fluxo.EXCLUSAO)) && (registro != null)) {
			conteudo.remove(registro);
			filtrados.remove(registro);
			registro = null;
			JSFUtils.infoMessage("Processo Ok", "Registro foi excluido");
			super.confirmarExclusao();
		}
	}

	@Override
	public void editarRegistro() {
		if (isSelecionado()) {
			super.editarRegistro();
			logger.info("Edicao de registro = {} ", registro.getCadastroAreaAtuacao().getId());

		}
	}

	@Override
	public Map<String, Object> obterParametrosRelatório() {
		logger.info("Obtendo parametros para carregar relatório");
		final Map<String, Object> parametros = new HashMap<String, Object>();
		parametros.put("usuarioLogado", "Guilherme Desenvolvimento");
		parametros.put("label.usuario", getLabels().getField("label.usuario"));
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
		gerarRelatorio(TipoRelatorio.PDF, getLabels());
	}

	@Override
	public void exportarXls() {
		gerarRelatorio(TipoRelatorio.EXCEL, getLabels());
	}

	@Override
	public void imprimir() {
		super.imprimir();
		// gerarRelatorio(TipoRelatorio.IMPRESSAO, labels);
	}

	@Override
	public void salvar() {
		boolean insert = false;

		if (fluxo.equals(Fluxo.INCLUSAO)) {
			if ((registro.getCadastroAreaAtuacao().getAreaDeAtuacao() == null) || (registro.getCadastroAreaAtuacao().getAreaDeAtuacao().isEmpty())) {
				JSFUtils.warnMessage(getLabels().getField("title.msg.erro.ao.inserir"), getLabels().getField("msg.preencher.registro"));
			} else {
				logger.info("Salvando = {} ", registro.getCadastroAreaAtuacao().getId());

				registro.getCadastroAreaAtuacao().setDataAlteracao(Calendar.getInstance());
				registro.getListaAuditoriaLogs().add(new AuditoriaLog(1L, Calendar.getInstance(), "Area de Atuação", 1L, "Inserção teste", "VAZIO", "VAZIO", "golive@apresentacao", "Inserção"));

				final AreaDeAtuacaoEmbed novo = new AreaDeAtuacaoEmbed();

				final Cadastro cadastro = registro.getCadastroAreaAtuacao();
				novo.setCadastroAreaAtuacao(cadastro);
				novo.setListaAuditoriaLogs(registro.getListaAuditoriaLogs());

				conteudo.add(novo);
				filtrados.add(novo);
				insert = true;
				JSFUtils.infoMessage(getLabels().getField("title.msg.inserido.sucesso"), getLabels().getField("msg.inserido.sucesso"));
			}
		} else {
			logger.info("editando = {} ", registro.getCadastroAreaAtuacao().getId());

			registro.getCadastroAreaAtuacao().setDataAlteracao(Calendar.getInstance());
			registro.getListaAuditoriaLogs().add(new AuditoriaLog(1L, Calendar.getInstance(), "Area de Atuação", 1L, "Edição", "VAZIO", "VAZIO", "golive@apresentacao", "Edição"));

			insert = true;
			JSFUtils.infoMessage("Processo Ok", "Edição Concluída");

		}

		if (insert) {
			super.salvar();
		}

	}

	@Override
	public void cancelar() {
		super.cancelar();
		fluxo = getFluxoListagem();
		if (registro == null) {
			logger.info("Cancelando inclusao de registro");
		} else {
			logger.info("Cancelando edicao do registro = {} ", registro);
		}
	}

	@Override
	public boolean isSelecionado() {
		if (registro == null) {
			JSFUtils.warnMessage(getLabels().getField("title.msg.selecione.registro") + ",", getLabels().getField("msg.selecionar.registro"));
			logger.info("Não existe registro para processar");
			return super.isSelecionado();
		}
		return true;
	}

	@Deprecated
	public List<AreaDeAtuacaoEmbed> criarList() throws ParseException {
		final List<AreaDeAtuacaoEmbed> lista = new ArrayList<AreaDeAtuacaoEmbed>();
		AreaDeAtuacaoEmbed add = new AreaDeAtuacaoEmbed(new Cadastro(1L, getDate("25/08/2014 20:24"), getDate("25/08/2014 20:47"), "Importação"), new AuditoriaLog());
		add.setListaAuditoriaLogs(getLista());
		lista.add(add);

		add = new AreaDeAtuacaoEmbed(new Cadastro(2L, getDate("25/08/2014 20:24"), getDate("25/08/2014 20:47"), "Exportação"), new AuditoriaLog());
		add.setListaAuditoriaLogs(getLista());
		lista.add(add);
		add = new AreaDeAtuacaoEmbed(new Cadastro(3L, getDate("25/08/2014 20:24"), getDate("25/08/2014 20:47"), "Industrialização"), new AuditoriaLog());
		add.setListaAuditoriaLogs(getLista());
		lista.add(add);
		add = new AreaDeAtuacaoEmbed(new Cadastro(4L, getDate("25/08/2014 20:24"), getDate("25/08/2014 20:47"), "Distribuição"), new AuditoriaLog());
		add.setListaAuditoriaLogs(getLista());
		lista.add(add);
		add = new AreaDeAtuacaoEmbed(new Cadastro(5L, getDate("25/08/2014 20:24"), getDate("25/08/2014 20:47"), "Comercialização Atacada"), new AuditoriaLog());
		add.setListaAuditoriaLogs(getLista());
		lista.add(add);
		add = new AreaDeAtuacaoEmbed(new Cadastro(6L, getDate("25/08/2014 20:24"), getDate("25/08/2014 20:47"), "Comercialização Varejo"), new AuditoriaLog());
		add.setListaAuditoriaLogs(getLista());
		lista.add(add);
		add = new AreaDeAtuacaoEmbed(new Cadastro(7L, getDate("25/08/2014 20:24"), getDate("25/08/2014 20:47"), "Revenda"), new AuditoriaLog());
		add.setListaAuditoriaLogs(getLista());
		lista.add(add);
		add = new AreaDeAtuacaoEmbed(new Cadastro(8L, getDate("25/08/2014 20:24"), getDate("25/08/2014 20:47"), "Transporte"), new AuditoriaLog());
		add.setListaAuditoriaLogs(getLista());
		lista.add(add);
		add = new AreaDeAtuacaoEmbed(new Cadastro(9L, getDate("25/08/2014 20:24"), getDate("25/08/2014 20:47"), "Logistica"), new AuditoriaLog());
		add.setListaAuditoriaLogs(getLista());
		lista.add(add);
		add = new AreaDeAtuacaoEmbed(new Cadastro(10L, getDate("25/08/2014 20:24"), getDate("25/08/2014 20:47"), "Armazenagem"), new AuditoriaLog());
		add.setListaAuditoriaLogs(getLista());
		lista.add(add);

		return lista;

	}

	private Calendar getDate(final String date) {
		try {
			final Calendar cal = Calendar.getInstance();
			final SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
			cal.setTime(sdf.parse(date));
			return cal;
		} catch (final ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	private List<AuditoriaLog> getLista() {
		final List<AuditoriaLog> lista = new ArrayList<AuditoriaLog>();
		lista.add(new AuditoriaLog(000001L, getDate2("25/08/2014 20:26:30"), "Area de atuação", 000001L, "Alteração do Valor", "HL25-LMI-0026", "HL25-LAM-EO-18", "roberto@acaopersianas.com.br", "campo Cód Produto"));
		lista.add(new AuditoriaLog(000002L, getDate2("25/08/2014 20:26:30"), "Area de atuação", 000002L, "Alteração do Valor", "HL25-LMI-0026", "HL25-LAM-EO-18", "roberto@acaopersianas.com.br", "campo Cód Produto"));
		lista.add(new AuditoriaLog(000003L, getDate2("25/08/2014 20:26:30"), "Area de atuação", 000003L, "Alteração do Valor", "HL25-LMI-0026", "HL25-LAM-EO-18", "roberto@acaopersianas.com.br", "campo Cód Produto"));
		lista.add(new AuditoriaLog(000004L, getDate2("25/08/2014 20:26:30"), "Area de atuação", 000004L, "Alteração do Valor", "HL25-LMI-0026", "HL25-LAM-EO-18", "roberto@acaopersianas.com.br", "campo Cód Produto"));
		lista.add(new AuditoriaLog(000005L, getDate2("25/08/2014 20:26:30"), "Area de atuação", 000005L, "Alteração do Valor", "HL25-LMI-0026", "HL25-LAM-EO-18", "roberto@acaopersianas.com.br", "campo Cód Produto"));
		lista.add(new AuditoriaLog(000006L, getDate2("25/08/2014 20:26:30"), "Area de atuação", 000006L, "Alteração do Valor", "HL25-LMI-0026", "HL25-LAM-EO-18", "roberto@acaopersianas.com.br", "campo Cód Produto"));
		lista.add(new AuditoriaLog(000007L, getDate2("25/08/2014 20:26:30"), "Area de atuação", 000007L, "Alteração do Valor", "HL25-LMI-0026", "HL25-LAM-EO-18", "roberto@acaopersianas.com.br", "campo Cód Produto"));

		return lista;
	}

	private Calendar getDate2(final String date) {
		try {
			final Calendar cal = Calendar.getInstance();
			final SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			cal.setTime(sdf.parse(date));
			return cal;
		} catch (final ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Logger getLogger() {
		return logger;
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

	public DateFilter getFiltroDataAlteracao() {
		return filtroDataAlteracao;
	}

	public void setFiltroDataAlteracao(final DateFilter filtroDataAlteracao) {
		this.filtroDataAlteracao = filtroDataAlteracao;
	}

	@Override
	public FilterManager<AreaDeAtuacaoEmbed> getFilterManager() {
		return filterManager;
	}

	public void setFilterManager(final FilterManager<AreaDeAtuacaoEmbed> filterManager) {
		this.filterManager = filterManager;
	}

	public NumberFilter getFiltroId() {
		return filtroId;
	}

	public void setFiltroId(final NumberFilter filtroId) {
		this.filtroId = filtroId;
	}

	public StringFilter getFiltroAtuacao() {
		return filtroAtuacao;
	}

	public void setFiltroAtuacao(final StringFilter filtroAtuacao) {
		this.filtroAtuacao = filtroAtuacao;
	}

}
