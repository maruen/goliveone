package br.com.golive.bean.page.cadastro.cadastros.produtos.finalidades.colecao;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.bean.generics.parent.GenericFilterBean;
import br.com.golive.entity.finalidadecolecao.model.ProdutoFinalidadeColecaoModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.LongFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;

@ManagedBean
@ViewScoped
public class ProdutoFinalidadeColecaoFilter extends GenericFilterBean<ProdutoFinalidadeColecaoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	private Logger logger;

	@Inject
	@FilterInjected
	@Filter(columnName = "id", label = "label.id", entityClazz = ProdutoFinalidadeColecaoModel.class, fieldName = "id")
	private LongFilter filtroId;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", label = "label.dataInclusao", entityClazz = ProdutoFinalidadeColecaoModel.class, fieldName = "dataInclusao")
	private DateFilter filtroDataInclusao;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", label = "label.dataAlteracao", entityClazz = ProdutoFinalidadeColecaoModel.class, fieldName = "dataAlteracao")
	private DateFilter filtroDataAletracao;

	@Inject
	@FilterInjected
	@Filter(columnName = "FinalidadeColecaoProduto", label = "label.cadastroFinalidadeColecao.finalidadeColecaoProduto", entityClazz = ProdutoFinalidadeColecaoModel.class, fieldName = "finalidadeColecaoProduto")
	private StringFilter filtroFinalidadeColecaoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "NumeroMaximoCaracteres", label = "label.cadastroFinalidadeColecao.nMaximoCaracteres", entityClazz = ProdutoFinalidadeColecaoModel.class, fieldName = "numeroMaximoCaracteres")
	private LongFilter filtroQuantidadeMaxima;

	@Inject
	@FilterInjected
	@Filter(columnName = "NumeroMinimoCaracteres", label = "label.cadastroFinalidadeColecao.nMinimoCaracteres", entityClazz = ProdutoFinalidadeColecaoModel.class, fieldName = "numeroMinimoCaracteres")
	private LongFilter filtroQuantidadeMinima;
}