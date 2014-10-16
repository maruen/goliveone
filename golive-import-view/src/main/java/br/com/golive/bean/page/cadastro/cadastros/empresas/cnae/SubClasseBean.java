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
import br.com.golive.entity.empresas.cnae.subclasse.SubClasseModel;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@Label(name = "label.cadastroSubClasse")
@ManagedBean
@ViewScoped
public class SubClasseBean extends CadastroBeanRules<SubClasseModel> {
	
	private static final long serialVersionUID = 9063845163121425838L;

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

	private List<SubClasseModel> criarLista() {
		final List<SubClasseModel> lista = new ArrayList<SubClasseModel>();
		
		for (Integer i = 0; i < 10; i++){
			lista.add(new SubClasseModel(new Long(i), new Date(), new Date(), "0111-3/01", "Cultivo de Arroz", "0000000001", "A", "Agricultura, Pecuária, Produção Florestal, Pesca e Aquicultura", "0000000001", "01", "Agricultura, Pecuária e Serviços Relacionados", "0000000001", "01.1", "Produção de lavouras temporárias", "0000000001", "01.11-3", "Cultivo de cereais"));
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