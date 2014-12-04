package br.com.golive.bean.page.cadastro.cadastros.produtos.tipoProduto;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;
import lombok.Setter;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.bean.generics.parent.GenericFilterBean;
import br.com.golive.entity.tipoproduto.model.TipoProdutoModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.LongFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;

@ManagedBean
@ViewScoped
public class TipoProdutoFilter extends GenericFilterBean<TipoProdutoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	@Setter
	private Logger logger;

	@Inject
	@FilterInjected
	@Filter(columnName = "id", label = "label.id", entityClazz = TipoProdutoModel.class, fieldName = "id")
	private LongFilter filtroId;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", label = "label.dataInclusao", entityClazz = TipoProdutoModel.class, fieldName = "dataInclusao")
	private DateFilter filtroDataInclusao;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", label = "label.dataAlteracao", entityClazz = TipoProdutoModel.class, fieldName = "dataAlteracao")
	private DateFilter filtroDataAlteracao;

	@Inject
	@FilterInjected
	@Filter(columnName = "TipoProduto", label = "label.tipoDeProduto", entityClazz = TipoProdutoModel.class, fieldName = "tipoProduto")
	private StringFilter filtroTipoProduto;

}
