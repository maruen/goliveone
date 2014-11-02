package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades;

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
import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.especialidades.model.CorProdutoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.service.ColecoesService;
import br.com.golive.service.CorProdutoService;
import br.com.golive.service.DepartamentoService;
import br.com.golive.service.GrupoProdutoService;
import br.com.golive.service.SubGrupoProdutoService;
import br.com.golive.utils.GoliveOneProperties;

@ManagedBean
@ViewScoped
@Label(name= "label.cadastroCores")
public class CorProdutoBean extends CadastroBeanRules<CorProdutoModel> {

	private static final long serialVersionUID = 1L;

	@Inject @Getter @Setter	private Logger logger;
	
	@Inject	@LabelSystemInjected private GoliveOneProperties labels;
	
	@EJB private DepartamentoService 		departamentoService;
	@EJB private GrupoProdutoService 		grupoProdutoService;
	@EJB private SubGrupoProdutoService 	subGrupoProdutoService;
	@EJB private CorProdutoService 			corProdutoService;
	@EJB private ColecoesService			colecaoService;
	
	@Override
	@PostConstruct
	public void init() {
		logger.info("Inicializando = {}", this.getClass().getName());
		super.init(corProdutoService.listarPorFiltro());
		fluxo = LISTAGEM;
	}
	
	@Override
	public void incluir() {
		super.incluir();
		this.registro = new CorProdutoModel();
	}

	@Override
	public void excluir() {
		corProdutoService.excluir(registro);
		super.excluir();
	}

	@Override
	public void salvar() {
		
		if (registro.hasId()) {
			corProdutoService.alterar(registro);
		} else {
			corProdutoService.salvar(registro);
		}
		
		conteudo = corProdutoService.listarPorFiltro();
		super.salvar();
	}
	
	
	
	
	public List<AuditoriaModel> getAuditoriaLogs() {
		return corProdutoService.getAuditoriaLogs(registro); 
	}
	
	public String getUsuarioLog() {
		return corProdutoService.getUsuarioLog(registro);
	}
	
	public List<DepartamentoModel> getDepartamentos() {
		return departamentoService.listarTodos();
	}
	
	
	public List<GrupoProdutosModel> getGrupoProdutoList() {
		return grupoProdutoService.obterGrupoProdutos();
	}
	
	public List<SubGrupoProdutoModel> getSubGrupoProdutoList() {
		return subGrupoProdutoService.listarTodos();
	}
	
	public List<ColecoesModel> getColecoesList() {
		return colecaoService.listarTodos();
	}
	
	
}