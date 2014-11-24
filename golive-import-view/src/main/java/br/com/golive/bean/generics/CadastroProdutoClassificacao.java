package br.com.golive.bean.generics;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;
import lombok.Setter;

import org.slf4j.Logger;

import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.service.DepartamentoService;
import br.com.golive.service.GrupoProdutoService;
import br.com.golive.service.SubGrupoProdutoService;

@ManagedBean
@ViewScoped
public class CadastroProdutoClassificacao extends GenericFragmentBean implements Serializable {

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

	@Getter
	@Setter
	private List<DepartamentoModel> departamentosFiltrados;

	@Getter
	@Setter
	private List<GrupoProdutosModel> gruposFiltrados;

	@Getter
	@Setter
	private List<SubGrupoProdutoModel> subGruposFiltrados;

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
		infoList(DepartamentoModel.class.getSimpleName());
		departamentos = departamentoService.obterLista();
		if (isEmptyOrNull(departamentos)) {
			listaVaziaMessage("msg.lista.departamento.vazia");
			removeAll(departamentosFiltrados, gruposFiltrados, subGruposFiltrados);
			grupos = null;
			subGrupos = null;
		} else {
			if (departamentosFiltrados == null) {
				departamentosFiltrados = new ArrayList<DepartamentoModel>();
			}
			departamentosFiltrados.addAll(departamentos);
		}
	}

	private void obterGruposProduto(final DepartamentoModel departamento) {
		infoList(GrupoProdutosModel.class.getSimpleName());
		grupos = grupoProdutoService.obterGrupoProdutoDepartamentoPorDepartamento(departamento);
		if (isEmptyOrNull(grupos)) {
			listaVaziaMessage("msg.lista.grupoproduto.vazia");
			removeAll(subGruposFiltrados, gruposFiltrados);
			subGrupos = null;
		} else {
			if (gruposFiltrados == null) {
				gruposFiltrados = new ArrayList<GrupoProdutosModel>();
			}
			gruposFiltrados.addAll(grupos);
		}
	}

	private void obterSubGrupos(final GrupoProdutosModel grupoProduto) {
		infoList(SubGrupoProdutoModel.class.getSimpleName());
		subGrupos = subGrupoProdutoService.obterSubGrupoProdutoPorGrupo(grupoProduto);
		if (subGrupos.isEmpty()) {
			listaVaziaMessage("msg.lista.subgrupo.vazia");
			removeAll(subGruposFiltrados);
		} else {
			if (subGruposFiltrados == null) {
				subGruposFiltrados = new ArrayList<SubGrupoProdutoModel>();
			}
			subGruposFiltrados.addAll(subGrupos);
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

	@Override
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(final Logger logger) {
		this.logger = logger;
	}

}
