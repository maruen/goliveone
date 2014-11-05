package br.com.golive.service;

import java.util.List;

import javax.ejb.Local;

import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.impl.SubGrupoProdutoServiceImpl;

@Local(SubGrupoProdutoServiceImpl.class)
public interface SubGrupoProdutoService {

	public void salvar(SubGrupoProdutoModel model);
	public void alterar(SubGrupoProdutoModel model);
	public List<SubGrupoProdutoModel> listarTodos();
	public List<SubGrupoProdutoModel> listarPorFiltro(String... args);
	public List<SubGrupoProdutoModel> obterSubGrupoProdutoPorGrupo(GrupoProdutosModel model);
	public void excluir(SubGrupoProdutoModel model);
	public List<AuditoriaModel> getAuditoriaLogs(SubGrupoProdutoModel model);
	public String getUsuarioLog(SubGrupoProdutoModel model);
	public void refresh(SubGrupoProdutoModel model);
	 

}
