package br.com.golive.entity.grupoprodutodepartamento.repositorio;

import java.util.List;

import org.hibernate.Criteria;

import br.com.golive.entity.grupoprodutodepartamento.model.GrupoProdutoDepartamento;
import br.com.golive.entity.grupoprodutodepartamento.model.GrupoProdutoDepartamentoId;
import br.com.golive.jpa.JpaGoLive;

public class GrupoProdutoDepartamentoJPA extends JpaGoLive<GrupoProdutoDepartamento, GrupoProdutoDepartamentoId> {

	public List<GrupoProdutoDepartamento> obterLista() {
		final Criteria criteria = createNativeCriteria();
		return extractListByCriteria(criteria);
	}

}
