package br.com.golive.bean.page.cadastro.cadastros.produtos.finalidades.tipoproduto;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;
import lombok.Setter;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBeanLazy;
import br.com.golive.entity.finalidadetipo.model.ProdutoFinalidadeTipoModel;
import br.com.golive.service.ProdutoFinalidadeTipoService;

@Label(name = "label.cadastroFinalidadeTipo")
@ManagedBean
@ViewScoped
public class ProdutoFinalidadeTipoBean extends CadastroGenericBeanLazy<ProdutoFinalidadeTipoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	@Setter
	private Logger logger;
	
	@Inject
	@Getter
	@Setter
	private ProdutoFinalidadeTipoFilter filtros;
	
	@Inject
	@Getter
	@Setter
	private ProdutoFinalidadeTipoService serviceBean;
}