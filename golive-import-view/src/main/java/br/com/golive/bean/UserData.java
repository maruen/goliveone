package br.com.golive.bean;

import java.util.ArrayList;
import java.util.List;

@Deprecated
public class UserData {

	private Long id;

	private String name;

	private List<String> telefone;

	public Long getId() {
		return id;
	}

	public void setId(final Long id) {
		this.id = id;
	}

	public UserData(final Long id, final String name) {
		super();
		this.id = id;
		this.name = name;
		telefone = new ArrayList<String>();
		telefone.add(id.toString() + name + "1234");
	}

	public String getName() {
		return name;
	}

	public void setName(final String name) {
		this.name = name;
	}

	public List<String> getTelefone() {
		return telefone;
	}

	public void setTelefone(final List<String> telefone) {
		this.telefone = telefone;
	}

}
