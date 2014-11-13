package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades.cores;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.generics.CadastroProdutoClassificacao;
import br.com.golive.bean.generics.CadastroProdutoEspecificidade;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBean;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericFilterBean;
import br.com.golive.entity.especialidades.model.CorProdutoModel;
import br.com.golive.service.CorProdutoService;

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

	@Inject
	private CadastroProdutoClassificacao componentCadastroProdutoClassificacao;

	@Inject
	private CadastroProdutoEspecificidade componentCadastroProdutoEspecificidade;

	@EJB
	private CorProdutoService corProdutoService;

	@Getter
	private final boolean especificidades = true;

	@Override
	@PostConstruct
	public void init() {
		super.init(corProdutoService.listarPorFiltro());
		componentCadastroProdutoClassificacao.setDelegate(this);
		componentCadastroProdutoEspecificidade.setDelegate(this);
	}

	@Override
	public void editarRegistro() {
		super.editarRegistro();
		if (registro != null) {
			componentCadastroProdutoClassificacao.carregarGrupoProdutoPorDepartamento(registro.getDepartamentoSelected());
			componentCadastroProdutoClassificacao.carregarSubGrupoProdutoPorGrupo(registro.getGrupoProdutoSelected());
			componentCadastroProdutoEspecificidade.carregarColecoesPorSubGrupo(registro.getSubGrupoProdutoSelected());
			componentCadastroProdutoEspecificidade.carregarCoresPorColecoes(registro.getColecaoSelected());
		}
	}

	@Override
	public void validarComponent() {
		if (!fluxo.equals(getFluxoEdicao())) {
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
	}

	@Override
	public void incluir() {
		super.incluir();
		registro = new CorProdutoModel();
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

	@Override
	public void serviceRefresh(final CorProdutoModel model) {
		corProdutoService.refresh(model);

	}

	@Override
	public CadastroGenericFilterBean<CorProdutoModel> getFiltros() {
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
}