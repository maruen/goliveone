package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades.cores;

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
import br.com.golive.entity.especialidades.model.CorProdutoModel;
import br.com.golive.service.CorProdutoService;

@ManagedBean
@ViewScoped
@Label(name = "label.cadastroCores")
public class CorProdutoBean extends CadastroGenericBeanLazy<CorProdutoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	@Setter
	private Logger logger;

	@Inject
	@Getter
	@Setter
	private CorProdutoFilter filtros;

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
	private CorProdutoService serviceBean;

	@Override
	@PostConstruct
	public void init() {
		super.init();
		componentCadastroProdutoClassificacao.setDelegate(this);
		componentCadastroProdutoEspecificidade.setDelegate(this);
	}

	@Override
	public void editarRegistro() {
		super.editarRegistro();
		if (registro != null) {
			componentCadastroProdutoClassificacao.carregarGrupoProdutoPorDepartamento(registro.getDepartamentoSelected(), false);
			componentCadastroProdutoClassificacao.carregarSubGrupoProdutoPorGrupo(registro.getGrupoProdutoSelected(), false);
			componentCadastroProdutoEspecificidade.carregarColecoesPorSubGrupo(registro.getSubGrupoProdutoSelected(), false);
			serviceBean.refresh(usuario, empresaSelecionada, registro);
		}
	}

	@Override
	public void validarComponent() {
		validarLista(componentCadastroProdutoClassificacao.getGrupos(), componentCadastroProdutoClassificacao.getSubGrupos(), componentCadastroProdutoEspecificidade.getColecoes());
		if (verificarLista(componentCadastroProdutoClassificacao.getGrupos(), registro.getGrupoProdutoSelected())) {
			registro.setGrupoProdutoSelected(null);
			registro.setSubGrupoProdutoSelected(null);
			registro.setColecaoSelected(null);
		}
		if (verificarLista(componentCadastroProdutoClassificacao.getSubGrupos(), registro.getSubGrupoProdutoSelected())) {
			registro.setSubGrupoProdutoSelected(null);
			registro.setColecaoSelected(null);
		}
		if (verificarLista(componentCadastroProdutoEspecificidade.getColecoes(), registro.getColecaoSelected())) {
			registro.setColecaoSelected(null);
		}
	}

	@Override
	public void incluir() {
		super.incluir();
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

}