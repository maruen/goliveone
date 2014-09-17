package br.com.golive.impl;

import java.io.IOException;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Locale;

import javax.ejb.Stateless;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.constants.ChaveSessao;
import br.com.golive.entity.Usuario;
import br.com.golive.service.UsuarioBeanService;
import br.com.golive.utils.GoliveOneProperties;
import br.com.golive.utils.ServiceUtils;

@Stateless
public class UsuarioBeanServiceImpl implements UsuarioBeanService {

	@Inject
	private Logger logger;

	@Override
	public Usuario obterPorUserName(final String username) {
		try {
			return geradorUsuario(username);
		} catch (final IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Deprecated
	private Usuario geradorUsuario(final String username) throws IOException {
		Usuario ret = new Usuario();
		ret.setId(1L);
		ret.setDataInclusao(Calendar.getInstance());
		ret.setLabels(new GoliveOneProperties(Locale.getDefault()));
		switch (username) {
		case "Guilherme":
			ret.setNome("Guilherme");
			ret.setSenha("123");
			Arrays.asList("Guilherme Empresa 1", "Guilherme Empresa 2", "Guilherme Empresa 3");
			break;

		case "Joaquim":
			ret.setNome("Joaquim");
			ret.setSenha("asd");
			Arrays.asList("Joaquim Empresa 1", "Joaquim Empresa 2");
			break;
		case "Maruen":
			ret.setNome("Maruen");
			ret.setSenha("123");
			Arrays.asList("Maruen Empresa 1", "Maruen Empresa 2", "Maruen Empresa 3");
			break;
		case "Jao":
			ret.setNome("Jao");
			ret.setSenha("asd");
			Arrays.asList("Jao Empresa 1", "Jao Empresa 3");
			break;
		default:
			ret = null;
			break;
		}
		if (ret != null) {
			ServiceUtils.guardarObjetoSessao(ChaveSessao.USUARIO_LOGADO, ret);
		}
		return ret;
	}

}
