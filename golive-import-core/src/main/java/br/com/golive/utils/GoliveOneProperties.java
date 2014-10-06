package br.com.golive.utils;

import java.io.IOException;
import java.util.Locale;
import java.util.Properties;

public class GoliveOneProperties extends Properties {

	private static final long serialVersionUID = -7590180397756932141L;

	private static String PROPERTY_KEY_NAO_FOI_CARREGADO = "CHAVE-NAO-EXISTE";
	private static String VOID_CONTENT = "CONTEUDO-VAZIO-";

	// MUDAR POSTERIORMENTE
	public static GoliveOneProperties getProperties(final String stringLocale) {
		final Locale locale = Locale.getDefault();
		try {
			return new GoliveOneProperties(locale);
		} catch (final IOException e) {
			return new GoliveOneProperties();
		}

	}

	public GoliveOneProperties(final Locale locale) throws IOException {
		super();
		load(Thread.currentThread().getContextClassLoader().getResourceAsStream(locale + ".properties"));
	}

	public GoliveOneProperties() {
		super();
		put(PROPERTY_KEY_NAO_FOI_CARREGADO, "não foi possivel carregar os properties de label");
	}

	public String getField(final String field) {
		if (get(field) != null) {
			return get(field).toString();
		} else {
			if (get(PROPERTY_KEY_NAO_FOI_CARREGADO) == null) {
				return VOID_CONTENT + field.toUpperCase();
			} else {
				return get(PROPERTY_KEY_NAO_FOI_CARREGADO).toString();
			}
		}

	}

}
