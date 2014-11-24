package br.com.golive.bean.page.cadastro.cadastros.produtos.classificacao.grupoproduto;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;
import lombok.Setter;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBean;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.service.DepartamentoService;
import br.com.golive.service.GrupoProdutoService;

@ManagedBean
@ViewScoped
@Label(name = "label.cadastroGrupoProdutos")
public class GrupoProdutosBean extends CadastroGenericBean<GrupoProdutosModel> {

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
	private DepartamentoService departamentoService;

	@EJB
	private GrupoProdutoService grupoProdutoService;

	@Getter
	@Setter
	private List<DepartamentoModel> departamentos;

	@Getter
	@Setter
	private List<DepartamentoModel> departamentosFiltrados;

	@Override
	@PostConstruct
	public void init() {
		super.init(grupoProdutoService.obterLista());
	}

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
		registro = new GrupoProdutosModel();
		obterDependencias();
	}

	private void obterDependencias() {
		departamentos = departamentoService.obterLista();
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
		if (registro == null) {
			ret = false;
		}
		if ((registro.getGrupoDeProduto() == null) || (registro.getGrupoDeProduto().isEmpty())) {
			ret = false;
		}
		if (registro.getDepartamentoModel() == null) {
			ret = false;
		}
		if (!ret) {
			preencherTodosCamposMessage();
		}

		return ret;
	}

	@Override
	public void serviceSave(final GrupoProdutosModel registro) {
		grupoProdutoService.salvar(registro);
	}

	@Override
	public void serviceUpdate(final GrupoProdutosModel registro) {
		grupoProdutoService.atualizar(registro);
	}

	@Override
	public void serviceRemove(final GrupoProdutosModel registro) {
		grupoProdutoService.remover(registro);
	}

	@Override
	public void serviceRefresh(final GrupoProdutosModel model) {
		grupoProdutoService.refresh(model);
	}

}