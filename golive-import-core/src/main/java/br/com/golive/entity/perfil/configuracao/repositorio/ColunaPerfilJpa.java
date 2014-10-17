package br.com.golive.entity.perfil.configuracao.repositorio;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.com.golive.entity.perfil.configuracao.model.ColunaPerfil;
import br.com.golive.entity.perfil.configuracao.model.ColunaPerfilId;
import br.com.golive.jpa.JpaGoLive;

public class ColunaPerfilJpa extends JpaGoLive<ColunaPerfil, ColunaPerfilId> {

	public List<ColunaPerfil> obterColunaPerfil(final ColunaPerfilId id, final String table) {
		final Criteria criteria = createNativeCriteria();
		criteria.add(Restrictions.eq("usuario", id.getUsuario()));
		criteria.add(Restrictions.eq("empresa", id.getEmpresa()));
		criteria.add(Restrictions.eq("tabela", table));
		return extractListByCriteria(criteria);
	}

	@Override
	public void save(final ColunaPerfil colunaPerfil) {
		super.save(colunaPerfil);
	}

}
