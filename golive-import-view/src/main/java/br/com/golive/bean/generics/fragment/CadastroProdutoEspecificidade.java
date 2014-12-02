package br.com.golive.bean.generics.fragment;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;
import lombok.Setter;

import org.slf4j.Logger;

import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.entity.especialidades.model.CorProdutoModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.service.ColecoesService;
import br.com.golive.service.CorProdutoService;

@ManagedBean
@ViewScoped
public class CadastroProdutoEspecificidade extends GenericFragmentBean implements Serializable {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;

	@EJB
	private ColecoesService colecoesService;

	@EJB
	private CorProdutoService corProdutoService;

	private List<ColecoesModel> colecoes;
	private List<CorProdutoModel> cores;

	@Getter
	@Setter
	private List<ColecoesModel> colecoesFiltrados;

	@Getter
	@Setter
	private List<CorProdutoModel> coresFiltrados;

	public void carregarCoresPorColecoes(final ColecoesModel colecoesModel, final boolean validar) {
		obterCores(colecoesModel);
		if (validar) {
			validar();
		}
	}

	public void carregarColecoesPorSubGrupo(final SubGrupoProdutoModel subGrupoProduto, final boolean validar) {
		obterColecoes(subGrupoProduto);
		if (validar) {
			validar();
		}
	}

	public void obterColecoes(final SubGrupoProdutoModel subGrupoProduto) {
		infoList(ColecoesModel.class.getSimpleName());
		colecoes = colecoesService.obterListaPorSubGrupo(usuario, empresaSelecionada, subGrupoProduto);
		if (isEmptyOrNull(colecoes)) {
			listaVaziaMessage("msg.lista.colecoes.vazia");
			removeAll(coresFiltrados, colecoesFiltrados);
			cores = null;
		} else {
			if (colecoesFiltrados == null) {
				colecoesFiltrados = new ArrayList<ColecoesModel>();
			}
			removeAll(colecoesFiltrados);
			colecoesFiltrados.addAll(colecoes);
		}
	}

	public void obterCores(final ColecoesModel colecoesModel) {
		infoList(CorProdutoModel.class.getSimpleName());
		cores = corProdutoService.obterPorColecao(usuario, empresaSelecionada, colecoesModel);
		if (isEmptyOrNull(cores)) {
			listaVaziaMessage("msg.lista.cores.vazia");
			removeAll(coresFiltrados);
		} else {
			if (coresFiltrados == null) {
				coresFiltrados = new ArrayList<CorProdutoModel>();
			}
			removeAll(coresFiltrados);
			coresFiltrados.addAll(cores);
		}
	}

	public List<ColecoesModel> getColecoes() {
		return colecoes;
	}

	public void setColecoes(final List<ColecoesModel> colecoes) {
		this.colecoes = colecoes;
	}

	public List<CorProdutoModel> getCores() {
		return cores;
	}

	public void setCores(final List<CorProdutoModel> cores) {
		this.cores = cores;
	}

	@Override
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(final Logger logger) {
		this.logger = logger;
	}

}
