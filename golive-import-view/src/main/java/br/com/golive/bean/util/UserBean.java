package br.com.golive.bean.util;

import java.io.IOException;
import java.io.Serializable;
import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Data;
import br.com.golive.constants.ChaveSessao;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.exception.GoLiveException;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.qualifier.UsuarioLogadoInjected;
import br.com.golive.service.UsuarioBeanService;
import br.com.golive.utils.GoliveOneProperties;
import br.com.golive.utils.JSFUtils;
import br.com.golive.utils.ServiceUtils;

@Data
@ViewScoped
@ManagedBean
@Deprecated
public class UserBean implements Serializable {

	private static final long serialVersionUID = -7455127489110553168L;

	@EJB
	private UsuarioBeanService usuarioService;

	private final String usuario = "Joaquim Silva";

	private String empresaSelecionada;

	private String data;

	private String diaSemana;

	private final boolean logado = false;

	@Inject
	@LabelSystemInjected
	private GoliveOneProperties properties;

	@Inject
	@UsuarioLogadoInjected
	private Usuario usuarioLogado;

	@PostConstruct
	public void init() {

		final Calendar cal = Calendar.getInstance();
		data = new SimpleDateFormat("dd/MM/yyyy").format(cal.getTime());
		diaSemana = new DateFormatSymbols().getWeekdays()[cal.get(Calendar.DAY_OF_WEEK)];

	}

	private void verificarSessao() {
		try {
			if (usuarioLogado == null) {
				JSFUtils.redirect("/login");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public boolean verificarPermissao() {
		System.out.println("Voltou");
		return true;
	}

	public void logout() {
		ServiceUtils.removerObjetoSessao(ChaveSessao.USUARIO_LOGADO);
		usuarioLogado = null;
		verificarSessao();
	}

	public String labelAnotado(final Class<?> clazz, final String field) {
		try {
			return properties.getField(JSFUtils.getLabelFieldName(clazz.getDeclaredField(field)));
		} catch (NoSuchFieldException | SecurityException e) {
			e.printStackTrace();
			throw new GoLiveException("Erro ao Obter campo da classe");
		}
	}

	public String labelAnotado(final Class<?> clazz) {
		return properties.getField(JSFUtils.getLabelPageName(clazz));
	}

	public UsuarioBeanService getUsuarioService() {
		return usuarioService;
	}

	public void setUsuarioService(final UsuarioBeanService usuarioService) {
		this.usuarioService = usuarioService;
	}

	public String getEmpresaSelecionada() {
		return empresaSelecionada;
	}

	public void setEmpresaSelecionada(final String empresaSelecionda) {
		this.empresaSelecionada = empresaSelecionda;
	}

	public String getData() {
		return data;
	}

	public void setData(final String data) {
		this.data = data;
	}

	public String getDiaSemana() {
		return diaSemana;
	}

	public void setDiaSemana(final String diaSemana) {
		this.diaSemana = diaSemana;
	}

	public GoliveOneProperties getProperties() {
		return properties;
	}

	public void setProperties(final GoliveOneProperties properties) {
		this.properties = properties;
	}

	public Usuario getUsuarioLogado() {
		return usuarioLogado;
	}

	public void setUsuarioLogado(final Usuario usuarioLogado) {
		this.usuarioLogado = usuarioLogado;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getUsuario() {
		return usuario;
	}

	public boolean isLogado() {
		return logado;
	}
	
}
