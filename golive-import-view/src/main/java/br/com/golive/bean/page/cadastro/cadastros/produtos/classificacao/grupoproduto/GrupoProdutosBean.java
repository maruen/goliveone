package br.com.golive.bean.page.cadastro.cadastros.produtos.classificacao.grupoproduto;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;
import lombok.Setter;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.cadastros.produtos.classificacao.grupoproduto.filter.GrupoProdutoFilter;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBeanLazy;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.service.DepartamentoService;
import br.com.golive.service.GrupoProdutoService;

@ManagedBean
@ViewScoped
@Label(name = "label.cadastroGrupoProdutos")
public class GrupoProdutosBean extends CadastroGenericBeanLazy<GrupoProdutosModel> {

	private static final long serialVersionUID = 7638327964310698925L;

	@Inject
	@Getter
	@Setter
	private Logger logger;

	@Inject
	@Getter
	@Setter
	private GrupoProdutoFilter filtros;

	@EJB
	@Getter
	private GrupoProdutoService serviceBean;

	@EJB
	private DepartamentoService departamentoService;

	@Getter
	@Setter
	private List<DepartamentoModel> departamentos;

	@Getter
	@Setter
	private List<DepartamentoModel> departamentosFiltrados;

	@Override
	public void editarRegistro() {
		super.editarRegistro();
		if (registro != null) {
			obterDependencias();
		}
	}

	@Override
	public void incluir() {
		super.incluir();
		obterDependencias();
	}

	private void obterDependencias() {
		departamentos = departamentoService.obterLista(usuario, empresaSelecionada);
		if (departamentos.isEmpty()) {
			listaVaziaMessage("msg.lista.departamento.vazia");
		} else {
			departamentosFiltrados = new ArrayList<DepartamentoModel>();
			departamentosFiltrados.addAll(departamentos);
		}
	}

	@Override
	public boolean validarCampos() {
		boolean ret = true;
		if (registro.getDepartamentoModel() == null) {
			ret = false;
		}
		if (!ret) {
			preencherTodosCamposMessage();
		}

		return ret;
	}

}