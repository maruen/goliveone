package br.com.golive.bean.page.manager;

import java.io.Serializable;
import java.util.Map;

import br.com.golive.constants.ChaveSessao;
import br.com.golive.utils.ServiceUtils;

import com.ocpsoft.pretty.PrettyContext;

public abstract class GenericBean implements Serializable {

	private static final long serialVersionUID = 4071283597411400370L;

	private String empresaSelecionada;

	private Map<String, Object> requestParameters;

	
	public void postConstruct() {

		if (ServiceUtils.verificarNaSessaoPorChave(PrettyContext.getCurrentInstance().getCurrentMapping().getId())) {
			
			requestParameters = ServiceUtils.obterMapPorChave(PrettyContext.getCurrentInstance().getCurrentMapping().getId());
			
			if (requestParameters.containsKey(ChaveSessao.EMPRESA_SELECIONADA.getChave())) {
				setEmpresaSelecionada((String) requestParameters.get(ChaveSessao.EMPRESA_SELECIONADA.getChave()));
			}

		} else {
			if (ServiceUtils.verificarNaSessaoPorChave(ChaveSessao.EMPRESA_SELECIONADA)) {
				empresaSelecionada = ServiceUtils.obterValorPorChave(String.class, ChaveSessao.EMPRESA_SELECIONADA);
			}
		}

	}


	public String getEmpresaSelecionada() {
		return empresaSelecionada;
	}


	public void setEmpresaSelecionada(final String empresaSelecionada) {
		this.empresaSelecionada = empresaSelecionada;
	}

}
