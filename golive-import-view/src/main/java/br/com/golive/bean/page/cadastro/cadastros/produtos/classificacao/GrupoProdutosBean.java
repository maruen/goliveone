package br.com.golive.bean.page.cadastro.cadastros.produtos.classificacao;

import java.io.IOException;
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

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroBeanRules;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.filter.FilterManager;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@ManagedBean
@ViewScoped
@Label(name = "label.cadastroGrupoProdutos")
public class GrupoProdutosBean extends CadastroBeanRules<GrupoProdutosModel> {
	
	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;

	@Inject
	@LabelSystemInjected
	private GoliveOneProperties labels;
	private Calendar data;

	@Override
	@PostConstruct
	public void init() {
		super.init(criarList());

		logger.info("Inicializando = {}", this.getClass().getName());

		fluxo = getFluxoListagem();
		data = Calendar.getInstance();
	}

	public List<GrupoProdutosModel> criarList() {
		final List<GrupoProdutosModel> lista = new ArrayList<GrupoProdutosModel>();
		for (Integer i = 0; i < 10; i++) {
			lista.add(new GrupoProdutosModel(new Long(i), new Date(), new Date(), 
					"Acessórios, Partes e Peças para Persianas Horizontais em Alumínio", 
					"0000000001", "Lâminas em Alumínio 25mm"));
		}
		return lista;
	}

	public Calendar getDataInclusaoFiltro() {
		return data;
	}

	public void setDataInclusaoFiltro(final Calendar dataInclusaoFiltro) {
		data = dataInclusaoFiltro;
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
	public void salvar() {
		super.salvar();
		logger.info("Salvando = {} ");
	}

	@Override
	protected Logger getLogger() {
		return logger;
	}

	@Override
	public FilterManager<GrupoProdutosModel> getFilterManager() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Object> getAuditoriaLogs() {
		ArrayList<Object> list = new ArrayList<Object>();
		
		list.add(new Object());
		list.add(new Object());
		list.add(new Object());

		return list;
	}
}