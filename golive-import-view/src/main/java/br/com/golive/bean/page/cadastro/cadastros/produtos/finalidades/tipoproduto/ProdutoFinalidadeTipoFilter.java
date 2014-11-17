package br.com.golive.bean.page.cadastro.cadastros.produtos.finalidades.tipoproduto;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.annotation.EntityClass;
import br.com.golive.annotation.Filter;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericFilterBean;
import br.com.golive.entity.finalidadetipo.model.ProdutoFinalidadeTipoModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.LongFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;

@ManagedBean
@ViewScoped
public class ProdutoFinalidadeTipoFilter extends CadastroGenericFilterBean<ProdutoFinalidadeTipoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;

	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id")
	@EntityClass(classe = ProdutoFinalidadeTipoModel.class)
	private LongFilter filtroId;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao")
	@EntityClass(classe = ProdutoFinalidadeTipoModel.class)
	private DateFilter filtroDataInclusao;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao")
	@EntityClass(classe = ProdutoFinalidadeTipoModel.class)
	private DateFilter filtroDataAletracao;

	@Inject
	@FilterInjected
	@Filter(name = "FinalidadeTipoProduto", label = "label.cadastroFinalidadeTipo.descricao")
	@EntityClass(classe = ProdutoFinalidadeTipoModel.class)
	private StringFilter filtroDescricao;

	@Inject
	@FilterInjected
	@Filter(name = "NumeroMaximoCaracteres", label = "label.cadastroFinalidadeTipo.nMaximoCaracteres")
	@EntityClass(classe = ProdutoFinalidadeTipoModel.class)
	private LongFilter filtroQuantidadeMaxima;

	@Inject
	@FilterInjected
	@Filter(name = "NumeroMinimoCaracteres", label = "label.cadastroFinalidadeTipo.nMinimoCaracteres")
	@EntityClass(classe = ProdutoFinalidadeTipoModel.class)
	private LongFilter filtroQuantidadeMinima;

	@Override
	protected Logger getLogger() {
		return logger;
	}

	public LongFilter getFiltroId() {
		return filtroId;
	}

	public void setFiltroId(final LongFilter filtroId) {
		this.filtroId = filtroId;
	}

	public DateFilter getFiltroDataInclusao() {
		return filtroDataInclusao;
	}

	public void setFiltroDataInclusao(final DateFilter filtroDataInclusao) {
		this.filtroDataInclusao = filtroDataInclusao;
	}

	public DateFilter getFiltroDataAletracao() {
		return filtroDataAletracao;
	}

	public void setFiltroDataAletracao(final DateFilter filtroDataAletracao) {
		this.filtroDataAletracao = filtroDataAletracao;
	}

	public StringFilter getFiltroDescricao() {
		return filtroDescricao;
	}

	public void setFiltroDescricao(final StringFilter filtroDescricao) {
		this.filtroDescricao = filtroDescricao;
	}

	public LongFilter getFiltroQuantidadeMaxima() {
		return filtroQuantidadeMaxima;
	}

	public void setFiltroQuantidadeMaxima(final LongFilter filtroQuantidadeMaxima) {
		this.filtroQuantidadeMaxima = filtroQuantidadeMaxima;
	}

	public LongFilter getFiltroQuantidadeMinima() {
		return filtroQuantidadeMinima;
	}

	public void setFiltroQuantidadeMinima(final LongFilter filtroQuantidadeMinima) {
		this.filtroQuantidadeMinima = filtroQuantidadeMinima;
	}

	public void setLogger(final Logger logger) {
		this.logger = logger;
	}

}