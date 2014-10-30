package br.com.golive.bean.page.cadastro.cadastros.produtos.classificacao;

import static br.com.golive.utils.Fluxo.LISTAGEM;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;
import lombok.Setter;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroBeanRules;
import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.service.DepartamentoService;
import br.com.golive.service.GrupoProdutoService;
import br.com.golive.service.SubGrupoProdutoService;
import br.com.golive.utils.GoliveOneProperties;

@ManagedBean
@ViewScoped
@Label(name= "label.cadastroSubGrupoProduto")
public class SubGrupoProdutoBean extends CadastroBeanRules<SubGrupoProdutoModel> {

	private static final long serialVersionUID = 1L;

	@Inject @Getter @Setter	private Logger logger;
	
	@Inject	@LabelSystemInjected private GoliveOneProperties labels;
	
	@EJB private SubGrupoProdutoService subGrupoProdutoService;
	@EJB private DepartamentoService 	departamentoService;
	@EJB private GrupoProdutoService 	grupoProdutoService;
	
	@Getter @Setter private DepartamentoModel  departamentoSelected = new DepartamentoModel();
	@Getter @Setter private GrupoProdutosModel grupoProdutoSelected = new GrupoProdutosModel();
	
	@Override
	@PostConstruct
	public void init() {
		logger.info("Inicializando = {}", this.getClass().getName());
		super.init(subGrupoProdutoService.listarPorFiltro());
		fluxo = LISTAGEM;
	}
	
	@Override
	public void incluir() {
		super.incluir();
		this.registro = new SubGrupoProdutoModel();
	}

	@Override
	public void excluir() {
		subGrupoProdutoService.excluir(registro);
		super.excluir();
	}

	@Override
	public void salvar() {
		
		if (registro.hasId()) {
			subGrupoProdutoService.alterar(registro);
		} else {
			subGrupoProdutoService.salvar(registro);
		}
		
		conteudo = subGrupoProdutoService.listarPorFiltro();
		super.salvar();
	}
	
	public List<AuditoriaModel> getAuditoriaLogs() {
		return subGrupoProdutoService.getAuditoriaLogs(registro); 
	}
	
	public String getUsuarioLog() {
		return subGrupoProdutoService.getUsuarioLog(registro);
	}
	
	public List<DepartamentoModel> getDepartamentos() {
		return departamentoService.listarTodos();
	}
	
	
	public List<GrupoProdutosModel> getGrupoProdutoList() {
		return grupoProdutoService.obterGrupoProdutos();
	}
	
	
}