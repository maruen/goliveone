package br.com.golive.bean.generics;

import java.io.Serializable;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.service.DepartamentoService;
import br.com.golive.service.GrupoProdutoService;
import br.com.golive.service.SubGrupoProdutoService;

@ManagedBean
@ViewScoped
public class CadastroProdutoClassificacao extends GenericComponentBean implements Serializable {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;

	@EJB
	private DepartamentoService departamentoService;

	@EJB
	private GrupoProdutoService grupoProdutoService;

	@EJB
	private SubGrupoProdutoService subGrupoProdutoService;

	private List<DepartamentoModel> departamentos;
	private List<GrupoProdutosModel> grupos;
	private List<SubGrupoProdutoModel> subGrupos;

	@PostConstruct
	public void postConstruct() {
		if (usuario != null) {
			obterDepartamentos();
		}
	}

	public void carregarGrupoProdutoPorDepartamento(final DepartamentoModel departamento, final boolean validar) {
		obterGruposProduto(departamento);
		if (validar) {
			validar();
		}
	}

	public void carregarSubGrupoProdutoPorGrupo(final GrupoProdutosModel grupoProduto, final boolean validar) {
		obterSubGrupos(grupoProduto);
		if (validar) {
			validar();
		}
	}

	private void obterDepartamentos() {
		departamentos = departamentoService.obterLista();
		if (isEmptyOrNull(departamentos)) {
			listaVaziaMessage("msg.lista.departamento.vazia");
			grupos = null;
			subGrupos = null;
		}
	}

	private void obterGruposProduto(final DepartamentoModel departamento) {
		grupos = grupoProdutoService.obterGrupoProdutoDepartamentoPorDepartamento(departamento);
		if (isEmptyOrNull(grupos)) {
			listaVaziaMessage("msg.lista.grupoproduto.vazia");
			subGrupos = null;
		}
	}

	private void obterSubGrupos(final GrupoProdutosModel grupoProduto) {
		subGrupos = subGrupoProdutoService.obterSubGrupoProdutoPorGrupo(grupoProduto);
		if (subGrupos.isEmpty()) {
			listaVaziaMessage("msg.lista.subgrupo.vazia");
		}
		validar();
	}

	public List<DepartamentoModel> getDepartamentos() {
		return departamentos;
	}

	public void setDepartamentos(final List<DepartamentoModel> departamentos) {
		this.departamentos = departamentos;
	}

	public List<GrupoProdutosModel> getGrupos() {
		return grupos;
	}

	public void setGrupos(final List<GrupoProdutosModel> grupos) {
		this.grupos = grupos;
	}

	public List<SubGrupoProdutoModel> getSubGrupos() {
		return subGrupos;
	}

	public void setSubGrupos(final List<SubGrupoProdutoModel> subGrupos) {
		this.subGrupos = subGrupos;
	}

}
