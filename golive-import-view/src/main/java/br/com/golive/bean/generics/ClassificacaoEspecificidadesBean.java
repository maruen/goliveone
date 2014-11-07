package br.com.golive.bean.generics;

import java.io.Serializable;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.qualifier.UsuarioLogadoInjected;
import br.com.golive.service.ColecoesService;
import br.com.golive.service.DepartamentoService;
import br.com.golive.service.GrupoProdutoService;
import br.com.golive.service.SubGrupoProdutoService;
import br.com.golive.utils.GoliveOneProperties;
import br.com.golive.utils.JSFUtils;

@ManagedBean
@ViewScoped
public class ClassificacaoEspecificidadesBean implements Serializable {

	
	private static final long serialVersionUID = 1L;
	
	@Inject
	@UsuarioLogadoInjected
	protected Usuario usuario;


	@EJB private DepartamentoService 	departamentoService;
	@EJB private GrupoProdutoService 	grupoProdutoService;
 	@EJB private SubGrupoProdutoService subGrupoProdutoService;
 	@EJB private ColecoesService 		colecoesService;
 	
 	private List<DepartamentoModel> 	departamentos;
	private List<GrupoProdutosModel> 	grupos;
	private List<SubGrupoProdutoModel> 	subGrupos;
	private List<ColecoesModel> 		colecoes;
	
	private DepartamentoModel			departamentoSelected;
	private GrupoProdutosModel			grupoProdutoSelected;
	private SubGrupoProdutoModel		subGrupoProdutoSelected;
	private ColecoesModel				colecaoSelected;

	private DepartamentoModel			departamentoPrevious;
	private GrupoProdutosModel			grupoProdutoPrevious;
	private SubGrupoProdutoModel		subGrupoProdutoPrevious;
	private ColecoesModel				colecaoPrevious;
	
	private Boolean 					especificidades;
		
	
	@PostConstruct
	public void init() {
		obterDepartamentos();
	}
	
	
	public void loadPopups() {
		obterGruposProduto(departamentoSelected);
		obterSubGrupos(grupoProdutoSelected);
		obterColecoes(subGrupoProdutoSelected);
	}
	
	public void onload(Boolean especificidades,
					   DepartamentoModel departamento,
					   GrupoProdutosModel grupoProduto,
					   SubGrupoProdutoModel subGrupoProduto) {
		
		this.especificidades			= especificidades;
		
		this.departamentoSelected 		= departamento;
		this.grupoProdutoSelected 		= grupoProduto;
		this.subGrupoProdutoSelected 	= subGrupoProduto;
		
		this.departamentoPrevious 		= departamento;
		this.grupoProdutoPrevious 		= grupoProduto;
		this.subGrupoProdutoPrevious 	= subGrupoProduto;
		
		loadPopups();
	}
	
	
	public void onload(Boolean especificidades,
			   		   DepartamentoModel departamento,
			   		   GrupoProdutosModel grupoProduto,
			   		   SubGrupoProdutoModel subGrupoProduto,
			   		   ColecoesModel colecao) {

		this.colecaoSelected = colecao;
		this.colecaoPrevious = colecao;	
		onload(especificidades,departamento,grupoProduto,subGrupoProduto);
			
			
	}
	
	
	private void obterDepartamentos() {
		departamentos = departamentoService.listarTodos();
		if (departamentos.isEmpty()) {
			listaVaziaMessage("msg.lista.departamento.vazia");
		}
	}

	
	public void obterGruposProduto(DepartamentoModel departamento) {
		grupos = grupoProdutoService.obterGrupoProdutoDepartamentoPorDepartamento(departamento);
		if (grupos.isEmpty()) {
			listaVaziaMessage("msg.lista.grupoproduto.vazia");
		}
	}


	public void obterSubGrupos(GrupoProdutosModel grupoProduto) {
		subGrupos = subGrupoProdutoService.obterSubGrupoProdutoPorGrupo(grupoProduto);
		if (subGrupos.isEmpty()) {
			listaVaziaMessage("msg.lista.subgrupo.vazia");
		}
	}
	
	public void obterColecoes(SubGrupoProdutoModel subGrupoProduto) {
		colecoes = colecoesService.obterListaPorSubGrupo(subGrupoProduto);
		if (colecoes.isEmpty()) {
			listaVaziaMessage("msg.lista.colecoes.vazia");
			
		}
	}

	
	protected void listaVaziaMessage(final String label) {
		JSFUtils.warnMessage(getLabels().getField("label.cadastroSegmentos.msnNaoHaRegistros"), getLabels().getField(label));
	}
	
