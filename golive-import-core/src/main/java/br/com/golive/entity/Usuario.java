package br.com.golive.entity;

import java.io.Serializable;
import java.util.Calendar;
import java.util.List;

import br.com.golive.utils.GoliveOneProperties;
import lombok.Data;

@Data
public class Usuario implements Serializable{

	private Long id;
	private String nome;
	private Calendar dataInclusao;
	private String senha;
	private List<String> empresas;
	private GoliveOneProperties labels;
}
