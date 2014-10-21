package br.com.golive.bean.page.cadastro.cadastros.empresas;

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
import br.com.golive.entity.empresas.naturezasjuridicas.NaturezasJuridicasModel;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@Label(name = "label.cadastroNaturezasJuridicas")
@ManagedBean
@ViewScoped
public class NaturezasJuridicasBean extends CadastroBeanRules<NaturezasJuridicasModel> {

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

	private List<NaturezasJuridicasModel> criarLista() {
		final List<NaturezasJuridicasModel> lista = new ArrayList<NaturezasJuridicasModel>();
		
		for (Integer i = 0; i <= 10; i ++){
			lista.add(new NaturezasJuridicasModel(new Long(i), Calendar.getInstance(), Calendar.getInstance(), "101-5", "Órgão Público do Poder Executivo Federal", "Administador", "05. 10 ou 16", "000000001", "1", "Administração Pública"));
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
	
	public List<String> completeText(String query) {
        List<String> results = new ArrayList<String>();
        
        for(int i = 0; i < 10; i++) {
            results.add(query + i + " - Entidades Empresariais");
        }
         
        return results;
    }
}