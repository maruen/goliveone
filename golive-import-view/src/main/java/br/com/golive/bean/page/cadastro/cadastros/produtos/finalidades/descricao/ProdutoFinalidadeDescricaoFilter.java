package br.com.golive.bean.page.cadastro.cadastros.produtos.finalidades.descricao;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.bean.generics.parent.GenericFilterBean;
import br.com.golive.entity.finalidadedescricao.model.ProdutoFinalidadeDescricaoModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.LongFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;

@ManagedBean
@ViewScoped
public class ProdutoFinalidadeDescricaoFilter extends GenericFilterBean<ProdutoFinalidadeDescricaoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	private Logger logger;

	@Inject
	@FilterInjected
	@Filter(columnName = "id", label = "label.id", entityClazz = ProdutoFinalidadeDescricaoModel.class, fieldName = "id")
	private LongFilter filtroId;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", label = "label.dataInclusao", entityClazz = ProdutoFinalidadeDescricaoModel.class, fieldName = "dataInclusao")
	private DateFilter filtroDataInclusao;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", label = "label.dataAlteracao", entityClazz = ProdutoFinalidadeDescricaoModel.class, fieldName = "dataAlteracao")
	private DateFilter filtroDataAletracao;

	@Inject
	@FilterInjected
	@Filter(columnName = "FinalidadeDescricaoProduto", label = "label.cadastroFinalidadeDescricao.descricao", entityClazz = ProdutoFinalidadeDescricaoModel.class, fieldName = "finalidadeDescricaoProduto")
	private StringFilter filtroFinalidadeDescricaoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "NumeroMaximoCaracteres", label = "label.cadastroFinalidadeDescricao.nMaximoCaracteres", entityClazz = ProdutoFinalidadeDescricaoModel.class, fieldName = "numeroMaximoCaracteres")
	private LongFilter filtroQuantidadeMaxima;

	@Inject
	@FilterInjected
	@Filter(columnName = "NumeroMinimoCaracteres", label = "label.cadastroFinalidadeDescricao.nMinimoCaracteres", entityClazz = ProdutoFinalidadeDescricaoModel.class, fieldName = "numeroMinimoCaracteres")
	private LongFilter filtroQuantidadeMinima;
}