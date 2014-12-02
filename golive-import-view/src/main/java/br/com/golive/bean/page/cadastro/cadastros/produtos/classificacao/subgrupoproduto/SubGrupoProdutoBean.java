package br.com.golive.bean.page.cadastro.cadastros.produtos.classificacao.subgrupoproduto;

import java.util.List;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;
import lombok.Setter;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBeanLazy;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.service.DepartamentoService;
import br.com.golive.service.GrupoProdutoService;
import br.com.golive.service.SubGrupoProdutoService;

@ManagedBean
@ViewScoped
@Label(name = "label.subgrupoDeProdutos")
public class SubGrupoProdutoBean extends CadastroGenericBeanLazy<SubGrupoProdutoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	@Setter
	private Logger logger;

	@Inject
	@Getter
	@Setter
	private SubGrupoProdutoFilter filtros;

	@EJB
	@Getter
	private SubGrupoProdutoService serviceBean;

	@EJB
	private DepartamentoService departamentoService;

	@EJB
	private GrupoProdutoService grupoProdutoService;

	@Getter
	@Setter
	private List<DepartamentoModel> departamentos;

	@Getter
	@Setter
	private List<GrupoProdutosModel> grupoProdutoList;

	@Override
	public void incluir() {
		super.incluir();
		carregarDepartamentos();
	}

	@Override
	public void editarRegistro() {
		super.editarRegistro();
		if (registro != null) {
			carregarDepartamentos();
			carregarGruposProduto();
		}
	}

	private void carregarGruposProduto() {
		grupoProdutoList = grupoProdutoService.obterGrupoProdutoDepartamentoPorDepartamento(usuario, empresaSelecionada, registro.getDepartamentoSelected());
		if (grupoProdutoList.isEmpty()) {
			listaVaziaMessage("msg.lista.grupoproduto.vazia");
			registro.setGrupoProdutoSelected(null);
		}
	}

	private void carregarDepartamentos() {
		departamentos = departamentoService.obterLista(usuario, empresaSelecionada);
		if (departamentos.isEmpty()) {
			listaVaziaMessage("msg.lista.departamento.vazia");
		}
	}

	@Override
	public boolean validarCampos() {
		boolean ret = true;
		if (registro == null) {
			ret = false;
		}
		if ((registro.getSubGrupoProduto() == null) || (registro.getSubGrupoProduto().isEmpty())) {
			ret = false;
		}
		if (registro.getDepartamentoSelected() == null) {
			ret = false;
		}
		if (registro.getGrupoProdutoSelected() == null) {
			ret = false;
		}

		if (!ret) {
			preencherTodosCamposMessage();
		}
		return ret;
	}

	public void carregarGrupoProdutoPorDepartamento() {
		carregarGruposProduto();
		boolean contem = false;
		for (final GrupoProdutosModel grupo : grupoProdutoList) {
			if (!contem) {
				if (registro.getGrupoProdutoSelected() != null) {
					if (grupo.getId().equals(registro.getGrupoProdutoSelected().getId())) {
						contem = true;
					}
				}
			}
		}
		if (!contem) {
			registro.setGrupoProdutoSelected(null);
		}
	}

}