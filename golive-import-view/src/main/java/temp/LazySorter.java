package temp;

import java.util.Comparator;

import org.primefaces.model.SortOrder;

import br.com.golive.entity.departamento.model.DepartamentoModel;

public class LazySorter implements Comparator<DepartamentoModel> {

	private final String sortField;

	private final SortOrder sortOrder;

	public LazySorter(final String sortField, final SortOrder sortOrder) {
		this.sortField = sortField;
		this.sortOrder = sortOrder;
	}

	@Override
	public int compare(final DepartamentoModel car1, final DepartamentoModel car2) {
		try {
			final Object value1 = DepartamentoModel.class.getField(sortField).get(car1);
			final Object value2 = DepartamentoModel.class.getField(sortField).get(car2);

			final int value = ((Comparable) value1).compareTo(value2);

			return SortOrder.ASCENDING.equals(sortOrder) ? value : -1 * value;
		} catch (final Exception e) {
			throw new RuntimeException();
		}
	}
}
