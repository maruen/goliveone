package br.com.golive.bean.page.cadastro.cadastros.produtos.classificacao.departamento;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;
import lombok.Setter;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBeanLazy;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.service.DepartamentoService;

@ManagedBean
@ViewScoped
@Label(name = "label.cadastroDepartamento")
public class DepartamentoBean extends CadastroGenericBeanLazy<DepartamentoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	@Setter
	private Logger logger;

	@Inject
	@Getter
	@Setter
	private DepartamentoFilter filtros;

	@EJB
	@Getter
	private DepartamentoService serviceBean;

}