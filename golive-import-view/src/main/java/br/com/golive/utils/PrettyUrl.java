package br.com.golive.utils;

import java.io.Serializable;

import com.ocpsoft.pretty.faces.config.mapping.UrlMapping;

public class PrettyUrl implements Serializable {

	private static final long serialVersionUID = -6270712847263969841L;

	private String id;
	private String url;
	private String prettyUrl;

	public PrettyUrl(final UrlMapping urlMapping) {

		if (urlMapping != null) {
			id = urlMapping.getId();
			url = urlMapping.getViewId();
			prettyUrl = urlMapping.getPattern();
		}

	}

	public String getId() {
		return id;
	}

	public void setId(final String id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(final String url) {
		this.url = url;
	}

	public String getPrettyUrl() {
		return prettyUrl;
	}

	public void setPrettyUrl(final String prettyUrl) {
		this.prettyUrl = prettyUrl;
	}

}
