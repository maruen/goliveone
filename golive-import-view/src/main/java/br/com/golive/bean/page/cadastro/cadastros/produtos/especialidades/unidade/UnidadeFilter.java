package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades.unidade;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;
import lombok.Setter;

import org.slf4j.Logger;

import br.com.golive.annotation.EntityClass;
import br.com.golive.annotation.Filter;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericFilterBean;
import br.com.golive.entity.unidade.model.UnidadeModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.LongFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;

@ManagedBean
@ViewScoped
public class UnidadeFilter extends CadastroGenericFilterBean<UnidadeModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	@Setter
	private Logger logger;

	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id")
	@EntityClass(classe = UnidadeModel.class)
	private LongFilter filtroId;

	@Inject
	@FilterInjected
	@Filter(name = "Unidade", label = "label.descricao")
	@EntityClass(classe = UnidadeModel.class)
	private StringFilter filtroDescricao;

	@Inject
	@FilterInjected
	@Filter(name = "Abreviacao", label = "label.cadastroEmpresa.codigo")
	@EntityClass(classe = UnidadeModel.class)
	private StringFilter filtroCodigo;

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

}