package br.com.golive.bean.page.cadastro.cadastros.empresas.cnae;

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
import br.com.golive.entity.empresas.cnae.cnaeimpeditivosimpesnacional.model.CnaeImpeditivoSimplesNacionalModel;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@Label(name = "label.cadastroCnaesImpeditivosSimplesNacional")
@ManagedBean
@ViewScoped
public class CnaeImpeditivoSimplesNacionalBean extends CadastroBeanRules<CnaeImpeditivoSimplesNacionalModel> {

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

	private List<CnaeImpeditivoSimplesNacionalModel> criarLista() {
		final List<CnaeImpeditivoSimplesNacionalModel> lista = new ArrayList<CnaeImpeditivoSimplesNacionalModel>();
		
		for (Integer i = 0; i < 10; i++){
			lista.add(new CnaeImpeditivoSimplesNacionalModel(new Long(i), Calendar.getInstance(), Calendar.getInstance(), "0000000035", "0111-3/01", "Cultivo de arroz"));
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