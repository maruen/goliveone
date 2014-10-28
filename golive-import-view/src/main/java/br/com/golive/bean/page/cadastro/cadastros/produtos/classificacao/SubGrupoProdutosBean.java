package br.com.golive.bean.page.cadastro.cadastros.produtos.classificacao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.imageio.ImageIO;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroBeanRules;
import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.service.SubGrupoProdutoService;
import br.com.golive.utils.GoliveOneProperties;

@ManagedBean
@ViewScoped
@Label(name= "label.cadastroSubGrupoProdutos")
public class SubGrupoProdutosBean extends CadastroBeanRules<SubGrupoProdutoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;
	
	@Inject
	@LabelSystemInjected
	private GoliveOneProperties labels;
	private Calendar data;
	
	@EJB
	private SubGrupoProdutoService subGrupoProdutoService;
	
	
	@Override
	@PostConstruct
	public void init() {
		super.init(criarList());
		
		logger.info("Inicializando = {}", this.getClass().getName());
		
		fluxo = getFluxoListagem();
		data = Calendar.getInstance();
	}
	
	public List<SubGrupoProdutoModel> criarList(){
		final List<SubGrupoProdutoModel> lista = new ArrayList<SubGrupoProdutoModel>();
		
		for (Integer i = 0; i < 10; i++){
			lista.add(new SubGrupoProdutoModel(new Long(i), Calendar.getInstance(), Calendar.getInstance(), 
					"Acessórios, Partes e Peças para Persianas Horizontais em Alumínio", 
					"0000000001", "Lâminas em Alumínio 25mm", "0000000001", 
					"Lâminas em Alumínio 25mm X 0.18mm"));
		}
		
		return lista;
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
	protected Logger getLogger() {
		return logger;
	}

	public Calendar getDataInclusaoFiltro() {
		return data;
	}

	public void setDataInclusaoFiltro(final Calendar data) {
		this.data = data;
	}

	@Override
	public void salvar() {
		super.salvar();
		logger.info("Salvando = {} ");
	}
	
	public List<AuditoriaModel> getAuditoriaLogs() {
		return subGrupoProdutoService.getAuditoriaLogs(registro); 
	}
	
	public String getUsuarioLog() {
		return subGrupoProdutoService.getUsuarioLog(registro);
	}
	
	
	
}