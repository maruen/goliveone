package br.com.golive.bean.page.cadastro.cadastros.produtos.finalidades;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
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
import br.com.golive.entity.especialidades.model.CorProdutoModel;
import br.com.golive.filter.FilterManager;
import br.com.golive.qualifier.FilterInjected;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@Label(name = "label.cadastros.produtos.finalidades.finalidadePadraoLargura")
@ManagedBean
@ViewScoped
public class FinalidadePadraoLarguraBean extends CadastroBeanRules<CorProdutoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;

	@Inject
	@FilterInjected
	private FilterManager<CorProdutoModel> filterManager;

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
		this.registro = new CorProdutoModel();
		logger.info("Inicializando = {}", this.getClass().getName());
	}

	@Override
	public void incluir() {
		super.incluir();
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
	public void salvar(){
		super.salvar();
		logger.info("Salvando = {}");
	}

	@Deprecated
	public List<CorProdutoModel> criarList() throws ParseException {
		final List<CorProdutoModel> lista = new ArrayList<CorProdutoModel>();
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
	public FilterManager<CorProdutoModel> getFilterManager() {
		return filterManager;
	}

	@Override
	public void setFilterManager(final FilterManager<CorProdutoModel> filterManager) {
		this.filterManager = filterManager;
	}

	public List<Object> getAuditoriaLogs() {
		ArrayList<Object> list = new ArrayList<Object>();
		
		list.add(new Object());
		list.add(new Object());
		list.add(new Object());

		return list;
	}
}
