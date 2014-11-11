package br.com.golive.bean.page.cadastro.cadastros.produtos.classificacao.grupoproduto;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBean;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericFilterBean;
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
	private Logger logger;

	@Inject
	private GrupoProdutoFilter filtros;

	@EJB
	private DepartamentoService departamentoService;

	@EJB
	private GrupoProdutoService grupoProdutoService;

	private List<DepartamentoModel> departamentos;

	@Override
	@PostConstruct
	public void init() {
		super.init(grupoProdutoService.obterGrupoProdutos());
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
		departamentos = departamentoService.listarTodos();
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
		grupoProdutoService.update(registro);
	}

	@Override
	public void serviceRemove(final GrupoProdutosModel registro) {
		grupoProdutoService.delete(registro);
	}

	public List<DepartamentoModel> getDepartamentos() {
		return departamentos;
	}

	public void setDepartamentos(final List<DepartamentoModel> departamentos) {
		this.departamentos = departamentos;
	}

	@Override
	public void serviceRefresh(final GrupoProdutosModel model) {
		grupoProdutoService.refresh(model);
	}

	@Override
	public CadastroGenericFilterBean<GrupoProdutosModel> getFiltros() {
		return filtros;
	}

	@Override
	public Logger getLogger() {
		return logger;
	}
}