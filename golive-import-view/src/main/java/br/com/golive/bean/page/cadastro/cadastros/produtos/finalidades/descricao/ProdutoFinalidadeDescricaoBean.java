package br.com.golive.bean.page.cadastro.cadastros.produtos.finalidades.descricao;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;
import lombok.Setter;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBeanLazy;
import br.com.golive.entity.finalidadedescricao.model.ProdutoFinalidadeDescricaoModel;
import br.com.golive.service.ProdutoFinalidadeDescricaoService;

@Label(name = "label.cadastroFinalidadeDescricao")
@ManagedBean
@ViewScoped
public class ProdutoFinalidadeDescricaoBean extends CadastroGenericBeanLazy<ProdutoFinalidadeDescricaoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	@Setter
	private Logger logger;
	
	@Inject
	@Getter
	@Setter
	private ProdutoFinalidadeDescricaoFilter filtros;
	
	@Inject
	@Getter
	@Setter
	private ProdutoFinalidadeDescricaoService serviceBean;
}