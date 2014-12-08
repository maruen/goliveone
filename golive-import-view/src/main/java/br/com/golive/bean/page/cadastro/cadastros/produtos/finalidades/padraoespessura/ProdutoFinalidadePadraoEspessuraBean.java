package br.com.golive.bean.page.cadastro.cadastros.produtos.finalidades.padraoespessura;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;
import lombok.Setter;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBeanLazy;
import br.com.golive.entity.finalidadepadraoespessura.model.ProdutoFinalidadePadraoEspessuraModel;
import br.com.golive.entity.unidade.model.UnidadeModel;
import br.com.golive.service.ProdutoFinalidadePadraoEspessuraService;
import br.com.golive.service.UnidadeService;

@Label(name = "label.cadastroFinalidadePadraoEspessura")
@ManagedBean
@ViewScoped
public class ProdutoFinalidadePadraoEspessuraBean extends CadastroGenericBeanLazy<ProdutoFinalidadePadraoEspessuraModel> {

private static final long serialVersionUID = 1L;
	
	@Inject
	@Getter
	@Setter
	private Logger logger;
	
	@Inject
	@Getter
	@Setter
	private ProdutoFinalidadePadraoEspessuraFilter filtros;
	
	@EJB
	@Getter
	private ProdutoFinalidadePadraoEspessuraService serviceBean;
	
	@EJB
	private UnidadeService unidadeService;
	
	@Getter
	@Setter
	private List<UnidadeModel> unidades;

	@Getter
	@Setter
	private List<UnidadeModel> unidadesFiltrados;
	
	@Override
	public void editarRegistro() {
		super.editarRegistro();
		if (registro != null) {
			obterUnidades();
		}
	}

	@Override
	public void incluir() {
		super.incluir();
		obterUnidades();
	}

	private void obterUnidades() {
		unidades = unidadeService.obterLista(usuario, empresaSelecionada);
		if (unidades.isEmpty()) {
			listaVaziaMessage("msg.nao.ha.registros");
		} else {
			unidadesFiltrados = new ArrayList<UnidadeModel>();
			unidadesFiltrados.addAll(unidades);
		}
	}

	@Override
	public boolean validarCampos() {
		boolean ret = true;
		if (registro.getUnidadeSelected() == null) {
			ret = false;
		}
		if (!ret) {
			preencherTodosCamposMessage();
		}

		return ret;
	}	
}