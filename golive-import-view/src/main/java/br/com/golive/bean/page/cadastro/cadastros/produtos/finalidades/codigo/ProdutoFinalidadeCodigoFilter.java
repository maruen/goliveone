package br.com.golive.bean.page.cadastro.cadastros.produtos.finalidades.codigo;

import javax.annotation.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.bean.generics.parent.GenericFilterBean;
import br.com.golive.entity.finalidadecodigo.model.ProdutoFinalidadeCodigoModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.LongFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;

@ManagedBean
@ViewScoped
public class ProdutoFinalidadeCodigoFilter extends GenericFilterBean<ProdutoFinalidadeCodigoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	private Logger logger;

	@Inject
	@FilterInjected
	@Filter(columnName = "id", label = "label.id", entityClazz = ProdutoFinalidadeCodigoModel.class, fieldName = "id")
	private LongFilter filtroId;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", label = "label.dataInclusao", entityClazz = ProdutoFinalidadeCodigoModel.class, fieldName = "dataInclusao")
	private DateFilter filtroDataInclusao;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", label = "label.dataAlteracao", entityClazz = ProdutoFinalidadeCodigoModel.class, fieldName = "dataAlteracao")
	private DateFilter filtroDataAletracao;

	@Inject
	@FilterInjected
	@Filter(columnName = "FinalidadeCodigoProduto", label = "label.cadastroFinalidadeColecao.finalidadeColecaoProduto", entityClazz = ProdutoFinalidadeCodigoModel.class, fieldName = "finalidadeCodigoProduto")
	private StringFilter filtroFinalidadeCodigoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "NumeroMaximoCaracteres", label = "label.cadastroFinalidadeColecao.nMaximoCaracteres", entityClazz = ProdutoFinalidadeCodigoModel.class, fieldName = "numeroMaximoCaracteres")
	private LongFilter filtroQuantidadeMaxima;

	@Inject
	@FilterInjected
	@Filter(columnName = "NumeroMinimoCaracteres", label = "label.cadastroFinalidadeColecao.nMinimoCaracteres", entityClazz = ProdutoFinalidadeCodigoModel.class, fieldName = "numeroMinimoCaracteres")
	private LongFilter filtroQuantidadeMinima;
}