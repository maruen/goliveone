package br.com.golive.entity.database.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import br.com.golive.entity.Model;

@Entity
@Table(name = "tbDatabase")
public class DataBase extends Model {

	@Transient
	private static final long serialVersionUID = 9104458977797263269L;

	@Column(name = "Database")
	private String dataBaseName;

	public String getDataBaseName() {
		return dataBaseName;
	}

	public void setDataBaseName(final String dataBaseName) {
		this.dataBaseName = dataBaseName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}