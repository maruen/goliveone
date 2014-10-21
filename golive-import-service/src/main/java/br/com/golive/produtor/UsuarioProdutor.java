package br.com.golive.produtor;

import java.io.Serializable;

import javax.enterprise.inject.Produces;
import javax.faces.bean.SessionScoped;

import br.com.golive.constants.ChaveSessao;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.qualifier.UsuarioLogadoInjected;
import br.com.golive.utils.GoliveOneProperties;
import br.com.golive.utils.ServiceUtils;

@SessionScoped
public class UsuarioProdutor implements Serializable {

	private static final long serialVersionUID = 4353071397161147048L;

	private Usuario usuarioLogado;

	@Produces
	@UsuarioLogadoInjected
	public Usuario getUsuarioLogado() {

		if (usuarioLogado == null) {
			if (ServiceUtils.verificarNaSessaoPorChave(ChaveSessao.USUARIO_LOGADO)) {
				usuarioLogado = ServiceUtils.obterValorPorChave(Usuario.class, ChaveSessao.USUARIO_LOGADO);

				if (usuarioLogado.getLabels() == null) {
					usuarioLogado.setLabels(GoliveOneProperties.getProperties("pt_BR"));
				}

			}
		}

		return usuarioLogado;
	}
}
