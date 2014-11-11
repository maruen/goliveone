package br.com.golive.bean.page.cadastro.rules;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.HashMap;

import javax.annotation.PostConstruct;
import javax.persistence.Table;

import org.slf4j.Logger;

import br.com.golive.annotation.EntityClass;
import br.com.golive.annotation.Filter;
import br.com.golive.entity.Model;
import br.com.golive.entity.perfilconfiguracao.model.ColunaPerfil;
import br.com.golive.filter.GoliveFilter;
import br.com.golive.utils.ServiceUtils;
import br.com.golive.utils.Utils;

public abstract class CadastroGenericFilterBean<T extends Model> implements Serializable {

	private static final long serialVersionUID = -6492743944840059806L;

	protected abstract Logger getLogger();

	private HashMap<String, Field> mapFilters;

	@PostConstruct
	public void postConstruct() {
		setMapFilters(new HashMap<String, Field>());
		for (final Field field : this.getClass().getDeclaredFields()) {
			if ((field.isAnnotationPresent(Filter.class)) && (field.isAnnotationPresent(EntityClass.class))) {
				if (field.getAnnotation(EntityClass.class).classe().isAnnotationPresent(Table.class)) {
					getMapFilters().put(ServiceUtils.getKeyByField(field), field);
				}
			}
		}
	}

	@SuppressWarnings("rawtypes")
	public GoliveFilter getFilter(final ColunaPerfil coluna) {
		final GoliveFilter filtro = null;
		final Field field = ServiceUtils.getFieldByColumn(coluna, getMapFilters());

		if ((coluna != null) && (!coluna.getId().getColuna().isEmpty())) {
			try {
				return (GoliveFilter) Utils.invoke(field, this);
			} catch (final Exception e) {
				getLogger().warn("Filtro nao existe na classe");
			}
		}
		return filtro;
	}

	public HashMap<String, Field> getMapFilters() {
		return mapFilters;
	}

	public void setMapFilters(final HashMap<String, Field> mapFilters) {
		this.mapFilters = mapFilters;
	}

}
