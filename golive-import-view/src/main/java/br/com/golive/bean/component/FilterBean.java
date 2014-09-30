package br.com.golive.bean.component;

import java.io.Serializable;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import br.com.golive.constants.TipoFiltroData;
import br.com.golive.filter.DateFilter;

@ViewScoped
@ManagedBean
public class FilterBean implements Serializable {

	private static final long serialVersionUID = 9018027341265910675L;

	public TipoFiltroData getIgual() {
		return TipoFiltroData.IGUAL;
	}

	public TipoFiltroData getMaior() {
		return TipoFiltroData.MAIOR;
	}

	public TipoFiltroData getMenor() {
		return TipoFiltroData.MENOR;
	}

	public TipoFiltroData getPeriodo() {
		return TipoFiltroData.PERIODO;
	}

	public void selecionarTipoFiltragemData(final DateFilter data) {
		if (data.getTipo().equals(TipoFiltroData.PERIODO)) {
			data.setFim(data.getInicio());
		} else {
			data.setFim(null);
		}
	}

	public void print() {
		System.out.println("Print");
	}

}
