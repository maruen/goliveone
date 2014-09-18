package br.com.golive.produtor;

import java.io.Serializable;

import javax.enterprise.inject.Produces;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.constants.ChaveSessao;
import br.com.golive.entity.Usuario;
import br.com.golive.qualifier.UsuarioLogadoInjected;
import br.com.golive.utils.ServiceUtils;

public class UsuarioProdutor implements Serializable {

	private static final long serialVersionUID = 4353071397161147048L;

	@Inject
	private Logger logger;

	@Produces
	@UsuarioLogadoInjected
	public Usuario getUsuarioLogado() {
		if (ServiceUtils.verificarNaSessaoPorChave(ChaveSessao.USUARIO_LOGADO)) {
			return ServiceUtils.obterValorPorChave(Usuario.class, ChaveSessao.USUARIO_LOGADO);
		}
		return null;
	}
}
