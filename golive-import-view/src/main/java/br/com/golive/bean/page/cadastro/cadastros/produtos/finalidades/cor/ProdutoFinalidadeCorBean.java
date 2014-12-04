package br.com.golive.bean.page.cadastro.cadastros.produtos.finalidades.cor;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;
import lombok.Setter;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBeanLazy;
import br.com.golive.entity.finalidadecor.model.ProdutoFinalidadeCorModel;
import br.com.golive.service.ProdutoFinalidadeCorService;

@Label(name = "label.cadastroFinalidadeCor")
@ManagedBean
@ViewScoped
public class ProdutoFinalidadeCorBean extends CadastroGenericBeanLazy<ProdutoFinalidadeCorModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Setter
	@Getter
	private Logger logger;
	
	@Inject
	@Setter
	@Getter
	private ProdutoFinalidadeCorFilter filtros;
	
	@Inject
	@Setter
	@Getter
	private ProdutoFinalidadeCorService serviceBean;
}