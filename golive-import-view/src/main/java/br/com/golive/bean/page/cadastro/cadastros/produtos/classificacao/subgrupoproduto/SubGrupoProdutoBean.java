package br.com.golive.bean.page.cadastro.cadastros.produtos.classificacao.subgrupoproduto;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBean;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.service.DepartamentoService;
import br.com.golive.service.GrupoProdutoService;
import br.com.golive.service.SubGrupoProdutoService;

@ManagedBean
@ViewScoped
@Label(name = "label.subgrupoDeProdutos")
public class SubGrupoProdutoBean extends CadastroGenericBean<SubGrupoProdutoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;

	@Inject
	private SubGrupoProdutoFilter filtros;

	@EJB
	private SubGrupoProdutoService subGrupoProdutoService;
	@EJB
	private DepartamentoService departamentoService;
	@EJB
	private GrupoProdutoService grupoProdutoService;

	private List<DepartamentoModel> departamentos;

	private List<GrupoProdutosModel> grupoProdutoList;

	@Override
	@PostConstruct
	public void init() {
		super.init(subGrupoProdutoService.listarPorFiltro(), getConfiguracaoesByClasses(DepartamentoModel.class, GrupoProdutosModel.class, SubGrupoProdutoModel.class));
	}

	@Override
	public void incluir() {
		super.incluir();
		registro = new SubGrupoProdutoModel();
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
		grupoProdutoList = grupoProdutoService.obterGrupoProdutoDepartamentoPorDepartamento(registro.getDepartamentoSelected());
		if (grupoProdutoList.isEmpty()) {
			listaVaziaMessage("msg.lista.grupoproduto.vazia");
			registro.setGrupoProdutoSelected(null);
		}
	}

	private void carregarDepartamentos() {
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

	@Override
	public void serviceRefresh(final SubGrupoProdutoModel model) {
		subGrupoProdutoService.refresh(model);

	}

	@Override
	public void serviceSave(final SubGrupoProdutoModel registro) {
		subGrupoProdutoService.salvar(registro);
	}

	@Override
	public void serviceUpdate(final SubGrupoProdutoModel registro) {
		subGrupoProdutoService.alterar(registro);
	}

	@Override
	public void serviceRemove(final SubGrupoProdutoModel registro) {
		subGrupoProdutoService.excluir(registro);
	}

	@Override
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(final Logger logger) {
		this.logger = logger;
	}

	public List<DepartamentoModel> getDepartamentos() {
		return departamentos;
	}

	public void setDepartamentos(final List<DepartamentoModel> departamentos) {
		this.departamentos = departamentos;
	}

	public List<GrupoProdutosModel> getGrupoProdutoList() {
		return grupoProdutoList;
	}

	public void setGrupoProdutoList(final List<GrupoProdutosModel> grupoProdutoList) {
		this.grupoProdutoList = grupoProdutoList;
	}

	@Override
	public SubGrupoProdutoFilter getFiltros() {
		return filtros;
	}

	public void setFiltros(final SubGrupoProdutoFilter filtros) {
		this.filtros = filtros;
	}

}