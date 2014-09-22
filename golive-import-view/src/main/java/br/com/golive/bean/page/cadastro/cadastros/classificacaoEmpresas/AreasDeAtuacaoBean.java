package br.com.golive.bean.page.cadastro.cadastros.classificacaoEmpresas;

import java.io.IOException;
import java.math.BigDecimal;
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

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroBeanRules;
import br.com.golive.constants.TipoRelatorio;
import br.com.golive.entity.areaDeAtuacao.AreaDeAtuacaoEmbed;
import br.com.golive.entity.areaDeAtuacao.AuditoriaLog;
import br.com.golive.entity.areaDeAtuacao.Cadastro;
import br.com.golive.exception.GoLiveException;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.FilterUtils;
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

	private Date dataInclusao;

	private Date dataAlteracao;

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
	public List<AreaDeAtuacaoEmbed> criarList() {
		final List<AreaDeAtuacaoEmbed> lista = new ArrayList<AreaDeAtuacaoEmbed>();
		Long id = 0L;
		Long value = 10L;
		final String str = "String";
		for (int i = 0; i < 25; i++) {
			lista.add(conteudoLinha(id, Calendar.getInstance(), value, str));
			id++;
			value = (value * id) / 2;
		}
		return lista;

	}

	@Deprecated
	public AreaDeAtuacaoEmbed conteudoLinha(final Long id, final Calendar cal, final Long valor, final String string) {
		return new AreaDeAtuacaoEmbed(new Cadastro(id, cal, Calendar.getInstance(), "asw" + string), new AuditoriaLog(id, cal, string + "123", id + valor, string, new BigDecimal(valor), new BigDecimal(valor), string + "aa", string + "bb"));
	}

	@Override
	public void inicializarFiltros() {
		filterUtils = new FilterUtils<AreaDeAtuacaoEmbed>(logger) {

			@Override
			protected void setDataMB(String field, Date data) {
				if (field.equals("dataInclusao")) {
					dataInclusao = data;
				} else if (field.equals("dataAlteracao")) {
					dataAlteracao = data;
				} else {
					throw new GoLiveException("Não existe o campo no managedBean");
				}
			}

			@Override
			protected List<String> getFiltros(String field) {

				List<String> filtros = new ArrayList<String>();
				if (field.equals("dataInclusao")) {
					if (dataAlteracao != null) {
						filtros.add("dataAlteracao");
					}
				} else if (field.equals("dataAlteracao")) {
					if (dataInclusao != null) {
						filtros.add("dataInclusao");
					}
				} else {
					throw new GoLiveException("Não existe o campo no managedBean");
				}
				return filtros;

			}

			@Override
			protected Date getDatePorFieldEntity(AreaDeAtuacaoEmbed entity, String field) {
				if (field.equals("dataInclusao")) {
					return entity.getCadastroAreaAtuacao().getDataInclusao().getTime();
				} else if (field.equals("dataAlteracao")) {
					return entity.getCadastroAreaAtuacao().getDataAlteracao().getTime();
				} else {
					throw new GoLiveException("Não existe o campo na entidade");
				}
			}

			@Override
			protected Date getDataMB(String field) {
				if (field.equals("dataInclusao")) {
					return dataInclusao;
				} else if (field.equals("dataAlteracao")) {
					return dataAlteracao;
				} else {
					throw new GoLiveException("Não existe o campo no managedBean");
				}
			}
		};
	}

}
