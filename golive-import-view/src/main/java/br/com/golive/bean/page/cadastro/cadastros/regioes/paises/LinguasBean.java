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
import br.com.golive.entity.empresas.regioes.paises.linguas.LinguasModel;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@Label(name = "label.cadastroLinguas")
@ManagedBean
@ViewScoped
public class LinguasBean extends CadastroBeanRules<LinguasModel> {
	
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

	private List<LinguasModel> criarLista() {
		final List<LinguasModel> lista = new ArrayList<LinguasModel>();
		
		for (Integer i = 0; i <= 10; i++){
			lista.add(new LinguasModel(new Long(i), new Date(), new Date(), "ps", "Pachto", "Pashto", "څشزافخ"));
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
