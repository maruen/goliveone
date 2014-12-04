package br.com.golive.bean.page.cadastro.cadastros.produtos.finalidades.tipoproduto;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.bean.generics.parent.GenericFilterBean;
import br.com.golive.entity.finalidadetipo.model.ProdutoFinalidadeTipoModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.LongFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;

@ManagedBean
@ViewScoped
public class ProdutoFinalidadeTipoFilter extends GenericFilterBean<ProdutoFinalidadeTipoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	private Logger logger;

	@Inject
	@FilterInjected
	@Filter(columnName = "id", label = "label.id", entityClazz = ProdutoFinalidadeTipoModel.class, fieldName = "id")
	private LongFilter filtroId;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", label = "label.dataInclusao", entityClazz = ProdutoFinalidadeTipoModel.class, fieldName = "dataInclusao")
	private DateFilter filtroDataInclusao;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", label = "label.dataAlteracao", entityClazz = ProdutoFinalidadeTipoModel.class, fieldName = "dataAlteracao")
	private DateFilter filtroDataAlteracao;

	@Inject
	@FilterInjected
	@Filter(columnName = "FinalidadeTipoProduto", label = "label.cadastroFinalidadeTipo.finalidadeTipoProduto", entityClazz = ProdutoFinalidadeTipoModel.class, fieldName = "finalidadeTipoProduto")
	private StringFilter filtroFinalidadeTipoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "NumeroMaximoCaracteres", label = "label.cadastroFinalidadeTipo.nMaximoCaracteres", entityClazz = ProdutoFinalidadeTipoModel.class, fieldName = "numeroMaximoCaracteres")
	private LongFilter filtroQuantidadeMaxima;

	@Inject
	@FilterInjected
	@Filter(columnName = "NumeroMinimoCaracteres", label = "label.cadastroFinalidadeTipo.nMinimoCaracteres", entityClazz = ProdutoFinalidadeTipoModel.class, fieldName = "numeroMinimoCaracteres")
	private LongFilter filtroQuantidadeMinima;
}