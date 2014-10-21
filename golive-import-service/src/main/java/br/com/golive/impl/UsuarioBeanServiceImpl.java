package br.com.golive.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.ejb.Stateless;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.constants.ChaveSessao;
import br.com.golive.entity.empresas.model.Empresa;
import br.com.golive.entity.perfil.usuario.model.Usuario;
import br.com.golive.entity.perfil.usuario.repositorio.UsuarioJpa;
import br.com.golive.service.UsuarioBeanService;
import br.com.golive.utils.GoliveOneProperties;
import br.com.golive.utils.ServiceUtils;

@Stateless
public class UsuarioBeanServiceImpl implements UsuarioBeanService {

	@Inject
	private Logger logger;

	@Inject
	private UsuarioJpa usuarioJpa;

	@Override
	public Usuario logar(final String username) {
		logger.info("Obtendo Usuario por Login = {}", username);
		return usuarioJpa.logar(username);
	}

	@Override
	@Deprecated
	public Usuario obterPorUserName(final String username) {
		try {
			logger.info("Obtendo Usuario por username={}", username);
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

		final List<Empresa> lista = new ArrayList<Empresa>();
		lista.add(new Empresa(1L, "Tradição Distribuidora de Persianas Ltda"));
		lista.add(new Empresa(2L, "Ação Persianas e Distribuidora Ltda"));

		switch (username) {
		case "roberto.tradicao@gmail.com":
			ret.setNome("Roberto Tradição");
			ret.setSenha("tradicao1234");
			ret.setEmpresas(lista);
			break;

		case "Guilherme":
			ret.setNome("Guilherme");
			ret.setSenha("123");
			ret.setEmpresas(lista);
			break;
		case "Maruen":
			ret.setNome("Maruen");
			ret.setSenha("123");
			ret.setEmpresas(lista);
			break;
		case "Antero":
			ret.setNome("Antero A. Costa");
			ret.setSenha("costa");
			ret.setEmpresas(lista);
			break;
		case "Anderson":
			ret.setNome("Anderson P. Moreira");
			ret.setSenha("moreira");
			ret.setEmpresas(lista);
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
