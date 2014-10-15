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
import br.com.golive.entity.empresas.regioes.paises.paisesbacen.PaisesBacenModel;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@Label(name = "label.cadastroPaisesBacen")
@ManagedBean
@ViewScoped
public class PaisesBacenBean extends CadastroBeanRules<PaisesBacenModel> {

	private static final long serialVersionUID = 6286581844381749904L;

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

	private List<PaisesBacenModel> criarLista() {
		final List<PaisesBacenModel> lista = new ArrayList<PaisesBacenModel>();
		
		for (Integer i = 0; i <= 10; i++){
			lista.add(new PaisesBacenModel(new Long(i), new Date(), new Date(), "00132", "Afeganistão", "Afghnistan", "ښبثلشدهسفګشخ"));
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
	
	public List<List<Object>> getAuditoriaLogDatatable(){
		return getRowsByColumns();
	}

	private List<List<Object>> getRowsByColumns() {
		final List<List<Object>> dataTableRows = new ArrayList<List<Object>>();
		
		for (int lines = 1; lines <= 5; lines++){
			final List<Object> rows = new ArrayList<Object>();
			
			for (int columns = 1; columns <= 20; columns ++){
				rows.add(new String("XXX"));
			}
			
			dataTableRows.add(rows);
		}
		
		return dataTableRows;
	}
}
