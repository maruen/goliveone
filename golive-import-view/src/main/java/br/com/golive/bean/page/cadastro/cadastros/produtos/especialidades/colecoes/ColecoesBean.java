package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades.colecoes;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.generics.CadastroProdutoClassificacao;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBean;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericFilterBean;
import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.service.ColecoesService;

@ManagedBean
@ViewScoped
@Label(name = "label.cadastroColecoes")
public class ColecoesBean extends CadastroGenericBean<ColecoesModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	private CadastroProdutoClassificacao componentCadastroProdutoClassificacao;

	@Inject
	private ColecoesProdutoFilter filtros;

	@Inject
	private Logger logger;

	@EJB
	private ColecoesService colecoesService;

	@Getter
	private final boolean especificidades = false;

	@Override
	@PostConstruct
	public void init() {
		super.init(colecoesService.obterLista("grupoProdutoSelected", "departamentoSelected", "subGrupoProdutoSelected"));
		componentCadastroProdutoClassificacao.setDelegate(this);
	}

	@Override
	public void validarComponent() {
		if (!fluxo.equals(getFluxoEdicao())) {
			validarLista(componentCadastroProdutoClassificacao.getGrupos(), componentCadastroProdutoClassificacao.getSubGrupos());
			if (verificarLista(componentCadastroProdutoClassificacao.getGrupos(), registro.getGrupoProdutoSelected())) {
				registro.setGrupoProdutoSelected(null);
				registro.setSubGrupoProdutoSelected(null);
			}
			if (verificarLista(componentCadastroProdutoClassificacao.getSubGrupos(), registro.getSubGrupoProdutoSelected())) {
				registro.setSubGrupoProdutoSelected(null);
			}
		}
	}

	@Override
	public void editarRegistro() {
		super.editarRegistro();
		if (registro != null) {
			componentCadastroProdutoClassificacao.carregarGrupoProdutoPorDepartamento(registro.getDepartamentoSelected());
			componentCadastroProdutoClassificacao.carregarSubGrupoProdutoPorGrupo(registro.getGrupoProdutoSelected());
		}
	}

	@Override
	public void incluir() {
		super.incluir();
		registro = new ColecoesModel();
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

	@Override
	public void serviceRefresh(final ColecoesModel model) {
		colecoesService.refresh(model);

	}

	@Override
	public CadastroGenericFilterBean<ColecoesModel> getFiltros() {
		return filtros;
	}

	public CadastroProdutoClassificacao getComponentCadastroProdutoClassificacao() {
		return componentCadastroProdutoClassificacao;
	}

	public void setComponentCadastroProdutoClassificacao(final CadastroProdutoClassificacao componentCadastroProdutoClassificacao) {
		this.componentCadastroProdutoClassificacao = componentCadastroProdutoClassificacao;
	}

}