package br.com.golive.entity.empresas.empresa.repositorio;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

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

	@Inject
	protected EmpresaJpa(final EntityManager entityManager) {
		super(entityManager);
	}

	public List<Empresa> obterEmpresasUsuario(final Usuario usuario) {

		final DetachedCriteria criteriaEmpresas = DetachedCriteria.forClass(Empresa.class);
		criteriaEmpresas.setProjection(Property.forName("id"));

		final Criteria criteriaDependenciasUsuario = createCriteria(UsuarioDependencia.class);
		criteriaDependenciasUsuario.add(Restrictions.eq("id.usuario", usuario));
		criteriaDependenciasUsuario.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		criteriaDependenciasUsuario.add(Subqueries.propertyIn("empresa", criteriaEmpresas));
		return criteriaDependenciasUsuario.list();
	}

}
