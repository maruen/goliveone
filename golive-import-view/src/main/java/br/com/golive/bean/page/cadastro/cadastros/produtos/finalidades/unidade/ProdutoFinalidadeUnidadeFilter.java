package br.com.golive.bean.page.cadastro.cadastros.produtos.finalidades.unidade;

import javax.inject.Inject;

import lombok.Getter;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.bean.generics.parent.GenericFilterBean;
import br.com.golive.entity.finalidadeunidade.model.ProdutoFinalidadeUnidadeModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.LongFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;

public class ProdutoFinalidadeUnidadeFilter extends GenericFilterBean<ProdutoFinalidadeUnidadeModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	private Logger logger;

	@Inject
	@FilterInjected
	@Filter(columnName = "id", label = "label.id", entityClazz = ProdutoFinalidadeUnidadeModel.class, fieldName = "id")
	private LongFilter filtroId;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", label = "label.dataInclusao", entityClazz = ProdutoFinalidadeUnidadeModel.class, fieldName = "dataInclusao")
	private DateFilter filtroDataInclusao;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", label = "label.dataAlteracao", entityClazz = ProdutoFinalidadeUnidadeModel.class, fieldName = "dataAlteracao")
	private DateFilter filtroDataAlteracao;

	@Inject
	@FilterInjected
	@Filter(columnName = "FinalidadeUnidadeProduto", label = "label.cadastroFinalidadeUnidade.descricao", entityClazz = ProdutoFinalidadeUnidadeModel.class, fieldName = "finalidadeUnidadeProduto")
	private StringFilter filtroFinalidadeUnidadeProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "NumeroMaximoCaracteres", label = "label.cadastroFinalidadeUnidade.nMaximoCaracteres", entityClazz = ProdutoFinalidadeUnidadeModel.class, fieldName = "numeroMaximoCaracteres")
	private LongFilter filtroQuantidadeMaxima;

	@Inject
	@FilterInjected
	@Filter(columnName = "NumeroMinimoCaracteres", label = "label.cadastroFinalidadeUnidade.nMinimoCaracteres", entityClazz = ProdutoFinalidadeUnidadeModel.class, fieldName = "numeroMinimoCaracteres")
	private LongFilter filtroQuantidadeMinima;
}