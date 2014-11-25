package br.com.golive.navigation.component;

import br.com.golive.constants.OrderColumnType;
import br.com.golive.entity.perfilconfiguracao.model.ColunaPerfil;

public class OrderByDynamicColumn {

	private ColunaPerfil coluna;

	private OrderColumnType order;

	public static OrderByDynamicColumn getInstance(final ColunaPerfil coluna) {
		final OrderByDynamicColumn novo = new OrderByDynamicColumn();
		novo.coluna = coluna;
		novo.order = OrderColumnType.ASC;
		return novo;
	}

	private OrderByDynamicColumn() {
		super();
	}

	public ColunaPerfil getColuna() {
		return coluna;
	}

	public void setColuna(final ColunaPerfil coluna) {
		this.coluna = coluna;
	}

	public OrderColumnType getOrder() {
		return order;
	}

	public void setOrder(final OrderColumnType order) {
		this.order = order;
	}
}
