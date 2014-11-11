package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades.cores;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Data;
import lombok.EqualsAndHashCode;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBean;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericFilterBean;
import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.especialidades.model.CorProdutoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.service.ColecoesService;
import br.com.golive.service.CorProdutoService;
import br.com.golive.service.DepartamentoService;
import br.com.golive.service.GrupoProdutoService;
import br.com.golive.service.SubGrupoProdutoService;

@ManagedBean
@ViewScoped
@Label(name = "label.cadastroCores")
@Data
@EqualsAndHashCode(callSuper = false)
public class CorProdutoBean extends CadastroGenericBean<CorProdutoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;

	@Inject
	private CorProdutoFilter filtros;

	@EJB
	private DepartamentoService departamentoService;
	@EJB
	private GrupoProdutoService grupoProdutoService;
	@EJB
	private SubGrupoProdutoService subGrupoProdutoService;
	@EJB
	private CorProdutoService corProdutoService;
	@EJB
	private ColecoesService colecaoService;

	private List<DepartamentoModel> departamentos;

	private List<GrupoProdutosModel> grupoProdutoList;

	private List<SubGrupoProdutoModel> subGrupoProdutoList;

	private List<ColecoesModel> colecoesList;

	@Override
	@PostConstruct
	public void init() {
		super.init(corProdutoService.listarPorFiltro(), getConfiguracaoesByClasses(CorProdutoModel.class, DepartamentoModel.class, SubGrupoProdutoModel.class, GrupoProdutosModel.class, ColecoesModel.class));
	}

	@Override
	public void editarRegistro() {
		super.editarRegistro();
		if (registro != null) {
			obterDepartamentos();
			obterGruposProduto();
			obterSubGrupos();
			obterColecoes();
		}
	}

	private void obterGruposProduto() {
		grupoProdutoList = grupoProdutoService.obterGrupoProdutoDepartamentoPorDepartamento(registro.getDepartamentoSelected());
		if (grupoProdutoList.isEmpty()) {
			listaVaziaMessage("msg.lista.grupoproduto.vazia");
			registro.setGrupoProdutoSelected(null);
		}
	}

	private void obterDepartamentos() {
		departamentos = departamentoService.listarTodos();
		if (departamentos.isEmpty()) {
			listaVaziaMessage("msg.lista.departamento.vazia");
		}
	}

	private void obterSubGrupos() {
		subGrupoProdutoList = subGrupoProdutoService.obterSubGrupoProdutoPorGrupo(registro.getGrupoProdutoSelected());
		if (departamentos.isEmpty()) {
			listaVaziaMessage("msg.lista.subgrupo.vazia");
			registro.setSubGrupoProdutoSelected(null);
		}
	}

	private void obterColecoes() {
		colecoesList = colecaoService.obterListaPorSubGrupo(registro.getSubGrupoProdutoSelected());
		if (colecoesList.isEmpty()) {
			listaVaziaMessage("msg.lista.colecoes.vazia");
			registro.setColecaoSelected(null);
		}
	}

	@Override
	public void incluir() {
		super.incluir();
		registro = new CorProdutoModel();
		obterDepartamentos();
	}

	public void carregarGrupoProdutoPorDepartamento() {
		obterGruposProduto();
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
			registro.setSubGrupoProdutoSelected(null);
			registro.setColecaoSelected(null);
			subGrupoProdutoList = null;
			colecoesList = null;
		}
	}

	public void carregarSubGrupoPorGrupo() {
		obterSubGrupos();
		boolean contem = false;
		for (final SubGrupoProdutoModel sub : subGrupoProdutoList) {
			if (!contem) {
				if (registro.getSubGrupoProdutoSelected() != null) {
					if (sub.getId().equals(registro.getSubGrupoProdutoSelected().getId())) {
						contem = true;
					}
				}
			}
		}
		if (!contem) {
			registro.setSubGrupoProdutoSelected(null);
			registro.setColecaoSelected(null);
			colecoesList = null;
		}
	}

	public void carregarColecoesPorSubGrupo() {
		obterColecoes();
		boolean contem = false;
		for (final ColecoesModel colecoes : colecoesList) {
			if (!contem) {
				if (registro.getColecaoSelected() != null) {
					if (colecoes.getId().equals(registro.getColecaoSelected().getId())) {
						contem = true;
					}
				}
			}
		}
		if (!contem) {
			registro.setColecaoSelected(null);
		}
	}

	@Override
	public boolean validarCampos() {
		boolean ret = true;
		if (registro == null) {
			ret = false;
		}
		if (registro.getDepartamentoSelected() == null) {
			ret = false;
		}

		if (registro.getGrupoProdutoSelected() == null) {
			ret = false;
		}

		if (registro.getSubGrupoProdutoSelected() == null) {
			ret = false;
		}
		if (registro.getColecaoSelected() == null) {
			ret = false;
		}

		if ((registro.getCorDescricao() == null) || (registro.getCorDescricao().isEmpty())) {
			ret = false;
		}

		if ((registro.getCorCodigo() == null) || (registro.getCorCodigo().isEmpty())) {
			ret = false;
		}
		if (!ret) {
			preencherTodosCamposMessage();
		}

		return ret;
	}

	@Override
	public void serviceSave(final CorProdutoModel registro) {
		corProdutoService.salvar(registro);
	}

	@Override
	public void serviceUpdate(final CorProdutoModel registro) {
		corProdutoService.alterar(registro);
	}

	@Override
	public void serviceRemove(final CorProdutoModel registro) {
		corProdutoService.excluir(registro);
	}

	@Override
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(final Logger logger) {
		this.logger = logger;
	}

	public DepartamentoService getDepartamentoService() {
		return departamentoService;
	}

	public void setDepartamentoService(final DepartamentoService departamentoService) {
		this.departamentoService = departamentoService;
	}

	public GrupoProdutoService getGrupoProdutoService() {
		return grupoProdutoService;
	}

	public void setGrupoProdutoService(final GrupoProdutoService grupoProdutoService) {
		this.grupoProdutoService = grupoProdutoService;
	}

	public SubGrupoProdutoService getSubGrupoProdutoService() {
		return subGrupoProdutoService;
	}

	public void setSubGrupoProdutoService(final SubGrupoProdutoService subGrupoProdutoService) {
		this.subGrupoProdutoService = subGrupoProdutoService;
	}

	public CorProdutoService getCorProdutoService() {
		return corProdutoService;
	}

	public void setCorProdutoService(final CorProdutoService corProdutoService) {
		this.corProdutoService = corProdutoService;
	}

	public ColecoesService getColecaoService() {
		return colecaoService;
	}

	public void setColecaoService(final ColecoesService colecaoService) {
		this.colecaoService = colecaoService;
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

	public List<SubGrupoProdutoModel> getSubGrupoProdutoList() {
		return subGrupoProdutoList;
	}

	public void setSubGrupoProdutoList(final List<SubGrupoProdutoModel> subGrupoProdutoList) {
		this.subGrupoProdutoList = subGrupoProdutoList;
	}

	public List<ColecoesModel> getColecoesList() {
		return colecoesList;
	}

	public void setColecoesList(final List<ColecoesModel> colecoesList) {
		this.colecoesList = colecoesList;
	}

	@Override
	public void serviceRefresh(final CorProdutoModel model) {
		corProdutoService.refresh(model);
	}

	@Override
	public CadastroGenericFilterBean<CorProdutoModel> getFiltros() {
		return filtros;
	}

}