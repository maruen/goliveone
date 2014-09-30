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
			logger.info("Obetendo Usuario por username={}", username);
			return geradorUsuario(username);
		} catch (final IOException e) {
			logger.error("Erro ao obter usuario");
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
			ret.setEmpresas(Arrays.asList("Guilherme Empresa 1", "Guilherme Empresa 2", "Guilherme Empresa 3"));
			break;
		case "Maruen":
			ret.setNome("Maruen");
			ret.setSenha("123");
			ret.setEmpresas(Arrays.asList("Maruen Empresa 1", "Maruen Empresa 2", "Maruen Empresa 3"));
			break;
		case "Antero":
			ret.setNome("Antero A. Costa");
			ret.setSenha("costa");
			ret.setEmpresas(Arrays.asList("Antero Empresa 1", "Antero Empresa 3"));
			break;	
		case "Anderson":
			ret.setNome("Anderson P. Moreira");
			ret.setSenha("moreira");
			ret.setEmpresas(Arrays.asList("Anderson Empresa 1", "Anderson Empresa 3"));
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
