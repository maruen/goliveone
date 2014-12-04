package br.com.golive.bean.page.cadastro.cadastros.produtos.finalidades.codigo;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;
import lombok.Setter;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBeanLazy;
import br.com.golive.entity.finalidadecodigo.model.ProdutoFinalidadeCodigoModel;
import br.com.golive.service.ProdutoFinalidadeCodigoService;

@ManagedBean
@ViewScoped
@Label(name = "label.cadastroFinalidadeCodigo")
public class ProdutoFinalidadeCodigoBean extends CadastroGenericBeanLazy<ProdutoFinalidadeCodigoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	@Setter
	private Logger logger;

	@Inject
	@Getter
	@Setter
	private ProdutoFinalidadeCodigoFilter filtros;

	@EJB
	@Getter
	private ProdutoFinalidadeCodigoService serviceBean;
}