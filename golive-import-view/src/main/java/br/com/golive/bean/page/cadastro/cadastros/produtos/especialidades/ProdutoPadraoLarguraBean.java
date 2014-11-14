package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.generics.CadastroProdutoClassificacao;
import br.com.golive.bean.generics.CadastroProdutoEspecificidade;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBean;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericFilterBean;
import br.com.golive.entity.padraolargura.model.ProdutoPadraoLarguraModel;
import br.com.golive.service.ProdutoPadraoLarguraService;
import br.com.golive.utils.JSFUtils;
import br.com.golive.utils.Utils;

@Label(name = "label.cadastroPadroesLargura")
@ManagedBean
@ViewScoped
public class ProdutoPadraoLarguraBean extends CadastroGenericBean<ProdutoPadraoLarguraModel>{

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;
	
	@Inject
	private ProdutoPadraoLarguraFilter filtros;
	
	@Inject
	private CadastroProdutoClassificacao componentCadastroProdutoClassificacao;

	@Inject
	private CadastroProdutoEspecificidade componentCadastroProdutoEspecificidade;

	@EJB
	private ProdutoPadraoLarguraService produtoPadraoLarguraService;
	
	@Override
	@PostConstruct
	public void init() {
		super.init(produtoPadraoLarguraService.obterLista());
		componentCadastroProdutoClassificacao.setDelegate(this);
		componentCadastroProdutoEspecificidade.setDelegate(this);
	}
	
	@Override
	public Logger getLogger() {
		return logger;
	}

	@Override
	public boolean validarCampos() {
		boolean ret = Utils.validarCamposNulos(registro, registro.getColecaoSelected(), registro.getLargura(), registro.getDepartamentoSelected(), registro.getGrupoProdutoSelected(), registro.getSubGrupoProdutoSelected(), registro.getCorProdutoSelected(), registro.getLarguraDescricao());
		if (!ret) {
			preencherTodosCamposMessage();
		}
		if (getRegistro().getLargura() > new Double(999.999)) {
			ret = false;
			JSFUtils.warnMessage(usuario.getLabels().getField("title.msg.valor.invalido"), usuario.getLabels().getField("msg.unidade.tamanho"));
		}
		return ret;
	}

	@Override
	public void serviceSave(ProdutoPadraoLarguraModel registro) {
		produtoPadraoLarguraService.salvar(registro);
	}

	@Override
	public void serviceUpdate(ProdutoPadraoLarguraModel registro) {
		produtoPadraoLarguraService.atualizar(registro);
	}

	@Override
	public void serviceRemove(ProdutoPadraoLarguraModel registro) {
		produtoPadraoLarguraService.remover(registro);
	}

	@Override
	public void serviceRefresh(ProdutoPadraoLarguraModel registro) {
		produtoPadraoLarguraService.refresh(registro);
	}

	@Override
	public CadastroGenericFilterBean<ProdutoPadraoLarguraModel> getFiltros() {
		return filtros;
	}

	public CadastroProdutoClassificacao getComponentCadastroProdutoClassificacao() {
		return componentCadastroProdutoClassificacao;
	}

	public void setComponentCadastroProdutoClassificacao(
			CadastroProdutoClassificacao componentCadastroProdutoClassificacao) {
		this.componentCadastroProdutoClassificacao = componentCadastroProdutoClassificacao;
	}

	public CadastroProdutoEspecificidade getComponentCadastroProdutoEspecificidade() {
		return componentCadastroProdutoEspecificidade;
	}

	public void setComponentCadastroProdutoEspecificidade(
			CadastroProdutoEspecificidade componentCadastroProdutoEspecificidade) {
		this.componentCadastroProdutoEspecificidade = componentCadastroProdutoEspecificidade;
	}

	@Override
	public void incluir() {
		super.incluir();
		registro = new ProdutoPadraoLarguraModel();
	}

	@Override
	public void editarRegistro() {
		super.editarRegistro();
		if (registro != null) {
			componentCadastroProdutoEspecificidade.carregarCoresPorColecoes(registro.getColecaoSelected(), false);
			componentCadastroProdutoEspecificidade.carregarColecoesPorSubGrupo(registro.getSubGrupoProdutoSelected(), false);
			componentCadastroProdutoClassificacao.carregarGrupoProdutoPorDepartamento(registro.getDepartamentoSelected(), false);
			componentCadastroProdutoClassificacao.carregarSubGrupoProdutoPorGrupo(registro.getGrupoProdutoSelected(), false);
		}
	}

	@Override
	public void validarComponent() {
		validarLista(componentCadastroProdutoClassificacao.getGrupos(), componentCadastroProdutoClassificacao.getSubGrupos(), componentCadastroProdutoEspecificidade.getColecoes(), componentCadastroProdutoEspecificidade.getCores());
		if (verificarLista(componentCadastroProdutoClassificacao.getGrupos(), registro.getGrupoProdutoSelected())) {
			registro.setGrupoProdutoSelected(null);
			registro.setSubGrupoProdutoSelected(null);
			registro.setColecaoSelected(null);
			registro.setCorProdutoSelected(null);
		}
		if (verificarLista(componentCadastroProdutoClassificacao.getSubGrupos(), registro.getSubGrupoProdutoSelected())) {
			registro.setSubGrupoProdutoSelected(null);
			registro.setColecaoSelected(null);
			registro.setCorProdutoSelected(null);
		}
		if (verificarLista(componentCadastroProdutoEspecificidade.getColecoes(), registro.getColecaoSelected())) {
			registro.setColecaoSelected(null);
			registro.setCorProdutoSelected(null);
		}
		if (verificarLista(componentCadastroProdutoEspecificidade.getCores(), registro.getCorProdutoSelected())) {
			registro.setCorProdutoSelected(null);
		}
		if (registro.getSubGrupoProdutoSelected() == null) {
			componentCadastroProdutoEspecificidade.setColecoes(null);
			componentCadastroProdutoEspecificidade.setCores(null);
		}
		if (registro.getColecaoSelected() == null) {
			componentCadastroProdutoEspecificidade.setCores(null);
		}
	}
}