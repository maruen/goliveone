package br.com.golive.bean.generics;

import java.io.Serializable;
import java.util.List;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.entity.especialidades.model.CorProdutoModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.service.ColecoesService;
import br.com.golive.service.CorProdutoService;

@ManagedBean
@ViewScoped
public class CadastroProdutoEspecificidade extends GenericComponentBean implements Serializable {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;

	@EJB
	private ColecoesService colecoesService;

	@EJB
	private CorProdutoService corProdutoService;

	private List<ColecoesModel> colecoes;
	private List<CorProdutoModel> cores;

	public void carregarCoresPorColecoes(final ColecoesModel colecoesModel) {
		obterCores(colecoesModel);
	}

	public void carregarColecoesPorSubGrupo(final SubGrupoProdutoModel subGrupoProduto) {
		obterColecoes(subGrupoProduto);
	}

	public void obterColecoes(final SubGrupoProdutoModel subGrupoProduto) {
		setColecoes(colecoesService.obterListaPorSubGrupo(subGrupoProduto));
		if (getColecoes().isEmpty()) {
			listaVaziaMessage("msg.lista.colecoes.vazia");

		}
		validar();
	}

	public void obterCores(final ColecoesModel colecoesModel) {
		cores = corProdutoService.obterPorColecao(colecoesModel);
		if (getColecoes().isEmpty()) {
			listaVaziaMessage("msg.lista.colecoes.vazia");

		}
		validar();
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

}
