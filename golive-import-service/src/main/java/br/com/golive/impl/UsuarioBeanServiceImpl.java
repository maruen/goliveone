package br.com.golive.impl;

import java.io.IOException;

import javax.ejb.Stateless;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.entity.empresas.empresa.repositorio.EmpresaJpa;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.entity.usuario.repositorio.UsuarioJpa;
import br.com.golive.service.UsuarioBeanService;

@Stateless
public class UsuarioBeanServiceImpl implements UsuarioBeanService {

	@Inject
	private Logger logger;

	@Inject
	private UsuarioJpa usuarioJpa;

	@Inject
	private EmpresaJpa empresaJpa;

	@Override
	public Usuario logar(final String username) {
		logger.info("Obtendo Usuario por Login = {}", username);
		final Usuario usuario = usuarioJpa.logar(username);

		if (usuario != null) {
			logger.info("Obtendo empresas do usuario {}", username);
			usuario.setEmpresas(empresaJpa.obterEmpresasUsuario(usuario));
		}
		return usuario;
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
<<<<<<< HEAD
		// Usuario ret = new Usuario();
		// ret.setId(1L);
		// ret.setDataInclusao(Calendar.getInstance().getTime());
		// ret.setLabels(new GoliveOneProperties(Locale.getDefault()));
		//
		// final List<Empresa> lista = new ArrayList<Empresa>();
		// lista.add(new Empresa(1L, Calendar.getInstance(),
		// Calendar.getInstance(), "123", "abc",
		// "Tradição Distribuidora de Persianas Ltda"));
		// lista.add(new Empresa(2L, Calendar.getInstance(),
		// Calendar.getInstance(), "123", "abc",
		// "Ação Persianas e Distribuidora Ltda"));
		//
		// switch (username) {
		// case "roberto.tradicao@gmail.com":
		// ret.setNome("Roberto Tradição");
		// ret.setSenha("tradicao1234");
		// ret.setEmpresas(lista);
		// break;
		//
		// case "Guilherme":
		// ret.setNome("Guilherme");
		// ret.setSenha("123");
		// ret.setEmpresas(lista);
		// break;
		// case "Maruen":
		// ret.setNome("Maruen");
		// ret.setSenha("123");
		// ret.setEmpresas(lista);
		// break;
		// case "Antero":
		// ret.setNome("Antero A. Costa");
		// ret.setSenha("costa");
		// ret.setEmpresas(lista);
		// break;
		// case "Anderson":
		// ret.setNome("Anderson P. Moreira");
		// ret.setSenha("moreira");
		// ret.setEmpresas(lista);
		// break;
		//
		// default:
		// ret = null;
		// break;
		// }
		// if (ret != null) {
		// ServiceUtils.guardarObjetoSessao(ChaveSessao.USUARIO_LOGADO, ret);
		// }
		// return ret;
		return null;
=======
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
>>>>>>> 8557e5498c87cecf37e2b42731a91bb4ab735a1a
	}
}
