package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades.colecoes;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;
import lombok.Setter;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.generics.CadastroProdutoClassificacao;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBean;
import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.service.ColecoesService;
import br.com.golive.utils.JSFUtils;

@ManagedBean
@ViewScoped
@Label(name = "label.cadastroColecoes")
public class ColecoesBean extends CadastroGenericBean<ColecoesModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	@Setter
	private CadastroProdutoClassificacao componentCadastroProdutoClassificacao;

	@Inject
	@Getter
	@Setter
	private ColecoesProdutoFilter filtros;

	@Inject
	@Getter
	@Setter
	private Logger logger;

	@EJB
	private ColecoesService colecoesService;

	@Override
	@PostConstruct
	public void init() {
		super.init(colecoesService.obterLista());
		componentCadastroProdutoClassificacao.setDelegate(this);
	}

	@Override
	public void validarComponent() {
		validando();
	}

	private void validando() {
		validarLista(componentCadastroProdutoClassificacao.getGrupos(), componentCadastroProdutoClassificacao.getSubGrupos());
		if (verificarLista(componentCadastroProdutoClassificacao.getGrupos(), registro.getGrupoProdutoSelected())) {
			registro.setGrupoProdutoSelected(null);
			registro.setSubGrupoProdutoSelected(null);
		} else if (verificarLista(componentCadastroProdutoClassificacao.getSubGrupos(), registro.getSubGrupoProdutoSelected())) {
			registro.setSubGrupoProdutoSelected(null);
		}
	}

	@Override
	public void editarRegistro() {
		super.editarRegistro();
		if (registro != null) {
			componentCadastroProdutoClassificacao.carregarGrupoProdutoPorDepartamento(registro.getDepartamentoSelected(), false);
			componentCadastroProdutoClassificacao.carregarSubGrupoProdutoPorGrupo(registro.getGrupoProdutoSelected(), false);
			serviceRefresh(registro);
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
		colecoesService.atualizar(registro);
	}

	@Override
	public void serviceRemove(final ColecoesModel registro) {
		colecoesService.remover(registro);
	}

	@Override
	public void serviceRefresh(final ColecoesModel model) {
		colecoesService.refresh(model);

	}

}