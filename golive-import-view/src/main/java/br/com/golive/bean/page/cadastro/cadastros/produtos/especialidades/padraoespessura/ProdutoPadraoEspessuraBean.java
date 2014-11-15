package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades.padraoespessura;

import java.util.List;

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
import br.com.golive.entity.padraoespessura.model.ProdutoPadraoEspessuraModel;
import br.com.golive.entity.unidade.model.UnidadeModel;
import br.com.golive.service.ProdutoPadraoEspessuraService;
import br.com.golive.service.UnidadeService;
import br.com.golive.utils.JSFUtils;
import br.com.golive.utils.Utils;

@Label(name = "label.cadastroPadroesEspessura")
@ManagedBean
@ViewScoped
public class ProdutoPadraoEspessuraBean extends CadastroGenericBean<ProdutoPadraoEspessuraModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;

	@Inject
	private ProdutoPadraoEspessuraFilter filtros;

	@Inject
	private CadastroProdutoClassificacao componentCadastroProdutoClassificacao;

	@Inject
	private CadastroProdutoEspecificidade componentCadastroProdutoEspecificidade;

	@EJB
	private ProdutoPadraoEspessuraService produtoPadraoEspessuraService;

	@EJB
	private UnidadeService unidadeService;

	private List<UnidadeModel> unidades;

	@Override
	@PostConstruct
	public void init() {
		super.init(produtoPadraoEspessuraService.obterLista());
		componentCadastroProdutoClassificacao.setDelegate(this);
		componentCadastroProdutoEspecificidade.setDelegate(this);
		obterUnidades();
	}

	private void obterUnidades() {
		unidades = unidadeService.obterLista();
	}

	@Override
	public void incluir() {
		super.incluir();
		registro = new ProdutoPadraoEspessuraModel();
	}

	@Override
	public void editarRegistro() {
		super.editarRegistro();
		if (registro != null) {
			obterUnidades();
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

	@Override
	public Logger getLogger() {
		return logger;
	}

	@Override
	public boolean validarCampos() {
		boolean ret = Utils.validarCamposNulos(registro, registro.getColecaoSelected(), registro.getEspessura(), registro.getDepartamentoSelected(), registro.getGrupoProdutoSelected(), registro.getSubGrupoProdutoSelected(), registro.getCorProdutoSelected(), registro.getEspessuraDescricao());
		if (!ret) {
			preencherTodosCamposMessage();
		}
		if (getRegistro().getEspessura() > new Double(999.999)) {
			ret = false;
			JSFUtils.warnMessage(usuario.getLabels().getField("title.msg.valor.invalido"), usuario.getLabels().getField("msg.unidade.tamanho"));
		}
		return ret;
	}

	@Override
	public void serviceSave(final ProdutoPadraoEspessuraModel registro) {
		produtoPadraoEspessuraService.salvar(registro);
	}

	@Override
	public void serviceUpdate(final ProdutoPadraoEspessuraModel registro) {
		produtoPadraoEspessuraService.atualizar(registro);
	}

	@Override
	public void serviceRemove(final ProdutoPadraoEspessuraModel registro) {
		produtoPadraoEspessuraService.remover(registro);
	}

	@Override
	public void serviceRefresh(final ProdutoPadraoEspessuraModel registro) {
		produtoPadraoEspessuraService.refresh(registro);
	}

	@Override
	public CadastroGenericFilterBean<ProdutoPadraoEspessuraModel> getFiltros() {
		return filtros;
	}

	public CadastroProdutoClassificacao getComponentCadastroProdutoClassificacao() {
		return componentCadastroProdutoClassificacao;
	}

	public void setComponentCadastroProdutoClassificacao(final CadastroProdutoClassificacao componentCadastroProdutoClassificacao) {
		this.componentCadastroProdutoClassificacao = componentCadastroProdutoClassificacao;
	}

	public CadastroProdutoEspecificidade getComponentCadastroProdutoEspecificidade() {
		return componentCadastroProdutoEspecificidade;
	}

	public void setComponentCadastroProdutoEspecificidade(final CadastroProdutoEspecificidade componentCadastroProdutoEspecificidade) {
		this.componentCadastroProdutoEspecificidade = componentCadastroProdutoEspecificidade;
	}

	public List<UnidadeModel> getUnidades() {
		return unidades;
	}

	public void setUnidades(final List<UnidadeModel> unidades) {
		this.unidades = unidades;
	}

}