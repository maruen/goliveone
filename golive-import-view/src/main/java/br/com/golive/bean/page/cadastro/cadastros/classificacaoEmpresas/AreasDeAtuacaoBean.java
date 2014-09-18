package br.com.golive.bean.page.cadastro.cadastros.classificacaoEmpresas;

import java.io.IOException;
import java.math.BigDecimal;
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

import lombok.Data;
import lombok.EqualsAndHashCode;
import net.sf.jasperreports.engine.JRException;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroBeanRules;
import br.com.golive.entity.areaDeAtuacao.AreaDeAtuacaoEmbed;
import br.com.golive.entity.areaDeAtuacao.AuditoriaLog;
import br.com.golive.entity.areaDeAtuacao.Cadastro;
import br.com.golive.exception.GoLiveException;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.relatorio.GeradorRelatorio;
import br.com.golive.utils.Fluxo;
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
	@LabelSystemInjected
	private GoliveOneProperties labels;

	private Calendar data = Calendar.getInstance();

	@Override
	@PostConstruct
	public void init() {
		super.init(criarList());
		logger.info("Inicializando = {}", this.getClass().getName());
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
	public void exportarPdf() {

		final Map<String, Object> parametros = new HashMap<String, Object>();
		parametros.put("usuarioLogado", "Guilherme Desenvolvimento");
		try {
			parametros.put("logo", ImageIO.read(Thread.currentThread().getContextClassLoader().getResourceAsStream("01.png")));
		} catch (final IOException e) {
			e.printStackTrace();
		}
		try {
			relatorios.gerarPdf(Cadastro.class, conteudo, parametros, labels);
		} catch (GoLiveException | JRException | IOException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void imprimir() {
		logger.info("Imprimindo = {} ");

	}

	@Override
	public void exportarXls() {
		logger.info("Exportando xls = {} ");
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

	private boolean isSelecionado() {
		if (registro == null) {
			JSFUtils.warnMessage(labels.getField("title.msg.selecione.registro") + ",", labels.getField("msg.selecionar.registro"));
			logger.info("Não existe registro para processar");
			return false;
		}
		return true;
	}

	public void criarLogsList() {
	}

	public List<AreaDeAtuacaoEmbed> criarList() {
		final List<AreaDeAtuacaoEmbed> lista = new ArrayList<AreaDeAtuacaoEmbed>();
		final Calendar data = Calendar.getInstance();
		Long id = 0L;
		Long value = 10L;
		final String str = "String";
		for (int i = 0; i < 100; i++) {
			lista.add(conteudoLinha(id, data, value, str));
			id++;
			value = (value * id) / 2;
		}
		return lista;

	}

	public AreaDeAtuacaoEmbed conteudoLinha(final Long id, final Calendar cal, final Long valor, final String string) {
		return new AreaDeAtuacaoEmbed(new Cadastro(id, cal, cal, "asw" + string), new AuditoriaLog(id, cal, string + "123", id + valor, string, new BigDecimal(valor), new BigDecimal(valor), string + "aa", string + "bb"));
	}

	public Calendar getDataInclusaoFiltro() {
		return data;
	}

	public void setDataInclusaoFiltro(final Calendar dataInclusaoFiltro) {
		data = dataInclusaoFiltro;
	}

	@Override
	public Fluxo getFluxoListagem() {
		return Fluxo.LISTAGEM;
	}

	@Override
	public Fluxo getFluxoInclusao() {
		return Fluxo.INCLUSAO;
	}

	@Override
	public Fluxo getFluxoEdicao() {
		return Fluxo.EDICAO;
	}

}
