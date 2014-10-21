package br.com.golive.bean.page.cadastro.cadastros.regioes.paises;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroBeanRules;
import br.com.golive.entity.empresas.regioes.paises.paisesmoedas.model.PaisesMoedasModel;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@Label(name = "label.cadastroPaisesMoedas")
@ManagedBean
@ViewScoped
public class PaisesMoedasBean extends CadastroBeanRules<PaisesMoedasModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;
	
	@Inject
	@LabelSystemInjected
	private GoliveOneProperties labels;

	@Override
	@PostConstruct
	public void init() {
		super.init(criarLista());
		
		logger.info("Inicializando = {}", this.getClass().getName());
	}

	private List<PaisesMoedasModel> criarLista() {
		final List<PaisesMoedasModel> lista = new ArrayList<PaisesMoedasModel>();
		
		for (Integer i = 0; i <= 10; i++){
			lista.add(new PaisesMoedasModel(new Long(i), new Date(), new Date(), "AFN", "Afegane Afegão", "0000000010", "Afeganistão", "Afghnistan", "ښبثلشدهسفګشخ"));
		}
		
		return lista;
	}

	@Override
	protected Logger getLogger() {
		return logger;
	}
	
	@Override
	public void salvar(){
		super.salvar();
		
		logger.info("Salvando = {}");
	}
	
	public List<Object> getAuditoriaLogs(){
		ArrayList<Object> lista = new ArrayList<Object>();
		
		lista.add(new Object());
		lista.add(new Object());
		lista.add(new Object());
		
		return lista;
	}
}
