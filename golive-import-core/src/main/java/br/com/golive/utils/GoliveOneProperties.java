package br.com.golive.utils;

import java.io.IOException;
import java.util.Locale;
import java.util.Properties;

public class GoliveOneProperties extends Properties {

	private static final long serialVersionUID = -7590180397756932141L;

	private static String PROPERTY_KEY_NAO_FOI_CARREGADO = "ERROR.GET.LABELS";
	private static String VOID_CONTENT = "VOID-CONTENT-";

	public GoliveOneProperties (final Locale locale) throws IOException{
		super();
		System.out.println("bla bla bla");
		load(Thread.currentThread().getContextClassLoader().getResourceAsStream(locale + ".properties"));
	}
	
	public GoliveOneProperties () {
		super();
		put(PROPERTY_KEY_NAO_FOI_CARREGADO, "doesn't load de labels of system");
	}
	
	public String getField(final String field) {
		if (get(field) != null) {
			return get(field).toString();
		} else {
			if(get(PROPERTY_KEY_NAO_FOI_CARREGADO) == null){
				return VOID_CONTENT + field.toUpperCase();
			} else {
				return get(PROPERTY_KEY_NAO_FOI_CARREGADO).toString();
			}
		}
		
	}
	
	
}
