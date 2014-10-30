package br.com.golive.service;

import java.util.List;

import javax.ejb.Local;

import br.com.golive.entity.Model;
import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.impl.AuditoriaServiceImpl;

@Local(AuditoriaServiceImpl.class)
public interface AuditoriaService {

	public void registrarInsert(Model model, Usuario usuario);

	public void registrarUpdate(Model model, Usuario usuario);

	public void registrarDelete(Model model, Usuario usuario);

	public List<AuditoriaModel> getAuditoriaLogs(Model model);

}
