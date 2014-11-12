package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades.unidade;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.annotation.EntityClass;
import br.com.golive.annotation.Filter;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericFilterBean;
import br.com.golive.entity.unidade.model.UnidadeModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.NumberFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;

@ManagedBean
@ViewScoped
public class UnidadeFilter extends CadastroGenericFilterBean<UnidadeModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;

	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id")
	@EntityClass(classe = UnidadeModel.class)
	private NumberFilter filtroId;

	@Inject
	@FilterInjected
	@Filter(name = "Unidade", label = "label.cadastroEmpresa.codigo")
	@EntityClass(classe = UnidadeModel.class)
	private StringFilter filtroCodigo;

	@Inject
	@FilterInjected
	@Filter(name = "Abreviacao", label = "label.descricao")
	@EntityClass(classe = UnidadeModel.class)
	private StringFilter descricao;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao")
	@EntityClass(classe = UnidadeModel.class)
	private DateFilter filtroDataInclusao;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao")
	@EntityClass(classe = UnidadeModel.class)
	private DateFilter filtroDataAlteracao;

	@Override
	protected Logger getLogger() {
		return logger;
	}

	public NumberFilter getFiltroId() {
		return filtroId;
	}

	public void setFiltroId(final NumberFilter filtroId) {
		this.filtroId = filtroId;
	}

	public StringFilter getFiltroCodigo() {
		return filtroCodigo;
	}

	public void setFiltroCodigo(final StringFilter filtroCodigo) {
		this.filtroCodigo = filtroCodigo;
	}

	public StringFilter getDescricao() {
		return descricao;
	}

	public void setDescricao(final StringFilter descricao) {
		this.descricao = descricao;
	}

	public DateFilter getFiltroDataInclusao() {
		return filtroDataInclusao;
	}

	public void setFiltroDataInclusao(final DateFilter filtroDataInclusao) {
		this.filtroDataInclusao = filtroDataInclusao;
	}

	public DateFilter getFiltroDataAlteracao() {
		return filtroDataAlteracao;
	}

	public void setFiltroDataAlteracao(final DateFilter filtroDataAlteracao) {
		this.filtroDataAlteracao = filtroDataAlteracao;
	}

	public void setLogger(final Logger logger) {
		this.logger = logger;
	}

}