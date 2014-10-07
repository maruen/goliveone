package br.com.golive.bean.page.manager;

import java.io.IOException;
import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.constants.ChaveSessao;
import br.com.golive.entity.Usuario;
import br.com.golive.exception.GoLiveException;
import br.com.golive.qualifier.UsuarioLogadoInjected;
import br.com.golive.utils.JSFUtils;
import br.com.golive.utils.ServiceUtils;

import com.ocpsoft.pretty.PrettyContext;
import com.ocpsoft.pretty.faces.config.mapping.UrlMapping;

@ManagedBean
@ViewScoped
public class ManagerBean extends GenericBean {

	private static final long serialVersionUID = -3835588092031262953L;

	@Inject
	private Logger logger;

	@Inject
	@UsuarioLogadoInjected
	private Usuario usuario;

	private String data;

	private String diaSemana;

	@PostConstruct
	public void init() {
		super.postConstruct();
		if (verificarSessao()) {
			final Calendar cal = Calendar.getInstance();
			setData(new SimpleDateFormat("dd/MM/yyyy").format(cal.getTime()));
			setDiaSemana(new DateFormatSymbols().getWeekdays()[cal.get(Calendar.DAY_OF_WEEK)]);
		}
	}

	public String redirect(final String prettyPage) {
		logger.info("Redirecionando para pagina = {}", prettyPage);
		return "pretty:" + prettyPage;
	}

	public void notFound() {
		try {
			JSFUtils.redirect("/");
		} catch (final IOException e) {
			e.printStackTrace();
		}
	}

	public void setEmpresaSelecionada(final String url, final String empresa) {
		for (final UrlMapping pretty : PrettyContext.getCurrentInstance().getConfig().getMappings()) {
			if (pretty.getPattern().equals("/" + url)) {
				logger.info("Abrindo nova aba = {}", pretty.getId());
				final Map<String, Object> paramters = new HashMap<String, Object>();
				paramters.put(ChaveSessao.EMPRESA_SELECIONADA.getChave(), empresa);
				ServiceUtils.guardarObjetoSessao(pretty.getId(), paramters);
			}
		}
	}

	public boolean campoValido(final String campo) {
		return ((campo != null) && (!campo.isEmpty()));
	}

	public void logout() {
		ServiceUtils.removerObjetoSessao(ChaveSessao.USUARIO_LOGADO);
		usuario = null;
		verificarSessao();
	}

	private boolean verificarSessao() {
		if (usuario == null) {
			try {
				ServiceUtils.guardarObjetoSessao(ChaveSessao.ULTIMA_PAGINA, PrettyContext.getCurrentInstance().getCurrentMapping().getId());
				JSFUtils.redirect("/login");
				return false;
			} catch (final IOException e) {
				e.printStackTrace();
			}
		}
		return true;
	}

	public String get(final String key) {
		if ((getUsuario() != null) && (getUsuario().getLabels() != null)) {
			return getUsuario().getLabels().getField(key);
		}
		return "";
	}

	public String labelAnotado(final Class<?> clazz, final String field) {
		try {
			return get(JSFUtils.getLabelFieldName(clazz.getDeclaredField(field)));
		} catch (NoSuchFieldException | SecurityException e) {
			e.printStackTrace();
			throw new GoLiveException("Erro ao Obter campo da classe");
		}
	}

	public String labelAnotado(final Class<?> clazz) {
		return get(JSFUtils.getLabelPageName(clazz));
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(final Usuario usuario) {
		this.usuario = usuario;
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
}
