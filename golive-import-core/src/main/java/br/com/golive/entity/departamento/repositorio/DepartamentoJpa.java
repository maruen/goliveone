package br.com.golive.entity.departamento.repositorio;

import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.jpa.JpaGoLive;

public class DepartamentoJpa extends JpaGoLive<DepartamentoModel, Long>{
	
	public void salvar(DepartamentoModel model){
		save(model);
	}
	
}