	public GoliveOneProperties getLabels() {
		return usuario.getLabels();
	}
	
	public void carregarGrupoProdutoPorDepartamento(DepartamentoModel departamento) {
		
		obterGruposProduto(departamento);
		if (departamento != departamentoPrevious  ) {
			this.grupoProdutoSelected 		= null;
			this.subGrupoProdutoSelected 	= null;
			this.subGrupos 					= null;
		}
		departamentoPrevious = departamento;
	}

	public void carregarSubGrupoProdutoPorGrupo(GrupoProdutosModel grupoProduto) {
		
		obterSubGrupos(grupoProduto);
		if ( grupoProduto != grupoProdutoPrevious ) {
			this.subGrupoProdutoSelected = null;
		}
		grupoProdutoPrevious = grupoProduto;
	}
	
	
	public void carregarColecoesPorSubGrupo(SubGrupoProdutoModel subGrupoProduto) {
		
		if (especificidades.equals(false) ) {
			return;
		}
		
		obterColecoes(subGrupoProduto);
		if ( subGrupoProduto != subGrupoProdutoPrevious ) {
			this.colecaoSelected = null;
		}
		subGrupoProdutoPrevious = subGrupoProduto;
	}
	
	public List<DepartamentoModel> getDepartamentos() {
		return departamentos;
	}

	public void setDepartamentos(List<DepartamentoModel> departamentos) {
		this.departamentos = departamentos;
	}

	public List<GrupoProdutosModel> getGrupos() {
		return grupos;
	}

	public void setGrupos(List<GrupoProdutosModel> grupos) {
		this.grupos = grupos;
	}

	public List<SubGrupoProdutoModel> getSubGrupos() {
		return subGrupos;
	}

	public void setSubGrupos(List<SubGrupoProdutoModel> subGrupos) {
		this.subGrupos = subGrupos;
	}

	public DepartamentoModel getDepartamentoSelected() {
		return departamentoSelected;
	}

	public void setDepartamentoSelected(DepartamentoModel departamentoSelected) {
		this.departamentoSelected = departamentoSelected;
	}

	public GrupoProdutosModel getGrupoProdutoSelected() {
		return grupoProdutoSelected;
	}

	public void setGrupoProdutoSelected(GrupoProdutosModel grupoProdutoSelected) {
		this.grupoProdutoSelected = grupoProdutoSelected;
	}

	public SubGrupoProdutoModel getSubGrupoProdutoSelected() {
		return subGrupoProdutoSelected;
	}

	public void setSubGrupoProdutoSelected(
			SubGrupoProdutoModel subGrupoProdutoSelected) {
		this.subGrupoProdutoSelected = subGrupoProdutoSelected;
	}

	public DepartamentoModel getDepartamentoPrevious() {
		return departamentoPrevious;
	}

	public void setDepartamentoPrevious(DepartamentoModel departamentoPrevious) {
		this.departamentoPrevious = departamentoPrevious;
	}

	public GrupoProdutosModel getGrupoProdutoPrevious() {
		return grupoProdutoPrevious;
	}

	public void setGrupoProdutoPrevious(GrupoProdutosModel grupoProdutoPrevious) {
		this.grupoProdutoPrevious = grupoProdutoPrevious;
	}

	public SubGrupoProdutoModel getSubGrupoProdutoPrevious() {
		return subGrupoProdutoPrevious;
	}

	public void setSubGrupoProdutoPrevious(
			SubGrupoProdutoModel subGrupoProdutoPrevious) {
		this.subGrupoProdutoPrevious = subGrupoProdutoPrevious;
	}

	public ColecoesModel getColecaoSelected() {
		return colecaoSelected;
	}

	public void setColecaoSelected(ColecoesModel colecaoSelected) {
		this.colecaoSelected = colecaoSelected;
	}

	public ColecoesModel getColecaoPrevious() {
		return colecaoPrevious;
	}

	public void setColecaoPrevious(ColecoesModel colecaoPrevious) {
		this.colecaoPrevious = colecaoPrevious;
	}

	public List<ColecoesModel> getColecoes() {
		return colecoes;
	}

	public void setColecoes(List<ColecoesModel> colecoes) {
		this.colecoes = colecoes;
	}

	public Boolean getEspecificidades() {
		return especificidades;
	}

	public void setEspecificidades(Boolean especificidades) {
		this.especificidades = especificidades;
	}

}
