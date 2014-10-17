package br.com.golive.bean.page.cadastro.cadastros.empresas;

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
import br.com.golive.entity.empresas.categoriasnaturezasjuridicas.CategoriasNaturezasJuridicasModel;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@Label(name = "label.cadastroCategoriasNaturezasJuridicas")
@ManagedBean
@ViewScoped
public class CategoriasNaturezasJuridicasBean extends CadastroBeanRules<CategoriasNaturezasJuridicasModel> {

	private static final long serialVersionUID = 5035092722189166834L;

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

	private List<CategoriasNaturezasJuridicasModel> criarLista() {
		final List<CategoriasNaturezasJuridicasModel> lista = new ArrayList<CategoriasNaturezasJuridicasModel>();
		
		for (Integer i = 0; i < 10; i++){
			lista.add(new CategoriasNaturezasJuridicasModel(new Long(i), new Date(), new Date(), 
					new Long(i), "Administração Pública"));
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