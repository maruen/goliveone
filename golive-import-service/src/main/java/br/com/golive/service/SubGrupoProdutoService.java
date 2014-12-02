package br.com.golive.service;

import java.util.List;

import javax.ejb.Local;

import br.com.golive.entity.empresas.empresa.model.Empresa;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.impl.SubGrupoProdutoServiceImpl;

@Local(SubGrupoProdutoServiceImpl.class)
public interface SubGrupoProdutoService extends Service<SubGrupoProdutoModel> {

	public List<SubGrupoProdutoModel> obterSubGrupoProdutoPorGrupo(final Usuario usuario, final Empresa empresa, final GrupoProdutosModel model);

}
