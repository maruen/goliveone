package br.com.golive.constants;

public enum Operation {

	INSERT("Inserção"),
	UPDATE("Atualização"),
	DELETE("Exclusão");
	
	 
	private String descricao;
 
	private Operation(String s) {
		descricao = s;
	}
 
	public String getDescricao() {
		return descricao;
	}
	
	
	
	
	
}
