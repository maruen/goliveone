package br.com.golive.produtor;

import java.util.ArrayList;
import java.util.List;

import javax.enterprise.inject.Produces;

import br.com.golive.entity.ColunaPerfil;
import br.com.golive.qualifier.ListColunaInjected;
import br.com.golive.qualifier.ListGenericaInjected;

public class ListProdutor {

	@Produces
	@ListColunaInjected
	public List<ColunaPerfil> getListColuna() {
		return new ArrayList<ColunaPerfil>();
	}

	@Produces
	@ListGenericaInjected
	public <T> List<T> getList() {
		return new ArrayList<T>();
	}

}
