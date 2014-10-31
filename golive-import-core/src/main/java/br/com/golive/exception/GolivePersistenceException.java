package br.com.golive.exception;

public class GolivePersistenceException extends RuntimeException {

	private static final long serialVersionUID = -2211622361270750140L;

	private final String errorMsg;

	private final String errorTitle;

	public GolivePersistenceException(final String msg, final String errorTitle, final String errorMsg) {
		super(msg);
		this.errorTitle = errorTitle;
		this.errorMsg = errorMsg;
	}

}
