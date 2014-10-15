package br.com.golive.bean.page.cadastro.cadastros.classificacaoEmpresas;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroBeanRules2;
import br.com.golive.entity.areaDeAtuacao.AreaDeAtuacaoModel;
import br.com.golive.entity.areaDeAtuacao.AuditoriaLog;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.NumberFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;
import br.com.golive.utils.Fluxo;

@Label(name = "label.cadastroDeAreaDeAtuacao")
@ManagedBean
@ViewScoped
public class AreasDeAtuacaoBean extends CadastroBeanRules2<AreaDeAtuacaoModel> {

	private static final long serialVersionUID = 6286581844381749904L;

	@Inject
	private Logger logger;

	@Inject
	@FilterInjected
	@Filter(name = "dataInclusao", label = "label.dataInclusao")
	private DateFilter filtroDataInclusao;

	@Inject
	@FilterInjected
	@Filter(name = "dataAlteracao", label = "label.dataAlteracao")
	private DateFilter filtroDataAlteracao;

	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id")
	private NumberFilter filtroId;

	@Inject
	@FilterInjected
	@Filter(name = "areaDeAtuacao", label = "label.areaDeAtuacao")
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
		// final Cadastro cadastro = new Cadastro();
		// cadastro.setId(conteudo.get(conteudo.size() -
		// 1).getCadastroAreaAtuacao().getId() + 1);
		// cadastro.setDataInclusao(Calendar.getInstance());
		// registro = new AreaDeAtuacaoModel(cadastro, new AuditoriaLog());
		// registro.setListaAuditoriaLogs(new ArrayList<AuditoriaLog>());
	}


	@Override
	public void salvar() {
		final boolean insert = false;

		if (fluxo.equals(Fluxo.INCLUSAO)) {
			// if ((registro.getCadastroAreaAtuacao().getAreaDeAtuacao() ==
			// null) ||
			// (registro.getCadastroAreaAtuacao().getAreaDeAtuacao().isEmpty()))
			// {
			// JSFUtils.warnMessage(getLabels().getField("title.msg.erro.ao.inserir"),
			// getLabels().getField("msg.preencher.registro"));
			// } else {
			// logger.info("Salvando = {} ",
			// registro.getCadastroAreaAtuacao().getId());
			//
			// registro.getCadastroAreaAtuacao().setDataAlteracao(Calendar.getInstance());
			// registro.getListaAuditoriaLogs().add(new AuditoriaLog(1L,
			// Calendar.getInstance(), "Area de Atuação", 1L, "Inserção teste",
			// "VAZIO", "VAZIO", "golive@apresentacao", "Inserção"));
			//
			// final AreaDeAtuacaoModel novo = new AreaDeAtuacaoModel();
			//
			// final Cadastro cadastro = registro.getCadastroAreaAtuacao();
			// novo.setCadastroAreaAtuacao(cadastro);
			// novo.setListaAuditoriaLogs(registro.getListaAuditoriaLogs());
			//
			// conteudo.add(novo);
			// filtrados.add(novo);
			// insert = true;
			// JSFUtils.infoMessage(getLabels().getField("title.msg.inserido.sucesso"),
			// getLabels().getField("msg.inserido.sucesso"));
			// }
			// } else {
			// logger.info("editando = {} ",
			// registro.getCadastroAreaAtuacao().getId());
			//
			// registro.getCadastroAreaAtuacao().setDataAlteracao(Calendar.getInstance());
			// registro.getListaAuditoriaLogs().add(new AuditoriaLog(1L,
			// Calendar.getInstance(), "Area de Atuação", 1L, "Edição", "VAZIO",
			// "VAZIO", "golive@apresentacao", "Edição"));
			//
			// insert = true;
			// JSFUtils.infoMessage(getLabels().getField("title.msg.inserido.sucesso"),
			// getLabels().getField("msg.edicao.concluida"));

		}

		if (insert) {
			super.salvar();
		}

	}

	@Deprecated
	public List<AreaDeAtuacaoModel> criarList() throws ParseException {
		final List<AreaDeAtuacaoModel> lista = new ArrayList<AreaDeAtuacaoModel>();
		lista.add(new AreaDeAtuacaoModel(1L, getDate("25/08/2014 20:24"), getDate("25/08/2014 20:47"), "Importação", getLista()));
		lista.add(new AreaDeAtuacaoModel(2L, getDate("05/08/2014 20:24"), getDate("15/08/2014 20:47"), "Exportação", getLista()));
		lista.add(new AreaDeAtuacaoModel(3L, getDate("07/08/2014 20:24"), getDate("16/08/2014 20:47"), "Industrialização", getLista()));
		lista.add(new AreaDeAtuacaoModel(4L, getDate("08/08/2014 20:24"), getDate("17/08/2014 20:47"), "Distribuição", getLista()));
		lista.add(new AreaDeAtuacaoModel(5L, getDate("09/08/2014 20:24"), getDate("18/08/2014 20:47"), "Comercialização Atacada", getLista()));
		lista.add(new AreaDeAtuacaoModel(6L, getDate("10/08/2014 20:24"), getDate("19/08/2014 20:47"), "Comercialização Varejo", getLista()));
		lista.add(new AreaDeAtuacaoModel(7L, getDate("11/08/2014 20:24"), getDate("20/08/2014 20:47"), "Revenda", getLista()));
		lista.add(new AreaDeAtuacaoModel(8L, getDate("12/08/2014 20:24"), getDate("21/08/2014 20:47"), "Transporte", getLista()));
		lista.add(new AreaDeAtuacaoModel(9L, getDate("13/08/2014 20:24"), getDate("22/08/2014 20:47"), "Logistica", getLista()));
		lista.add(new AreaDeAtuacaoModel(10L, getDate("14/08/2014 20:24"), getDate("23/08/2014 20:47"), "Armazenagem", getLista()));
		return lista;

	}

	@Deprecated
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

	@Deprecated
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

	@Deprecated
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
