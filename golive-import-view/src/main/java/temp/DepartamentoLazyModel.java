package temp;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.primefaces.model.LazyDataModel;
import org.primefaces.model.SortOrder;

import br.com.golive.entity.departamento.model.DepartamentoModel;

public class DepartamentoLazyModel extends LazyDataModel<DepartamentoModel> {

	private static final long serialVersionUID = 1L;

	private final List<DepartamentoModel> datasource;

	public DepartamentoLazyModel(final List<DepartamentoModel> datasource) {
		this.datasource = datasource;
	}

	@Override
	public DepartamentoModel getRowData(final String rowKey) {
		for (final DepartamentoModel DepartamentoModel : datasource) {
			if (DepartamentoModel.getId().equals(rowKey)) {
				return DepartamentoModel;
			}
		}

		return null;
	}

	@Override
	public Object getRowKey(final DepartamentoModel DepartamentoModel) {
		return DepartamentoModel.getId();
	}

	@Override
	public List<DepartamentoModel> load(final int first, final int pageSize, final String sortField, final SortOrder sortOrder, final Map<String, Object> filters) {

		final List<DepartamentoModel> data = new ArrayList<DepartamentoModel>();

		// filter
		for (final DepartamentoModel DepartamentoModel : datasource) {
			boolean match = true;

			if (filters != null) {
				for (final Iterator<String> it = filters.keySet().iterator(); it.hasNext();) {
					try {
						final String filterProperty = it.next();
						final Object filterValue = filters.get(filterProperty);
						final String fieldValue = String.valueOf(DepartamentoModel.getClass().getField(filterProperty).get(DepartamentoModel));

						if ((filterValue == null) || fieldValue.startsWith(filterValue.toString())) {
							match = true;
						} else {
							match = false;
							break;
						}
					} catch (final Exception e) {
						match = false;
					}
				}
			}

			if (match) {
				data.add(DepartamentoModel);
			}
		}

		// sort
		if (sortField != null) {
			Collections.sort(data, new LazySorter(sortField, sortOrder));
		}

		// rowCount
		final int dataSize = data.size();
		this.setRowCount(dataSize);

		// paginate
		if (dataSize > pageSize) {
			try {
				return data.subList(first, first + pageSize);
			} catch (final IndexOutOfBoundsException e) {
				return data.subList(first, first + (dataSize % pageSize));
			}
		} else {
			return data;
		}
	}
}
