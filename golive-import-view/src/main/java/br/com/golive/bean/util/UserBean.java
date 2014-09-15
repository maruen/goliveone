package br.com.golive.bean.util;

import java.io.Serializable;
import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Data;
import br.com.golive.exception.GoLiveException;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;
import br.com.golive.utils.JSFUtils;

@Data
@ViewScoped
@ManagedBean
public class UserBean implements Serializable {

	private static final long serialVersionUID = -7455127489110553168L;

	private String usuario = "Joaquim Silva";

	private String empresaSelecionda;

	private String data;

	private String diaSemana;

	@Inject
	@LabelSystemInjected
	private GoliveOneProperties properties;

	@PostConstruct
	public void init() {
		final Calendar cal = Calendar.getInstance();
		data = new SimpleDateFormat("dd/MM/yyyy").format(cal.getTime());
		diaSemana = new DateFormatSymbols().getWeekdays()[cal.get(Calendar.DAY_OF_WEEK)];

	}

	public boolean verificarPermissao() {
		System.out.println("Voltou");
		return true;
	}

	public void Logout() {
		System.out.println("TESTE");
	}

	public String labelAnotado(final Class<?> clazz, final String field){
		try {
			return properties.getField(JSFUtils.getLabelPageName(clazz.getDeclaredField(field)));
		} catch (NoSuchFieldException | SecurityException e) {
			e.printStackTrace();
			throw new GoLiveException("Erro ao Obter campo da classe");
		}
	}


	public String labelAnotado(final Class<?> clazz){
		return properties.getField(JSFUtils.getLabelPageName(clazz)); 
	}
}
