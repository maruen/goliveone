package br.com.golive.bean.page.cadastro.cadastros.produtos.finalidades.cor;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.bean.generics.parent.GenericFilterBean;
import br.com.golive.entity.finalidadecor.model.ProdutoFinalidadeCorModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.LongFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;

@ManagedBean
@ViewScoped
public class ProdutoFinalidadeCorFilter extends GenericFilterBean<ProdutoFinalidadeCorModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	private Logger logger;

	@Inject
	@FilterInjected
	@Filter(columnName = "id", label = "label.id", entityClazz = ProdutoFinalidadeCorModel.class, fieldName = "id")
	private LongFilter filtroId;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", label = "label.dataInclusao", entityClazz = ProdutoFinalidadeCorModel.class, fieldName = "dataInclusao")
	private DateFilter filtroDataInclusao;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", label = "label.dataAlteracao", entityClazz = ProdutoFinalidadeCorModel.class, fieldName = "dataAlteracao")
	private DateFilter filtroDataAletracao;

	@Inject
	@FilterInjected
	@Filter(columnName = "FinalidadeCorProduto", label = "label.cadastroFinalidadeCor.finalidadeCorProduto", entityClazz = ProdutoFinalidadeCorModel.class, fieldName = "finalidadeCorProduto")
	private StringFilter filtroFinalidadeCorProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "NumeroMaximoCaracteres", label = "label.cadastroFinalidadeCor.nMaximoCaracteres", entityClazz = ProdutoFinalidadeCorModel.class, fieldName = "numeroMaximoCaracteres")
	private LongFilter filtroQuantidadeMaxima;

	@Inject
	@FilterInjected
	@Filter(columnName = "NumeroMinimoCaracteres", label = "label.cadastroFinalidadeCor.nMinimoCaracteres", entityClazz = ProdutoFinalidadeCorModel.class, fieldName = "numeroMinimoCaracteres")
	private LongFilter filtroQuantidadeMinima;
}