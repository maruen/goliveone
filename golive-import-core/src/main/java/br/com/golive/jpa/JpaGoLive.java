package br.com.golive.jpa;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.Table;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import br.com.golive.constants.Constantes;
import br.com.golive.entity.Model;
import br.com.golive.entity.auditoria.model.AuditoriaModel;

/**
 * @author guilherme.duarte
 * @param <T>
 *            classe da entidade que deverá ser extendida
 * @param <I>
 *            classe do id da entidade que foi extendida
 */

public abstract class JpaGoLive<T extends Model, I extends Object> {

	/**
	 * EntityManager da JPA
	 */
	@PersistenceContext(name = "golive-one-PU")
	protected EntityManager entityManager;
	
	/**
	 * Classe de entidade extendida
	 */
	private Class<T> persistentClass;

	/**
	 * @author guilherme.duarte
	 * 
	 *         <p>
	 *         Construtor protected obriga o objeto extendido a implementar um
	 *         ponto de injeção, para que possa funcionar a inversão do controle
	 *         de dependências
	 *         </p>
	 * 
	 * @param entityManager
	 */
	@SuppressWarnings("unchecked")
	protected JpaGoLive() {
		super();

		Type type = getClass().getGenericSuperclass();
		if (!(type instanceof ParameterizedType)) {
			type = this.getClass().getSuperclass().getGenericSuperclass();
		}
		try {
			persistentClass = (Class<T>) ((ParameterizedType) type).getActualTypeArguments()[0];
		} catch (final java.lang.ClassCastException e) {
			type = this.getClass().getSuperclass().getGenericSuperclass();
			persistentClass = (Class<T>) ((ParameterizedType) type).getActualTypeArguments()[0];
		}

	}

	/**
	 * @author guilherme.duarte
	 * 
	 *         <p>
	 *         Cria um criterio de acordo com a classe de entidade extendida
	 *         </p>
	 * 
	 * @param entityClass
	 * @return {@link Criteria}
	 */

	public Criteria createCriteria(final Class<T> entityClass) {
		final Session hibernateSession = entityManager.unwrap(Session.class);
		final Criteria criteria = hibernateSession.createCriteria(entityClass);
		return criteria;
	}

	/**
	 * @author guilherme.duarte
	 * 
	 *         Synchroniza contexto de persistencia.
	 */
	public void flush() {
		entityManager.flush();
	}

	/**
	 * @author guilherme.duarte
	 * 
	 *         <p>
	 *         Método responsavel por buscar Entidade por Id
	 *         </p>
	 * 
	 * @param id
	 *            id da Entidade
	 * @return Entidade
	 */
	protected T findById(final I id) {
		return entityManager.find(persistentClass, id);
	}

	/**
	 * @author guilherme.duarte
	 * 
	 *         <p>
	 *         Método responsavel por buscar lista da entidade injetada.
	 *         </p>
	 * 
	 * @return Entidade
	 */
	@SuppressWarnings("unchecked")
	public List<T> findAll() {
		final Criteria criteria = createCriteria(persistentClass);
		return criteria.list();
	}
	
	
	@SuppressWarnings("unchecked")
	public List<T> findByFilter(String... args ) {
		final Criteria criteria = createCriteria(persistentClass).setMaxResults(Constantes.MAX_RESULTS);
		return criteria.list();
	}

	/**
	 * @author guilherme.duarte
	 * 
	 *         <p>
	 *         Método responsavel por excluir Entidade
	 *         </p>
	 * 
	 * @param entity
	 *            entidade
	 */
	public void delete(final T entity) {
		T objectToRemove = entityManager.merge(entity);
		entityManager.remove(objectToRemove);
	}

