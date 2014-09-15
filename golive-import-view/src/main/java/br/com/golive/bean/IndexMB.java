package br.com.golive.bean;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.Properties;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

@ManagedBean
@ViewScoped
@Deprecated
public class IndexMB implements Serializable {

	private static final long serialVersionUID = 7145758767007167623L;

	public void logar() {
	}

	private Properties properties;

	private String tipoFiltroColunaId;

	private String inputFiltroId = "12";

	private String[] tiposFiltro;

	@PostConstruct
	public void init() {
		setTiposFiltro(new String[] { "contains", "exact" });

		tipoFiltroColunaId = getTiposFiltro()[0];

		properties = new Properties();
		properties.put("id", "Mudou");

	}

	public void listenEvent() {
		System.out.println("TESTE");

	}

	public Field[] getFieldsEntity() {
		return null;
	}

	public boolean verificarAnotacao(final String field, final String args) {
		return Arrays.asList(args.replace(" ", "").split(",")).contains(field);
	}

	public Properties getProperties() {
		return properties;
	}

	public void setProperties(final Properties properties) {
		this.properties = properties;
	}

	public String getTipoFiltroColunaId() {
		return tipoFiltroColunaId;
	}

	public void setTipoFiltroColunaId(final String tipoFiltroColunaId) {
		this.tipoFiltroColunaId = tipoFiltroColunaId;
	}

	public String[] getTiposFiltro() {
		return tiposFiltro;
	}

	public void setTiposFiltro(final String[] tiposFiltro) {
		this.tiposFiltro = tiposFiltro;
	}

	public String getInputFiltroId() {
		return inputFiltroId;
	}

	public void setInputFiltroId(final String inputFiltroId) {
		this.inputFiltroId = inputFiltroId;
	}

}
