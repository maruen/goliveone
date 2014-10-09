package br.com.golive.bean.page.manager;

import java.io.IOException;
import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.primefaces.context.RequestContext;
import org.slf4j.Logger;

import br.com.golive.constants.ChaveSessao;
import br.com.golive.entity.Usuario;
import br.com.golive.exception.GoLiveException;
import br.com.golive.utils.JSFUtils;
import br.com.golive.utils.PrettyUrl;
import br.com.golive.utils.ServiceUtils;

import com.ocpsoft.pretty.PrettyContext;

@ManagedBean
@ViewScoped
public class ManagerBean extends GenericBean {

	private static final long serialVersionUID = -3835588092031262953L;

	@Inject
	private Logger logger;

	private String data;

	private String diaSemana;

	@PostConstruct
	public void init() {
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

	public boolean campoValido(final String campo) {
		return ((campo != null) && (!campo.isEmpty()));
	}

	public void logout() {
		for (final String key : ServiceUtils.getSessionMap().keySet()) {
			ServiceUtils.removerObjetoSessao(key);
		}
		usuario = null;
		verificarSessao();
	}

	private boolean verificarSessao() {
		if (usuario == null) {
			try {
				final PrettyUrl pretty = new PrettyUrl(PrettyContext.getCurrentInstance().getCurrentMapping());

				if ((!pretty.getId().equals("welcome")) && (!pretty.getId().equals("login"))) {
					ServiceUtils.guardarObjetoSessao(ChaveSessao.ULTIMA_PAGINA, new PrettyUrl(PrettyContext.getCurrentInstance().getCurrentMapping()));
				}
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

	@Deprecated
	public void newTab(final String url) {

		final RequestContext context = RequestContext.getCurrentInstance();
		context.execute("window.open('" + url + "', '_newtab')");
	}

	public String labelAnotado(final Class<?> clazz) {
		return get(JSFUtils.getLabelPageName(clazz));
	}

	@Override
	public Usuario getUsuario() {
		return usuario;
	}

	@Override
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
