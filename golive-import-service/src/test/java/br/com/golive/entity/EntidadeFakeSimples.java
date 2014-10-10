package br.com.golive.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.com.golive.annotation.Fake;

@Fake
public class EntidadeFakeSimples {

	private Long id;
	private String nome;
	private Calendar data;

	public static List<EntidadeFakeSimples> initList() {
		final List<EntidadeFakeSimples> lista = new ArrayList<EntidadeFakeSimples>();
		Calendar cal;

		final SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		try {

			for (int i = 1; i < 10; i++) {
				cal = Calendar.getInstance();

				cal.setTime(sdf.parse(i + "/09/2014"));
				lista.add(new EntidadeFakeSimples(new Integer(i * 5).longValue(), "nome" + (i * 10), cal));

			}

			for (int i = 7; i < 20; i++) {
				cal = Calendar.getInstance();

				cal.setTime(sdf.parse(i + "/10/2014"));
				lista.add(new EntidadeFakeSimples(new Integer(i * 5).longValue(), "nome" + (i * 1), cal));

			}

			for (int i = 1; i < 30; i++) {
				cal = Calendar.getInstance();

				cal.setTime(sdf.parse(i + "/11/2014"));
				lista.add(new EntidadeFakeSimples(new Integer(i * 5).longValue(), "nome" + (i * 70), cal));

			}

			for (int i = 1; i < 5; i++) {
				cal = Calendar.getInstance();

				cal.setTime(sdf.parse(i + "/09/2014"));
				lista.add(new EntidadeFakeSimples(new Integer(i * 5).longValue(), "nome" + (i * 60), cal));

			}

			for (int i = 1; i < 9; i++) {
				cal = Calendar.getInstance();

				cal.setTime(sdf.parse(i + "/10/2014"));
				lista.add(new EntidadeFakeSimples(new Integer(i * 5).longValue(), "nome" + (i * 70), cal));

			}

			for (int i = 1; i < 12; i++) {
				cal = Calendar.getInstance();

				cal.setTime(sdf.parse(i + "/09/2014"));
				lista.add(new EntidadeFakeSimples(new Integer(i * 5).longValue(), "nome" + (i * 50), cal));

			}

		} catch (final ParseException e) {
			e.printStackTrace();
		}
		return lista;
	}

	public EntidadeFakeSimples() {
		super();
	}

	public EntidadeFakeSimples(final Long id, final String nome, final Calendar data) {
		super();
		this.id = id;
		this.nome = nome;
		this.data = data;
	}

	public Long getId() {
		return id;
	}

	public void setId(final Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(final String nome) {
		this.nome = nome;
	}

	public Calendar getData() {
		return data;
	}

	public void setData(final Calendar data) {
		this.data = data;
	}

	@Override
	public String toString() {
		final SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		return "id=" + id + ", nome=" + nome + ", data=" + sdf.format(data.getTime());
	}

}
