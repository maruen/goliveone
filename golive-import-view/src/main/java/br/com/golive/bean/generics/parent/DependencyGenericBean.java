package br.com.golive.bean.generics.parent;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import lombok.Getter;
import lombok.Setter;
import br.com.golive.annotation.DialogTable;
import br.com.golive.bean.component.GoliveDataTable;
import br.com.golive.entity.Model;

@ManagedBean
@ViewScoped
public abstract class DependencyGenericBean<T extends Model> implements Serializable {

	private static final long serialVersionUID = 1L;

	@Getter
	@Setter
	protected Map<String, GoliveDataTable<?>> filtrosMap;

	@PostConstruct
	public void postConstruct() {
		if (filtrosMap == null) {
			filtrosMap = new HashMap<String, GoliveDataTable<?>>();
		}
		for (final Field field : getClass().getDeclaredFields()) {
			if (field.isAnnotationPresent(DialogTable.class)) {
				try {
					field.setAccessible(true);
					filtrosMap.put(field.getAnnotation(DialogTable.class).fieldName(), (GoliveDataTable<?>) field.get(this));
				} catch (IllegalArgumentException | IllegalAccessException e) {
					e.printStackTrace();
				}
			}
		}
	}

}
