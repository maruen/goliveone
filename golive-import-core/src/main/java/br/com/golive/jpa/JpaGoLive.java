package br.com.golive.jpa;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;

import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 * @author guilherme.duarte
 * @param <T>
 *            classe da entidade que deverá ser extendida
 * @param <I>
 *            classe do id da entidade que foi extendida
 */

public abstract class JpaGoLive<T extends Serializable, I extends Object> {

	/**
	 * EntityManager da JPA
	 */
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
	 *         ponto de inje��o, para que possa funcionar a invers�o do controle
	 *         de depend�ncias
	 *         </p>
	 * 
	 * @param entityManager
	 */
	@SuppressWarnings("unchecked")
	protected JpaGoLive(final EntityManager entityManager) {
		super();
		this.entityManager = entityManager;

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
		entityManager.remove(entity);
	}

	/**
	 * @author guilherme.duarte
	 * 
	 *         <p>
	 *         M�todo responsavel por persistir Entidade
	 *         </p>
	 * 
	 * @param entity
	 *            entidade
	 */

	private void save(final T entity) {
		try {
			entityManager.persist(entity);
		} finally {
			if (entityManager.getTransaction().isActive()) {
				entityManager.getTransaction().rollback();
			}
		}
	}

	/**
	 * @author guilherme.duarte
	 * 
	 *         <p>
	 *         M�todo responsavel por realizar update/insert dependendo se o id
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
	 *         M�todo responsavel por retornar uma lista da entidade
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
	 *         M�todo responsavel por retornar uma lista da entidade
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
	 *         M�todo responsavel por carregar atributos LAZY
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
			save(classe);
		}
	}

	private boolean verifyAnnotation(final T classe) {
		return classe.getClass().isAnnotationPresent(Entity.class);
	}

}
