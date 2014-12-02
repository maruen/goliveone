package br.com.golive.service;

import java.util.List;

import javax.ejb.Local;

import br.com.golive.entity.Model;
import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.empresas.empresa.model.Empresa;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.impl.AuditoriaServiceImpl;

@Local(AuditoriaServiceImpl.class)
public interface AuditoriaService {

	public void registrarInsert(final Usuario usuario, final Empresa empresa, final Model model);

	public void registrarUpdate(final Usuario usuario, final Empresa empresa, final Model model);

	public void registrarDelete(final Usuario usuario, final Empresa empresa, final Model model);

	public List<AuditoriaModel> getAuditoriaLogs(final Usuario usuario, final Empresa empresa, final Model model);

}
