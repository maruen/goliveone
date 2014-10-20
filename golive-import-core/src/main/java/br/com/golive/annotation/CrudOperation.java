package br.com.golive.annotation;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import br.com.golive.constants.Operation;

@Target({ METHOD })
@Retention(RUNTIME)
public @interface CrudOperation {

	public Operation type();

}
