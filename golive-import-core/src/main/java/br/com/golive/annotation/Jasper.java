package br.com.golive.annotation;

import static java.lang.annotation.ElementType.TYPE;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

@Target({ TYPE })
@Retention(RUNTIME)
public @interface Jasper {
	public String nomeArquivoJasper();
	public String nomeDoArquivoGerado();
	public String titulo();
}
