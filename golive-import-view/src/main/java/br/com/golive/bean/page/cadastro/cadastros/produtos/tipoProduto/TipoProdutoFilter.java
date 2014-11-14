package br.com.golive.bean.page.cadastro.cadastros.produtos.tipoProduto;

import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.annotation.EntityClass;
import br.com.golive.annotation.Filter;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericFilterBean;
import br.com.golive.entity.tipoproduto.model.TipoProdutoModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.NumberFilter;
import br.com.golive.qualifier.FilterInjected;

public class TipoProdutoFilter extends CadastroGenericFilterBean<TipoProdutoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;
	
	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id")
	@EntityClass(classe = TipoProdutoModel.class)
	private NumberFilter filtroId;

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
	private NumberFilter filtroTipoProduto;

	@Override
	protected Logger getLogger() {
		return logger;
	}

	public NumberFilter getFiltroId() {
		return filtroId;
	}

	public void setFiltroId(NumberFilter filtroId) {
		this.filtroId = filtroId;
	}

	public DateFilter getFiltroDataInclusao() {
		return filtroDataInclusao;
	}

	public void setFiltroDataInclusao(DateFilter filtroDataInclusao) {
		this.filtroDataInclusao = filtroDataInclusao;
	}

	public DateFilter getFiltroDataAlteracao() {
		return filtroDataAlteracao;
	}

	public void setFiltroDataAlteracao(DateFilter filtroDataAlteracao) {
		this.filtroDataAlteracao = filtroDataAlteracao;
	}

	public NumberFilter getFiltroTipoProduto() {
		return filtroTipoProduto;
	}

	public void setFiltroTipoProduto(NumberFilter filtroTipoProduto) {
		this.filtroTipoProduto = filtroTipoProduto;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}
}
