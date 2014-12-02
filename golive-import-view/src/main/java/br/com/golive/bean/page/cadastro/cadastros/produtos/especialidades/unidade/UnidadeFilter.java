package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades.unidade;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;
import lombok.Setter;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.bean.generics.parent.GenericFilterBean;
import br.com.golive.entity.unidade.model.UnidadeModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.LongFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;

@ManagedBean
@ViewScoped
public class UnidadeFilter extends GenericFilterBean<UnidadeModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	@Setter
	private Logger logger;

	@Inject
	@FilterInjected
	@Filter(columnName = "id", label = "label.id", entityClazz = UnidadeModel.class, fieldName = "id")
	private LongFilter filtroId;

	@Inject
	@FilterInjected
	@Filter(columnName = "Unidade", label = "label.descricao", entityClazz = UnidadeModel.class, fieldName = "unidade")
	private StringFilter filtroDescricao;

	@Inject
	@FilterInjected
	@Filter(columnName = "Abreviacao", label = "label.cadastroEmpresa.codigo", entityClazz = UnidadeModel.class, fieldName = "abreviacao")
	private StringFilter filtroCodigo;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", label = "label.dataInclusao", entityClazz = UnidadeModel.class, fieldName = "dataInclusao")
	private DateFilter filtroDataInclusao;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", label = "label.dataAlteracao", entityClazz = UnidadeModel.class, fieldName = "dataAlteracao")
	private DateFilter filtroDataAlteracao;

}