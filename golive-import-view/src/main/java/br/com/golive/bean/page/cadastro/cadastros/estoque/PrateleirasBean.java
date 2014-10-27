package br.com.golive.bean.page.cadastro.cadastros.estoque;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroBeanRules;
import br.com.golive.entity.estoque.prateleiras.model.PrateleirasModel;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@Label(name = "label.cadastroPrateleiras")
@ManagedBean
@ViewScoped
public class PrateleirasBean extends CadastroBeanRules<PrateleirasModel> {

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

	private List<PrateleirasModel> criarLista() {
		final List<PrateleirasModel> lista = new ArrayList<PrateleirasModel>();
		
		for (Integer i = 0; i < 10; i ++){
			lista.add(new PrateleirasModel(new Long(i), Calendar.getInstance(), Calendar.getInstance(), "000001", "00000000001", "Rua A", "0000000001", "Térreo"));
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
	
	public List<Object> getAuditoriaLogs() {
		ArrayList<Object> list = new ArrayList<Object>();
		
		list.add(new Object());
		list.add(new Object());
		list.add(new Object());

		return list;
	}
}
