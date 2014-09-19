package br.com.golive.session;

import javax.faces.context.FacesContext;
import javax.faces.event.PhaseEvent;
import javax.faces.event.PhaseId;
import javax.faces.event.PhaseListener;
import javax.servlet.http.HttpSession;

import br.com.golive.constants.ChaveSessao;
import br.com.golive.utils.ServiceUtils;

public class VerificadorSessaoUsuario implements PhaseListener {

	private static final long serialVersionUID = 6038869873960415295L;

	private String lastPage;

	@Override
	public void afterPhase(final PhaseEvent event) {

		final FacesContext facesContext = event.getFacesContext();
		final String currentPage = facesContext.getViewRoot().getViewId();

		final boolean isLoginPage = (currentPage.lastIndexOf("login.xhtml") > -1);
		final HttpSession session = (HttpSession) facesContext.getExternalContext().getSession(false);

		if (session == null) {

			if (lastPage == null) {
				lastPage = currentPage;
			}

			facesContext.getApplication().getNavigationHandler().handleNavigation(facesContext, null, "/login");
		} else {
			final boolean logado = ServiceUtils.verificarNaSessaoPorChave(ChaveSessao.USUARIO_LOGADO);

			if (!isLoginPage && !logado) {
				facesContext.getApplication().getNavigationHandler().handleNavigation(facesContext, null, "/login");
			} else if ((logado) && (lastPage != null)) {
				facesContext.getApplication().getNavigationHandler().handleNavigation(facesContext, null, lastPage);
				lastPage = null;
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
