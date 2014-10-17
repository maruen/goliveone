package br.com.golive.bean.page.cadastro.cadastros.empresas.cnae;

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
import br.com.golive.entity.empresas.cnae.grupo.GrupoModel;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@Label(name = "label.cadastroGrupo")
@ManagedBean
@ViewScoped
public class GrupoBean extends CadastroBeanRules<GrupoModel> {

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

	private List<GrupoModel> criarLista() {
		final List<GrupoModel> lista = new ArrayList<GrupoModel>();
		
		for (Integer i = 0; i < 10; i++){
			lista.add(new GrupoModel(new Long(i), new Date(), new Date(), "A", "Agricultura, Pecuária, Produção Florestal, Pesca e Aquicultura", "0000000001", "01", "Agricultura, Pecuária e Serviços Relacionados", "0000000001", "01.1", "Produção de lavouras temporárias"));
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