package br.com.golive.entity.empresas.empresa.repositorio;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Subqueries;

import br.com.golive.entity.empresas.empresa.model.Empresa;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.entity.usuario.model.UsuarioDependencia;
import br.com.golive.jpa.JpaGoLive;

public class EmpresaJpa extends JpaGoLive<Empresa, Long> {

	public List<Empresa> obterEmpresasUsuario(final Usuario usuario) {
		final DetachedCriteria subquery = DetachedCriteria.forClass(UsuarioDependencia.class);
		subquery.add(Restrictions.eq("id.tbUsuario", usuario.getId()));
		subquery.setProjection(Property.forName("id.tbEmpresa"));
		final Criteria query = createNativeCriteria();
		query.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		query.add(Subqueries.propertyIn("id", subquery));
		return extractListByCriteria(query);
	}

}
