package br.com.golive.bean.page.cadastro.cadastros.produtos.classificacao.grupoproduto.dependencias;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import br.com.golive.annotation.DialogTable;
import br.com.golive.bean.component.GoliveDataTable;
import br.com.golive.bean.generics.parent.DependencyGenericBean;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;

@ManagedBean
@ViewScoped
public class GrupoProdutosBeanDependency extends DependencyGenericBean<GrupoProdutosModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@DialogTable(fieldName = "departamentoModel",
			joinTableName = "tbGrupoProduto_tbDepartamentoProduto")
	private GoliveDataTable<DepartamentoModel> departamentos;
}
