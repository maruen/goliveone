package br.com.golive.bean.page.cadastro.cadastros.produtos.finalidades.unidade;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;
import lombok.Setter;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBeanLazy;
import br.com.golive.entity.finalidadeunidade.model.ProdutoFinalidadeUnidadeModel;
import br.com.golive.service.ProdutoFinalidadeUnidadeService;

@Label(name = "label.cadastroFinalidadeUnidade")
@ManagedBean
@ViewScoped
public class ProdutoFinalidadeUnidadeBean extends CadastroGenericBeanLazy<ProdutoFinalidadeUnidadeModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Setter
	@Getter
	private Logger logger;
	
	@Inject
	@Setter
	@Getter
	private ProdutoFinalidadeUnidadeFilter filtros;
	
	@Inject
	@Setter
	@Getter
	private ProdutoFinalidadeUnidadeService serviceBean;
}