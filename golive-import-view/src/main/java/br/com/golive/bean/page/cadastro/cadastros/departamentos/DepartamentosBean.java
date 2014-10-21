package br.com.golive.bean.page.cadastro.cadastros.departamentos;

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
import br.com.golive.entity.departamentos.model.DepartamentosModel;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@Label(name = "label.cadastroDepartamentos")
@ManagedBean
@ViewScoped
public class DepartamentosBean extends CadastroBeanRules<DepartamentosModel> {

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

	private List<DepartamentosModel> criarLista() {
		final List<DepartamentosModel> lista = new ArrayList<DepartamentosModel>();
		
		for (Integer i = 0; i <= 10; i++){
			lista.add(new DepartamentosModel(new Long(i), new Date(), new Date(), "Vendas"));
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
