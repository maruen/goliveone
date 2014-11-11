package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades.colecoes;

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
import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.service.ColecoesService;
import br.com.golive.service.DepartamentoService;
import br.com.golive.service.GrupoProdutoService;
import br.com.golive.service.SubGrupoProdutoService;

@ManagedBean
@ViewScoped
@Label(name = "label.cadastroColecoes")
public class ColecoesBean extends CadastroGenericBean<ColecoesModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;

	@Inject
	private ColecoesProdutoFilter filtros;

	private List<DepartamentoModel> departamentos;

	private List<GrupoProdutosModel> grupos;

	private List<SubGrupoProdutoModel> subGrupos;

	@EJB
	private DepartamentoService departamentoService;

	@EJB
	private GrupoProdutoService grupoProdutoService;

	@EJB
	private SubGrupoProdutoService subGrupoProdutoService;

	@EJB
	private ColecoesService colecoesService;

	@Override
	@PostConstruct
	public void init() {
		super.init(colecoesService.obterLista("grupoProdutoSelected", "departamentoSelected", "subGrupoProdutoSelected"), getConfiguracaoesByClasses(DepartamentoModel.class, GrupoProdutosModel.class, SubGrupoProdutoModel.class, ColecoesModel.class));
	}

	@Override
	public void editarRegistro() {
		super.editarRegistro();
		if (registro != null) {
			obterDepartamentos();
			obterGruposProduto();
			obterSubGrupos();
		}
	}

	private void obterGruposProduto() {
		grupos = grupoProdutoService.obterGrupoProdutoDepartamentoPorDepartamento(registro.getDepartamentoSelected());
		if (grupos.isEmpty()) {
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
		subGrupos = subGrupoProdutoService.obterSubGrupoProdutoPorGrupo(registro.getGrupoProdutoSelected());
		if (subGrupos.isEmpty()) {
			listaVaziaMessage("msg.lista.subgrupo.vazia");
		}
	}

	@Override
	public void incluir() {
		super.incluir();
		registro = new ColecoesModel();
		obterDepartamentos();
	}

	@Override
	public boolean validarCampos() {
		boolean ret = true;
		if (registro == null) {
			ret = false;
		}

		if ((registro.getColecao() == null) || (registro.getColecao().isEmpty())) {
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
		if (!ret) {
			preencherTodosCamposMessage();
		}

		return ret;
	}

	public void carregarGrupoProdutoPorDepartamento() {
		obterGruposProduto();
		if ((registro.getGrupoProdutoSelected() != null) && !grupos.contains(registro.getGrupoProdutoSelected())) {
			registro.setGrupoProdutoSelected(null);
			registro.setSubGrupoProdutoSelected(null);
			subGrupos = null;
		}
	}

	public void carregarSubGrupoProdutoPorGrupo() {
		obterSubGrupos();
		if ((registro.getSubGrupoProdutoSelected() != null) && !subGrupos.contains(registro.getSubGrupoProdutoSelected())) {
			registro.setSubGrupoProdutoSelected(null);
		}

	}

	@Override
	public void serviceSave(final ColecoesModel registro) {
		colecoesService.salvar(registro);
	}

	@Override
	public void serviceUpdate(final ColecoesModel registro) {
		colecoesService.update(registro);
	}

	@Override
	public void serviceRemove(final ColecoesModel registro) {
		colecoesService.remover(registro);
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

	public List<GrupoProdutosModel> getGrupos() {
		return grupos;
	}

	public void setGrupos(final List<GrupoProdutosModel> grupos) {
		this.grupos = grupos;
	}

	public List<SubGrupoProdutoModel> getSubGrupos() {
		return subGrupos;
	}

	public void setSubGrupos(final List<SubGrupoProdutoModel> subGrupos) {
		this.subGrupos = subGrupos;
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

	public ColecoesService getColecoesService() {
		return colecoesService;
	}

	public void setColecoesService(final ColecoesService colecoesService) {
		this.colecoesService = colecoesService;
	}

	@Override
	public void serviceRefresh(final ColecoesModel model) {
		colecoesService.refresh(model);

	}

	@Override
	public CadastroGenericFilterBean<ColecoesModel> getFiltros() {
		return filtros;
	}

}