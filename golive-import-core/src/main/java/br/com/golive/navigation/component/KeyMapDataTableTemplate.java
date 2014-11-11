package br.com.golive.navigation.component;

public class KeyMapDataTableTemplate {

	private String key;

	private boolean selectAll;

	public KeyMapDataTableTemplate(final String key, final boolean selectAll) {
		super();
		this.key = key;
		this.selectAll = selectAll;
	}

	public String getKey() {
		return key;
	}

	public void setKey(final String key) {
		this.key = key;
	}

	public boolean isSelectAll() {
		return selectAll;
	}

	public void setSelectAll(final boolean selectAll) {
		this.selectAll = selectAll;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = (prime * result) + ((key == null) ? 0 : key.hashCode());
		result = (prime * result) + (selectAll ? 1231 : 1237);
		return result;
	}

	@Override
	public boolean equals(final Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		final KeyMapDataTableTemplate other = (KeyMapDataTableTemplate) obj;
		if (key == null) {
			if (other.key != null) {
				return false;
			}
		} else if (!key.equals(other.key)) {
			return false;
		}
		if (selectAll != other.selectAll) {
			return false;
		}
		return true;
	}

}
