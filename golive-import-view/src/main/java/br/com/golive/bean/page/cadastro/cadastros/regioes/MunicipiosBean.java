package br.com.golive.bean.page.cadastro.cadastros.regioes;

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
import br.com.golive.entity.empresas.regioes.municipios.model.MunicipiosModel;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@Label(name = "label.cadastroMunicipios")
@ManagedBean
@ViewScoped
public class MunicipiosBean extends CadastroBeanRules<MunicipiosModel>{

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

	private List<MunicipiosModel> criarLista() {
		final List<MunicipiosModel> lista = new ArrayList<MunicipiosModel>();
		
		for (Integer i = 0; i <= 10; i++){
			lista.add(new MunicipiosModel(new Long(i), new Date(), new Date(), "3550308", "São Paulo", "0000000010", "Brasil", "0000000001", "35", "SP", "Região Sudeste"));
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
