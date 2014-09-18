package br.com.golive.session;

import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;
import javax.faces.event.PhaseEvent;
import javax.faces.event.PhaseId;
import javax.faces.event.PhaseListener;
import javax.servlet.http.HttpSession;

import br.com.golive.constants.ChaveSessao;
import br.com.golive.utils.ServiceUtils;

public class VerificadorSessaoUsuario implements PhaseListener {

	private static final long serialVersionUID = 6038869873960415295L;

	@Override
	public void afterPhase(final PhaseEvent event) {

		final FacesContext facesContext = event.getFacesContext();
		final String currentPage = facesContext.getViewRoot().getViewId();

		final boolean isLoginPage = (currentPage.lastIndexOf("login.xhtml") > -1);
		final HttpSession session = (HttpSession) facesContext.getExternalContext().getSession(false);

		if (session == null) {
			final NavigationHandler nh = facesContext.getApplication().getNavigationHandler();
			nh.handleNavigation(facesContext, null, "/login");
		} else {
			if (!isLoginPage && !ServiceUtils.verificarNaSessaoPorChave(ChaveSessao.USUARIO_LOGADO)) {
				final NavigationHandler nh = facesContext.getApplication().getNavigationHandler();
				nh.handleNavigation(facesContext, null, "/login");
			}
		}
	}

	@Override
	public void beforePhase(final PhaseEvent event) {

	}

	@Override
	public PhaseId getPhaseId() {
		return PhaseId.RESTORE_VIEW;
	}
}
