package br.com.golive.produtor;

import java.io.Serializable;

import javax.enterprise.inject.Produces;
import javax.faces.bean.SessionScoped;

import br.com.golive.constants.ChaveSessao;
import br.com.golive.entity.empresas.empresa.model.Empresa;
import br.com.golive.qualifier.EmpresaSelecionadaInjected;
import br.com.golive.utils.ServiceUtils;

@SessionScoped
public class EmpresaProdutor implements Serializable {

	private static final long serialVersionUID = 4353071397161147048L;

	private Empresa empresaSelecionada;

	@Produces
	@EmpresaSelecionadaInjected
	public Empresa getUsuarioLogado() {
		if (empresaSelecionada == null) {
			if (ServiceUtils.verificarNaSessaoPorChave(ChaveSessao.EMPRESA_SELECIONADA)) {
				empresaSelecionada = ServiceUtils.obterValorPorChave(Empresa.class, ChaveSessao.EMPRESA_SELECIONADA);
			}
		}
		return empresaSelecionada;
	}
}
