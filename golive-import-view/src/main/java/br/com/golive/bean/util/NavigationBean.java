package br.com.golive.bean.util;

import java.io.IOException;
import java.io.Serializable;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.utils.JSFUtils;

@ManagedBean
@ViewScoped
public class NavigationBean implements Serializable {

	private static final long serialVersionUID = 8945968882071846906L;

	@Inject
	private Logger logger;

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
}
