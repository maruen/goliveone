package br.com.golive.navigation.component;

import lombok.Getter;
import lombok.Setter;

public class KeySubQueries {

	@Getter
	@Setter
	private String fieldName;

	@Getter
	@Setter
	private Class<?> clazz;

	public KeySubQueries(final String fieldName, final Class<?> clazz) {
		super();
		this.fieldName = fieldName;
		this.clazz = clazz;
	}

}
