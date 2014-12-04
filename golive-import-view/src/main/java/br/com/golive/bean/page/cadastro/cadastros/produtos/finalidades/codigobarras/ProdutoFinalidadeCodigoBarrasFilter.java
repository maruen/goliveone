package br.com.golive.bean.page.cadastro.cadastros.produtos.finalidades.codigobarras;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.bean.generics.parent.GenericFilterBean;
import br.com.golive.entity.finalidadecodigobarras.model.ProdutoFinalidadeCodigoBarrasModel;
import br.com.golive.entity.unidade.model.UnidadeModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.LongFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;

@ManagedBean
@ViewScoped
public class ProdutoFinalidadeCodigoBarrasFilter extends GenericFilterBean<ProdutoFinalidadeCodigoBarrasModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	private Logger logger;

	@Inject
	@FilterInjected
	@Filter(columnName = "id", label = "label.id", entityClazz = ProdutoFinalidadeCodigoBarrasModel.class, fieldName = "id")
	private LongFilter filtroId;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", label = "label.dataInclusao", entityClazz = ProdutoFinalidadeCodigoBarrasModel.class, fieldName = "dataInclusao")
	private DateFilter filtroDataInclusao;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", label = "label.dataAlteracao", entityClazz = ProdutoFinalidadeCodigoBarrasModel.class, fieldName = "dataAlteracao")
	private DateFilter filtroDataAletracao;

	@Inject
	@FilterInjected
	@Filter(columnName = "FinalidadeCodigoBarrasProduto", label = "label.cadastroFinalidadeCodigoBarras.finalidadeCodigoBarrasProduto", entityClazz = ProdutoFinalidadeCodigoBarrasModel.class, fieldName = "finalidadeCodigoBarrasProduto")
	private StringFilter filtroFinalidadeCodigoBarrasProduto;

	@Inject
	@FilterInjected
	@Filter(label = "label.id", columnName = "id", fieldName = "id", entityClazz = UnidadeModel.class, path = "unidadeSelected")
	private LongFilter filtroIdUnidade;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", fieldName = "dataInclusao", entityClazz = UnidadeModel.class, label = "label.dataInclusao", path = "unidadeSelected")
	private DateFilter filtroDataInclusaoUnidade;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", fieldName = "dataAlteracao", entityClazz = UnidadeModel.class, label = "label.dataAlteracao", path = "unidadeSelected")
	private DateFilter filtroDataAlteracaoUnidade;

	@Inject
	@FilterInjected
	@Filter(columnName = "Unidade", label = "label.cadastroPadroesEspessura.descricao", path = "unidadeSelected", fieldName = "unidade", entityClazz = UnidadeModel.class)
	private StringFilter filtroDescricaoUnidade;

	@Inject
	@FilterInjected
	@Filter(columnName = "Abreviacao", label = "label.cadastroPadroesEspessura.codUnid", path = "unidadeSelected", fieldName = "abreviacao", entityClazz = UnidadeModel.class)
	private StringFilter filtroAbreviacaoUnidade;
}
