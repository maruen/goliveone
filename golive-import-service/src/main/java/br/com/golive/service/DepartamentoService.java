package br.com.golive.service;

import javax.ejb.Local;

import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.impl.DepartamentoServiceImpl;

@Local(DepartamentoServiceImpl.class)
public interface DepartamentoService extends Service<DepartamentoModel> {

}
