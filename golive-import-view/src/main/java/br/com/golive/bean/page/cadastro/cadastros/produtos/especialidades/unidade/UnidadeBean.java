package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades.unidade;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBeanLazy;
import br.com.golive.entity.unidade.model.UnidadeModel;
import br.com.golive.service.UnidadeService;

@Label(name = "label.cadastroUnidade")
@ManagedBean
@ViewScoped
public class UnidadeBean extends CadastroGenericBeanLazy<UnidadeModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	private Logger logger;

	@EJB
	@Getter
	private UnidadeService serviceBean;

	@Inject
	@Getter
	private UnidadeFilter filtros;

	@Override
	public boolean validarCampos() {
		boolean ret = true;
		if (registro == null) {
			ret = false;
		}
		if ((registro.getAbreviacao() == null) || (registro.getAbreviacao().isEmpty())) {
			ret = false;
		}
		if (registro.getUnidade() == null) {
			ret = false;
		}
		if (!ret) {
			preencherTodosCamposMessage();
		}
		return ret;
	}

}