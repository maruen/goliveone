package br.com.golive.entity.perfilconfiguracao.repositorio;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import br.com.golive.entity.perfilconfiguracao.model.ColunaPerfil;
import br.com.golive.entity.perfilconfiguracao.model.ColunaPerfilId;
import br.com.golive.jpa.JpaGoLive;

public class ColunaPerfilJpa extends JpaGoLive<ColunaPerfil, ColunaPerfilId> {

	public List<ColunaPerfil> obterColunaPerfil(final Long idUsuario, final String beanPageName, final String... tabela) {
		final Criteria criteria = createNativeCriteria();
		criteria.add(Restrictions.eq("id.idUsuario", idUsuario));
		criteria.add(Restrictions.in("id.tabela", tabela));
		criteria.add(Restrictions.eq("id.managedBeanName", beanPageName));
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
