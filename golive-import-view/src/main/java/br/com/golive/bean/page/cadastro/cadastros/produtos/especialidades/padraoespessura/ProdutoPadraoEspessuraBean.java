package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades.padraoespessura;

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
import br.com.golive.bean.generics.fragment.CadastroProdutoClassificacao;
import br.com.golive.bean.generics.fragment.CadastroProdutoEspecificidade;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBeanLazy;
import br.com.golive.entity.padraoespessura.model.ProdutoPadraoEspessuraModel;
import br.com.golive.entity.unidade.model.UnidadeModel;
import br.com.golive.service.ProdutoPadraoEspessuraService;
import br.com.golive.service.UnidadeService;
import br.com.golive.utils.JSFUtils;
import br.com.golive.utils.Utils;

@Label(name = "label.cadastroPadroesEspessura")
@ManagedBean
@ViewScoped
public class ProdutoPadraoEspessuraBean extends CadastroGenericBeanLazy<ProdutoPadraoEspessuraModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;

	@Inject
	@Getter
	@Setter
	private ProdutoPadraoEspessuraFilter filtros;

	@Inject
	@Getter
	@Setter
	private CadastroProdutoClassificacao componentCadastroProdutoClassificacao;

	@Inject
	@Getter
	@Setter
	private CadastroProdutoEspecificidade componentCadastroProdutoEspecificidade;

	@EJB
	@Getter
	private ProdutoPadraoEspessuraService serviceBean;

	@EJB
	private UnidadeService unidadeService;

	@Getter
	@Setter
	private List<UnidadeModel> unidades;

	@Override
	@PostConstruct
	public void init() {
		super.init();
		componentCadastroProdutoClassificacao.setDelegate(this);
		componentCadastroProdutoEspecificidade.setDelegate(this);
	}

	private void obterUnidades() {
		unidades = unidadeService.obterLista(usuario, empresaSelecionada);
	}

	@Override
	public void incluir() {
		super.incluir();
		obterUnidades();
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
		boolean ret = Utils.validarCamposNulos(registro, registro.getColecaoSelected(), registro.getEspessura(), registro.getDepartamentoSelected(), registro.getGrupoProdutoSelected(), registro.getSubGrupoProdutoSelected(), registro.getCorProdutoSelected(), registro.getEspessuraDescricao(), registro.getUnidadeSelected());
		if (!ret) {
			preencherTodosCamposMessage();
		}
		if (getRegistro().getEspessura() > new Double(999.999)) {
			ret = false;
			JSFUtils.warnMessage(usuario.getLabels().getField("title.msg.valor.invalido"), usuario.getLabels().getField("msg.unidade.tamanho"));
		}
		return ret;
	}

}