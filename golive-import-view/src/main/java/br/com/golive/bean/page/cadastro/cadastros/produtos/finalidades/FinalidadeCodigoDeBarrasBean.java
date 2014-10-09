package br.com.golive.bean.page.cadastro.cadastros.produtos.finalidades;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.imageio.ImageIO;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroBeanRules;
import br.com.golive.constants.TipoRelatorio;
import br.com.golive.entity.especialidades.CoresModel;
import br.com.golive.filter.FilterManager;
import br.com.golive.qualifier.FilterInjected;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;
import br.com.golive.utils.JSFUtils;
import br.com.golive.utils.javascript.FuncaoJavaScript;

@Label(name = "label.cadastros.produtos.finalidades.finalidadeCodigoDeBarras")
@ManagedBean
@ViewScoped
public class FinalidadeCodigoDeBarrasBean extends CadastroBeanRules<CoresModel> {

	private static final long serialVersionUID = 6286581844381749904L;

	@Inject
	private Logger logger;

	@Inject
	@FilterInjected
	private FilterManager<CoresModel> filterManager;

	@Inject
	@LabelSystemInjected
	private GoliveOneProperties labels;

	@Override
	@PostConstruct
	public void init() {
		try {
			super.init(criarList());
		} catch (final ParseException e) {
			e.printStackTrace();
		}
		this.registro = new CoresModel();
		logger.info("Inicializando = {}", this.getClass().getName());
	}

	@Override
	public void incluir() {
		super.incluir();
	}

	@Override
	public void confirmarExclusao() {
		if (registro != null) {
			conteudo.remove(registro);
			filtrados.remove(registro);
			registro = null;
			JSFUtils.chamarJs(new FuncaoJavaScript("hideConfirmarExclusaoDiv", "1000", "1000"));
			JSFUtils.infoMessage("Processo Ok", "Registro foi excluido");
		}
	}

	@Override
	public void editarRegistro() {
		if (isSelecionado()) {
			super.editarRegistro();
			logger.info("Edicao de registro = {} " );

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
	@Deprecated
	public void salvar() {
		final boolean insert = false;
		if (insert) {
			super.salvar();
		}
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
	public List<CoresModel> criarList() throws ParseException {
		final List<CoresModel> lista = new ArrayList<CoresModel>();
		for (Integer i = 0; i < 10; i++) {
			final CoresModel coresModel = new CoresModel(Long.valueOf(i.longValue()),
												   new Date(),
												   new Date(),
												   "0000000025",
												   "Vermelho",
												   "0000000001",
												   	"asbca14",
												   	"Mountain Vibe Glass Colors"
												   );
			
			lista.add(coresModel);
		}
		return lista;

	}

	@Override
	public Logger getLogger() {
		return logger;
	}

	@Override
	public GoliveOneProperties getLabels() {
		return labels;
	}

	@Override
	public void setLabels(final GoliveOneProperties labels) {
		this.labels = labels;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public void setLogger(final Logger logger) {
		this.logger = logger;
	}

	@Override
	public FilterManager<CoresModel> getFilterManager() {
		return filterManager;
	}

	public void setFilterManager(final FilterManager<CoresModel> filterManager) {
		this.filterManager = filterManager;
	}

}
