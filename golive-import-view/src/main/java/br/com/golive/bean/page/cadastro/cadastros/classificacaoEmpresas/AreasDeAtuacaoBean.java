package br.com.golive.bean.page.cadastro.cadastros.classificacaoEmpresas;

import java.io.IOException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
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
import net.sf.jasperreports.engine.JRException;

import org.apache.commons.lang.WordUtils;
import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroBeanRules;
import br.com.golive.constants.TipoRelatorio;
import br.com.golive.entity.areaDeAtuacao.AreaDeAtuacaoEmbed;
import br.com.golive.entity.areaDeAtuacao.AuditoriaLog;
import br.com.golive.entity.areaDeAtuacao.Cadastro;
import br.com.golive.exception.GoLiveException;
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
		try {
			logger.info("Gerando relatório pdf, para classe = {}", Cadastro.class.getName());
			relatorios.gerarRelatorio(TipoRelatorio.PDF, Cadastro.class, conteudo, obterParametrosRelatório(), labels, null);
		} catch (GoLiveException | JRException | IOException e) {
			logger.error("Erro ao gerar relatorio em pdf = {}", Cadastro.class.getName());
		}
	}

	@Override
	public void exportarXls() {
		try {
			logger.info("Gerando relatório xls, para classe = {}", Cadastro.class.getName());
			relatorios.gerarRelatorio(TipoRelatorio.EXCEL, Cadastro.class, conteudo, obterParametrosRelatório(), labels, null);
		} catch (GoLiveException | JRException | IOException e) {
			logger.error("Erro ao gerar relatorio em xls = {}", Cadastro.class.getName());
		}
	}

	@Override
	public void imprimir() {
		try {
			logger.info("imprimindo pagina, para classe = {}", Cadastro.class.getName());
			relatorios.gerarRelatorio(TipoRelatorio.IMPRESSAO, Cadastro.class, conteudo, obterParametrosRelatório(), labels, impressoraSelecionada);
		} catch (GoLiveException | JRException | IOException e) {
			logger.error("Erro ao gerar relatorio = {}", Cadastro.class.getName());
			logger.error("Excecao ={}", e.getMessage());
			e.printStackTrace();
		}
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
		final Calendar data = Calendar.getInstance();
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

	public void filtrarDataInclusao(final Date date) {
		try {
			dataInclusao = date;
			List<AreaDeAtuacaoEmbed> tmp = new ArrayList<AreaDeAtuacaoEmbed>();
			tmp.addAll(filtrados);
			if (dataInclusao != null) {
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				for (AreaDeAtuacaoEmbed index : conteudo) {
					if (!sdf.format(dataInclusao).equals(sdf.format(index.getCadastroAreaAtuacao().getDataInclusao().getTime()))) {
						tmp.remove(index);
					}
				}
				filtrados.removeAll(conteudo);
				filtrados.addAll(tmp);
			} else {
				filtrados.removeAll(conteudo);
				filtrados.addAll(conteudo);

				if(dataAlteracao != null){
					filtrarDataAlteracao(dataAlteracao);
				}
			}
		

			
		} catch (Exception e) {
			logger.error("Erro ao filtrar data de inclusao");
			JSFUtils.errorMessage(labels.getField("title.msg.erro.ao.filtrar"), labels.getField("msg.erro.ao.filtrar") + " " + labels.getField("label.dataAlteracao"));
		}
	}

	public void filtrarDataAlteracao(final Date date) {
		try {
			dataAlteracao = date;
			List<AreaDeAtuacaoEmbed> tmp = new ArrayList<AreaDeAtuacaoEmbed>();
			tmp.addAll(filtrados);
			if (dataAlteracao != null) {
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				for (AreaDeAtuacaoEmbed index : conteudo) {
					if (!sdf.format(dataAlteracao).equals(sdf.format(index.getCadastroAreaAtuacao().getDataAlteracao().getTime()))) {
						tmp.remove(index);
					}
				}
				filtrados.removeAll(conteudo);
				filtrados.addAll(tmp);
			} else {
				filtrados.removeAll(conteudo);
				filtrados.addAll(conteudo);
				if(dataInclusao != null){
					filtrarDataInclusao(dataInclusao);
				}				
			}


		} catch (Exception e) {
			logger.error("Erro ao filtrar data de inclusao");
			JSFUtils.errorMessage(labels.getField("title.msg.erro.ao.filtrar"), labels.getField("msg.erro.ao.filtrar") + " " + labels.getField("label.dataAlteracao"));
		}
	}
	
}
