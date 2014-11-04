package br.com.golive.bean.page.cadastro.cadastros.regioes.paises;

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
import br.com.golive.entity.empresas.regioes.paises.paisbacen.model.PaisBacenModel;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@Label(name = "label.cadastroPaisesBacen")
@ManagedBean
@ViewScoped
public class PaisBacenBean extends CadastroBeanRules<PaisBacenModel> {

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

	private List<PaisBacenModel> criarLista() {
		final List<PaisBacenModel> lista = new ArrayList<PaisBacenModel>();
		
		for (Integer i = 0; i <= 10; i++){
			lista.add(new PaisBacenModel(new Long(i), Calendar.getInstance(), Calendar.getInstance(), "00132", "Afeganistão", "Afghnistan", "ښبثلشدهسفګشخ"));
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
