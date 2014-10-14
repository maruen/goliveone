package br.com.golive.bean.component;

import java.io.Serializable;

public class ColumnModel implements Serializable {

	private static final long serialVersionUID = 630681922417879754L;

	private final String header;
	private final String property;

	public ColumnModel(final String header, final String property) {
		this.header = header;
		this.property = property;
	}

	public String getHeader() {
		return header;
	}

	public String getProperty() {
		return property;
	}
}
