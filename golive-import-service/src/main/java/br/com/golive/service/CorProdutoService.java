package br.com.golive.service;

import java.util.List;

import javax.ejb.Local;

import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.entity.especialidades.model.CorProdutoModel;
import br.com.golive.impl.CorProdutoServiceImpl;

@Local(CorProdutoServiceImpl.class)
public interface CorProdutoService {

	public void salvar(CorProdutoModel model);

	public void alterar(CorProdutoModel model);

	public List<CorProdutoModel> listarTodos();

	public List<CorProdutoModel> listarPorFiltro(String... args);

	public List<CorProdutoModel> obterPorColecao(ColecoesModel colecoesModel);

	public void excluir(CorProdutoModel model);

	public List<AuditoriaModel> getAuditoriaLogs(CorProdutoModel model);

	public String getUsuarioLog(CorProdutoModel model);

	public void refresh(CorProdutoModel model);

}
