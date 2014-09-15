package br.com.golive.navigation.component;

import java.io.Serializable;

public class WelcomeMenuItem implements Serializable{

	private static final long serialVersionUID = 3446669491792825434L;

	private Long id;

	private boolean permission;

	private String keyLabel;

	private String keyLink;

	private String identifier;

	public WelcomeMenuItem() {
		super();
	}

	public WelcomeMenuItem(final Long id, final boolean permission, final String keyLabel, final String keyLink, final String identifier) {
		super();
		this.id = id;
		this.permission = permission;
		this.keyLabel = keyLabel;
		this.keyLink = keyLink;
		this.identifier = identifier;
	}

	public Long getId() {
		return id;
	}

	public void setId(final Long id) {
		this.id = id;
	}

	public boolean isPermission() {
		return permission;
	}

	public void setPermission(final boolean permission) {
		this.permission = permission;
	}

	public String getKeyLabel() {
		return keyLabel;
	}

	public void setKeyLabel(final String keyLabel) {
		this.keyLabel = keyLabel;
	}

	public String getKeyLink() {
		return keyLink;
	}

	public void setKeyLink(final String keyLink) {
		this.keyLink = keyLink;
	}

	public String getIdentifier() {
		return identifier;
	}

	public void setIdentifier(final String identifier) {
		this.identifier = identifier;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = (prime * result) + ((id == null) ? 0 : id.hashCode());
		result = (prime * result) + ((identifier == null) ? 0 : identifier.hashCode());
		result = (prime * result) + ((keyLabel == null) ? 0 : keyLabel.hashCode());
		result = (prime * result) + ((keyLink == null) ? 0 : keyLink.hashCode());
		result = (prime * result) + (permission ? 1231 : 1237);
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
		final WelcomeMenuItem other = (WelcomeMenuItem) obj;
		if (id == null) {
			if (other.id != null) {
				return false;
			}
		} else if (!id.equals(other.id)) {
			return false;
		}
		if (identifier == null) {
			if (other.identifier != null) {
				return false;
			}
		} else if (!identifier.equals(other.identifier)) {
			return false;
		}
		if (keyLabel == null) {
			if (other.keyLabel != null) {
				return false;
			}
		} else if (!keyLabel.equals(other.keyLabel)) {
			return false;
		}
		if (keyLink == null) {
			if (other.keyLink != null) {
				return false;
			}
		} else if (!keyLink.equals(other.keyLink)) {
			return false;
		}
		if (permission != other.permission) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "WelcomeMenuItem [id=" + id + ", permission=" + permission + ", keyLabel=" + keyLabel + ", keyLink=" + keyLink + ", identifier=" + identifier + "]";
	}

}
