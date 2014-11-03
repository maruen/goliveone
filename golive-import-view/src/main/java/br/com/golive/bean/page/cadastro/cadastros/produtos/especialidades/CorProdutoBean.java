package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBean;
import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.especialidades.model.CorProdutoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.NumberFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;
import br.com.golive.service.ColecoesService;
import br.com.golive.service.CorProdutoService;
import br.com.golive.service.DepartamentoService;
import br.com.golive.service.GrupoProdutoService;
import br.com.golive.service.SubGrupoProdutoService;

@ManagedBean
@ViewScoped
@Label(name= "label.cadastroCores")
@Data
@EqualsAndHashCode(callSuper=false)
public class CorProdutoBean extends CadastroGenericBean<CorProdutoModel> {

	private static final long serialVersionUID = 1L;

	
	@Inject @Getter private Logger logger;


	/**
	 * FILTROS COR
	 */
	
	
	@Inject
	@FilterInjected
	@Filter(name = "CorDescricao", label = "label.cadastroCores.cor")
	private StringFilter filtroCorDescricao;
	
	@Inject
	@FilterInjected
	@Filter(name = "CorCodigo", label = "label.cadastroCores.codCor")
	private NumberFilter filtroCorCod;
	
	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao")
	private DateFilter filtroDataInclusaoCorProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao")
	private DateFilter filtroDataAlteracaoCorProduto;
	
	/**
	 * FILTROS DEPARTAMENTO
	 */
	
	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id")
	private NumberFilter filtroIdDepartamento;

	@Inject
	@FilterInjected
	@Filter(name = "DepartamentoProduto", label = "label.departamentos", path = "departamentoSelected")
	private StringFilter filtroDepartamento;
	
	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao", path = "departamentoSelected")
	private DateFilter filtroDataInclusaoDepartamento;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao", path = "departamentoSelected")
	private DateFilter filtroDataAletracaoDepartamento;

	
	
	/**
	 * FILTROS COLECOES
	 */
	
	
	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id")
	private NumberFilter filtroIdColecoes;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao")
	private DateFilter filtroDataInclusaoColecao;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao")
	private DateFilter filtroDataAlteracaoColecao;

	@Inject
	@FilterInjected
	@Filter(name = "Colecao", label = "label.cadastroProdutos.colecao")
	private StringFilter filtroColecao;
	
	
	/**
	 * FILTROS GRUPO PRODUTO
	 */
	
	
	
	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id", path = "grupoProdutoSelected")
	private NumberFilter filtroIdGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "GrupoProduto", label = "label.gruposDeProdutos", path = "grupoProdutoSelected")
	private StringFilter filtroGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao", path = "grupoProdutoSelected")
	private DateFilter filtroDataInclusaoGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao", path = "grupoProdutoSelected")
	private DateFilter filtroDataAletracaoGrupoProduto;

	
	/**
	 * FILTROS SUBGRUPO PRODUTO
	 */
	
	
	
	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id", path = "subGrupoProdutoSelected")
	private NumberFilter filtroIdSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SubGrupoProduto", label = "label.gruposDeProdutos", path = "subGrupoProdutoSelected")
	private StringFilter filtroSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao", path = "subGrupoProdutoSelected")
	private DateFilter filtroDataInclusaoSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao", path = "subGrupoProdutoSelected")
	private DateFilter filtroDataAletracaoSubGrupoProduto;
	
	
	@EJB private DepartamentoService 		departamentoService;
	@EJB private GrupoProdutoService 		grupoProdutoService;
	@EJB private SubGrupoProdutoService 	subGrupoProdutoService;
	@EJB private CorProdutoService 			corProdutoService;
	@EJB private ColecoesService			colecaoService;
	
	@Override
	@PostConstruct
	public void init() {
		super.init(corProdutoService.listarPorFiltro(), getConfiguracaoesByClasses(CorProdutoModel.class));
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
		super.init(corProdutoService.listarPorFiltro(), getConfiguracaoesByClasses(CorProdutoModel.class));
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