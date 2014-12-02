package br.com.golive.service;

import java.util.List;

import javax.ejb.Local;

import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.entity.empresas.empresa.model.Empresa;
import br.com.golive.entity.especialidades.model.CorProdutoModel;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.impl.CorProdutoServiceImpl;

@Local(CorProdutoServiceImpl.class)
public interface CorProdutoService extends Service<CorProdutoModel> {

	public List<CorProdutoModel> obterPorColecao(final Usuario usuario, final Empresa empresa, final ColecoesModel colecoesModel);

}