	/**
	 * @author guilherme.duarte
	 * 
	 *         <p>
	 *         Método responsavel por persistir Entidade
	 *         </p>
	 * 
	 * @param entity
	 *            entidade
	 */
	public void save(final T entity) {
		try{
			entityManager.persist(entity);
			logAuditoria(entity); //TODO TRATAR QUANDO FOR UPDATE
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	/**
	 * @author guilherme.duarte
	 * 
	 *         <p>
	 *         Método responsavel por realizar update/insert dependendo se o id
	 *         da entidade Entidade
	 *         </p>
	 * 
	 * @param entity
	 *            entidade
	 */

	protected T merge(final T entity) {
		return entityManager.merge(entity);
	}

	/**
	 * @author guilherme.duarte
	 * 
	 *         <p>
	 *         Método responsavel por retornar uma lista da entidade
	 *         </p>
	 * 
	 * @param queryName
	 *            , resultClass
	 * @return {@link List}
	 */
	@SuppressWarnings("unchecked")
	protected List<T> findByNamedQuery(final String queryName, final Class<T> resultClass) {
		final Query query = entityManager.createNamedQuery(queryName, resultClass);
		return query.getResultList();
	}

	/**
	 * @author guilherme.duarte
	 * 
	 *         <p>
	 *         Método responsavel por retornar uma lista da entidade
	 *         </p>
	 * 
	 * @param queryName
	 * @return {@link List}
	 */
	@SuppressWarnings("unchecked")
	protected List<T> findByNamedQuery(final String queryName) {
		final Query query = entityManager.createNamedQuery(queryName);
		return query.getResultList();
	}

	public EntityManager getEntityManager() {
		return entityManager;
	}

	/**
	 * @author guilherme.duarte
	 * 
	 *         <p>
	 *         Método responsavel por carregar atributos LAZY
	 *         </p>
	 * 
	 * @param entidade
	 * @return {@link List}
	 */
	protected void initializate(final Object lazyAtrybute) {
		Hibernate.initialize(lazyAtrybute);
	}

	@SuppressWarnings("unchecked")
	public List<T> findByAtrbuttes(final Map<String, Object> atributs) {
		final Criteria criteria = createCriteria(persistentClass);
		for (final String key : atributs.keySet()) {
			criteria.add(Restrictions.eq(key, atributs.get(key)));
		}
		return criteria.list();

	}

	@Override
	public String toString() {
		return getClass().getSimpleName() + " [ persistentClass=" + (persistentClass != null ? persistentClass.getName() : "null") + "]";
	}

	public void insert(final T classe) {
		if (verifyAnnotation(classe)) {
			save(classe);
		}
	}

	public void update(final T classe) {
		if (verifyAnnotation(classe)) {
			merge(classe);
		}
	}

	private boolean verifyAnnotation(final T classe) {
		return classe.getClass().isAnnotationPresent(Entity.class);
	}
	

	public void logAuditoria(T model){
		
		AuditoriaModel auditoria = new AuditoriaModel();
		auditoria.setDataHoraOcorrencia(new Date());
		auditoria.setSystemDateTime(new Date());
		auditoria.setFormularioNome("Cadastro de Departamento de Produtos");
		auditoria.setUsuarioSistemaAcao("Inserção");
		auditoria.setUsuarioSistemaInformacaoAnterior("");
		auditoria.setUsuarioSistemaInformacaoAtual("Inserção do registro: " + model.toString());
				
		entityManager.persist(auditoria);
		
		Table table = model.getClass().getAnnotation(Table.class);
		
		String sqlString =  "INSERT INTO tbAuditoria_" + table.name() + "  VALUES (?,?,?)";
		Query query 	 =   entityManager.createNativeQuery(sqlString);
		
		query.setParameter(1, auditoria.getId());
		query.setParameter(2, model.getUsuario().getId());
		query.setParameter(3, model.getId());
		query.executeUpdate();
	
	};
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List getAuditoriaLogs(Class clazz) {
		List<AuditoriaModel> results = new ArrayList<AuditoriaModel>();
		
		String sqlString1 		=  "SELECT tbAuditoria_Id FROM tbAuditoria_" + ((Table) clazz.getAnnotation(Table.class)).name();
		Query query1 			=  entityManager.createNativeQuery(sqlString1);
		List<Long> 	ids 		=  query1.getResultList();
		
		if (ids != null && ids.size() > 0) {
			Query query2 =  entityManager.createQuery("SELECT auditoriaModel FROM AuditoriaModel auditoriaModel WHERE auditoriaModel.id IN (" + explode(ids) + ")" , AuditoriaModel.class);
			results 	 = query2.getResultList();
		}

		return results; 
		
	}
	
	@SuppressWarnings("rawtypes")
	private String explode(List<Long> ids) {
		StringBuffer sbf = new StringBuffer();
		Iterator it = ids.iterator();
		while (it.hasNext()) {
			sbf.append(it.next()).append(",");	
		}
		sbf.replace(sbf.lastIndexOf(","), sbf.length(), "");
		return sbf.toString();
	}

	
	
	
}
