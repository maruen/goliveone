package br.com.golive.utils;

public enum ColorMenuPipe {

	BLUE(0L, "\\#0174DF"), GREEN(1L, "\\#31B404"), RED(2L, "\\#DF0101"), ORANGE(3L, "\\#FFBF00"), PINK(4L, "\\#F5A9BC");

	ColorMenuPipe(final Long id, final String hexa) {
		this.id = id;
		this.hexa = hexa;
	}

	private Long id;

	private String hexa;

	public Long getId() {
		return id;
	}

	public void setId(final Long id) {
		this.id = id;
	}

	public String getHexa() {
		return hexa;
	}

	public void setHexa(final String hexa) {
		this.hexa = hexa;
	}
}
