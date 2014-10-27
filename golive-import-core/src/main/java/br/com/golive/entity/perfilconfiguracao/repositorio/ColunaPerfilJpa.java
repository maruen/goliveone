package br.com.golive.entity.perfilconfiguracao.repositorio;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;

import br.com.golive.entity.perfilconfiguracao.model.ColunaPerfil;
import br.com.golive.entity.perfilconfiguracao.model.ColunaPerfilId;
import br.com.golive.jpa.JpaGoLive;

public class ColunaPerfilJpa extends JpaGoLive<ColunaPerfil, ColunaPerfilId> {

	public List<ColunaPerfil> obterColunaPerfil() {
		final Criteria criteria = createNativeCriteria();
		criteria.addOrder(Order.asc("ordem"));
		return extractListByCriteria(criteria);
	}

	@Override
	public void save(final ColunaPerfil colunaPerfil) {
		super.save(colunaPerfil);
	}

	public ColunaPerfil obterPorId(final ColunaPerfilId id) {
		return findById(id);
	}
}
