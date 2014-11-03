package br.com.golive.bean.page.cadastro.cadastros.produtos.finalidades;

import java.io.IOException;
import java.text.ParseException;
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

import lombok.Getter;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroBeanRules;
import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.especialidades.model.CorProdutoModel;
import br.com.golive.filter.FilterManager;
import br.com.golive.qualifier.FilterInjected;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@Label(name = "label.cadastroFinalidadeCor")
@ManagedBean
@ViewScoped
public class FinalidadeCorBean extends CadastroBeanRules<CorProdutoModel> {

	private static final long serialVersionUID = 1L;

	@Inject @Getter private Logger logger;

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
	
	public List<AuditoriaModel> getAuditoriaLogs() {
		ArrayList<AuditoriaModel> list = new ArrayList<AuditoriaModel>();
		return list;
	}

	@Override
	protected Logger getLogger() {
		// TODO Auto-generated method stub
		return logger;
	}


}
