package br.com.golive.bean.component;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import lombok.Getter;
import lombok.Setter;
import br.com.golive.bean.generics.parent.GenericFilterBean;
import br.com.golive.entity.Model;
import br.com.golive.navigation.component.LazyModel;

@ManagedBean
@ViewScoped
public class GoliveDataTable<T extends Model> {

	@Getter
	@Setter
	private LazyModel<T> dataList;

	@Getter
	@Setter
	private GenericFilterBean<T> filtro;
}
