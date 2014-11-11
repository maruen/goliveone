package br.com.golive.entity.grupoprodutos.repositorio;

import static org.hibernate.FetchMode.EAGER;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.criterion.Restrictions;

import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.jpa.JpaGoLive;

public class GrupoProdutoJPA extends JpaGoLive<GrupoProdutosModel, Long> {

	@SuppressWarnings("deprecation")
	public List<GrupoProdutosModel> obterLista() {
		final Criteria criteria = createNativeCriteria();
		criteria.setFetchMode("departamentoModel", FetchMode.EAGER);
		return extractListByCriteria(criteria);
	}

	public void removeModel(final GrupoProdutosModel model) {
		entityManager.remove(entityManager.contains(model) ? model : entityManager.merge(model));
	}

	@SuppressWarnings("deprecation")
	public List<GrupoProdutosModel> obterListaPorDepartamento(final DepartamentoModel departamentoModel) {
		final Criteria criteria = createNativeCriteria();
		criteria.add(Restrictions.eq("departamentoModel", departamentoModel));
		criteria.setFetchMode("departamentoModel", EAGER);
		return extractListByCriteria(criteria);
	}

	@SuppressWarnings("deprecation")
	public List<GrupoProdutosModel> obterListaPorDepartamentoId(Long departamentoId) {
		final Criteria criteria = createNativeCriteria();
		criteria.add(Restrictions.eq("departamentoModel.Id", departamentoId));
		criteria.setFetchMode("departamentoModel", EAGER);
		return extractListByCriteria(criteria);
	}
	
	
	
}
