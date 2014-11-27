package br.com.golive.bean.page.cadastro.cadastros.produtos.tipoProduto;

import javax.inject.Inject;

import lombok.Getter;
import lombok.Setter;

import org.slf4j.Logger;

import br.com.golive.annotation.EntityClass;
import br.com.golive.annotation.Filter;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericFilterBean;
import br.com.golive.entity.tipoproduto.model.TipoProdutoModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.LongFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;

public class TipoProdutoFilter extends CadastroGenericFilterBean<TipoProdutoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	@Setter
	private Logger logger;

	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id")
	@EntityClass(classe = TipoProdutoModel.class)
	private LongFilter filtroId;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao")
	@EntityClass(classe = TipoProdutoModel.class)
	private DateFilter filtroDataInclusao;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao")
	@EntityClass(classe = TipoProdutoModel.class)
	private DateFilter filtroDataAlteracao;

	@Inject
	@FilterInjected
	@Filter(name = "TipoProduto", label = "label.tipoDeProduto")
	@EntityClass(classe = TipoProdutoModel.class)
	private StringFilter filtroTipoProduto;

}
