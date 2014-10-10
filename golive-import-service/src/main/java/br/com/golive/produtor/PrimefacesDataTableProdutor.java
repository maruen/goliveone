package br.com.golive.produtor;

import javax.enterprise.inject.Produces;
import javax.enterprise.inject.spi.InjectionPoint;
import javax.faces.context.FacesContext;

import org.primefaces.component.datatable.DataTable;

import br.com.golive.annotation.PropriedadesTemplate;
import br.com.golive.exception.GoLiveException;
import br.com.golive.qualifier.PrimefacesDataTableInjected;

public class PrimefacesDataTableProdutor {

	@Produces
	@PrimefacesDataTableInjected
	public DataTable getDataTable(final InjectionPoint inject) {
		if (inject.getMember().getDeclaringClass().isAnnotationPresent(PropriedadesTemplate.class)) {
			final String form = inject.getMember().getDeclaringClass().getAnnotation(PropriedadesTemplate.class).form();
			final String tableId = inject.getMember().getDeclaringClass().getAnnotation(PropriedadesTemplate.class).idTabela();
			return (DataTable) FacesContext.getCurrentInstance().getViewRoot().findComponent(form).findComponent(tableId);
		} else {
			throw new GoLiveException("Erro ao injetar DataTable, o ManagedBean nao possui a anotação @PropriedadesTemplate");
		}
	}

}
