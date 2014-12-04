package br.com.golive.bean.page.cadastro.cadastros.produtos.finalidades.colecao;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;
import lombok.Setter;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBeanLazy;
import br.com.golive.entity.finalidadecolecao.model.ProdutoFinalidadeColecaoModel;
import br.com.golive.service.ProdutoFinalidadeColecaoService;

@Label(name = "label.cadastroFinalidadeColecao")
@ManagedBean
@ViewScoped
public class ProdutoFinalidadeColecaoBean extends
		CadastroGenericBeanLazy<ProdutoFinalidadeColecaoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	@Setter
	private Logger logger;

	@Inject
	@Getter
	@Setter
	private ProdutoFinalidadeColecaoFilter filtros;

	@EJB
	@Getter
	private ProdutoFinalidadeColecaoService serviceBean;

}