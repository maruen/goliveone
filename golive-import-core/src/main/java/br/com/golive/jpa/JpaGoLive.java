package br.com.golive.jpa;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.engine.transaction.jta.platform.spi.JtaPlatformException;
import org.slf4j.Logger;

import br.com.golive.constants.Constantes;
import br.com.golive.entity.Model;
import br.com.golive.exception.GoLiveException;

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
	@Inject
	protected EntityManager entityManager;

	@Inject
	private Logger logger;
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

	public Criteria createCriteria(final Class<?> entityClass) {
		final Session hibernateSession = entityManager.unwrap(Session.class);
		final Criteria criteria = hibernateSession.createCriteria(entityClass);
		return criteria;
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

	public Criteria createNativeCriteria() {
		try {
			final Session hibernateSession = entityManager.unwrap(Session.class);
			final Criteria criteria = hibernateSession.createCriteria(persistentClass);
			return criteria;
		} catch (final JtaPlatformException e) {
			logger.error("Erro ao obter criteria");
			e.printStackTrace();
			throw new GoLiveException("Erro ao Obter Criteria");
		}

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

	@SuppressWarnings("deprecation")
	public T findByIdWithLazys(final Long id, final String... lazyFieldName) {
		final Criteria criteria = createNativeCriteria();
		criteria.add(Restrictions.eq("id", id));
		for (final String field : lazyFieldName) {
			criteria.setFetchMode(field, FetchMode.EAGER);
		}
		return extractSingleResultByCriteria(criteria);
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
	 *         Método responsavel por buscar lista da entidade injetada.
	 *         </p>
	 * 
	 * @return Entidade
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	public List<T> findAllWithoutLazy(final String... lazyFields) {
		final Criteria criteria = createCriteria(persistentClass);
		for (final String field : lazyFields) {
			criteria.setFetchMode(field, FetchMode.EAGER);
		}

		final List<T> results = criteria.list();
		for (final T entity : results) {
			refresh(entity);
		}

		return results;
	}

	@SuppressWarnings("unchecked")
	public List<T> findByFilter(final String... args) {
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
		try {
			entityManager.joinTransaction();
			entityManager.merge(entity);
			entityManager.remove(entity);
		} catch (final Exception e) {
			logger.error("Erro ao deletar");
			e.printStackTrace();
		}
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
		try {
			if (!entityManager.isJoinedToTransaction()) {
				entityManager.joinTransaction();
			}

			entityManager.persist(entity);
		} catch (final Exception e) {
			e.printStackTrace();
		}
	}

	public void refresh(final T entity) {
		try {
			entityManager.refresh(entity);
		} catch (final Exception e) {
			e.printStackTrace();
		}
	}

	public void refresh(final Model entity) {
		try {
			entityManager.refresh(entity);
		} catch (final Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @author Maruen Mehana
	 * 
	 *         <p>
	 *         Método responsavel por persistir uma lista de entidades
	 *         </p>
	 * 
	 * @param List
	 *            <entity> entidade
	 */
	public void saveAll(final List<T> entityList) {
		for (final T entity : entityList) {
			save(entity);
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
		entityManager.joinTransaction();
		return entityManager.merge(entity);
	}

	/**
	 * @author maruen
	 * 
	 * @param entity
	 */
	public void detach(final T entity) {
		entityManager.detach(entity);
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

	@SuppressWarnings("unchecked")
	protected List<T> extractListByCriteria(final Criteria criteria) {
		final List<T> result = criteria.list();
		for (final T entity : result) {
			entityManager.refresh(entity);
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	protected <T> T extractSingleResultByCriteria(final Criteria criteria) {
		return (T) criteria.uniqueResult();
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
	public List<T> findByAtributtes(final Map<String, Object> atributs) {
		final Criteria criteria = createNativeCriteria();
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

	public Query createQuery(final String sql, final Class<?> clazz) {
		return entityManager.createQuery(sql, clazz);
	}

	public Query createNativeQuery(final String query) {
		return entityManager.createNativeQuery(query);
	}

	public Query createQueryByClassWithSql(final String sql, final Class<?> clazz) {
		return entityManager.createNativeQuery(sql, clazz);
	}

	private boolean verifyAnnotation(final T classe) {
		return classe.getClass().isAnnotationPresent(Entity.class);
	}

}
