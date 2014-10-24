package br.com.golive.constants;

public enum PersistenceContextEmpresa {

	ACAO_PERSIANA(1L), TRADICAO_DISTRIB(2L);

	private Long id;

	private PersistenceContextEmpresa(final Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setId(final Long id) {
		this.id = id;
	}

	public static PersistenceContextEmpresa findById(final Long id) {
		for (final PersistenceContextEmpresa persistenceContextEmpresa : PersistenceContextEmpresa.values()) {
			if (persistenceContextEmpresa.getId().equals(id)) {
				return persistenceContextEmpresa;
			}
		}
		return null;
	}

}
