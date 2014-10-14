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
import br.com.golive.entity.empresas.cnae.classe.ClasseModel;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@Label(name = "label.cadastroClasse")
@ManagedBean
@ViewScoped
public class ClasseBean extends CadastroBeanRules<ClasseModel> {

	private static final long serialVersionUID = -5460720567498170177L;

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

	private List<ClasseModel> criarLista() {
		final List<ClasseModel> lista = new ArrayList<ClasseModel>();
		
		for (Integer i = 0; i < 10; i ++){
			lista.add(new ClasseModel(new Long(i), new Date(), new Date(), "A", "Agricultura, Pecuária, Produção Florestal, Pesca e Aquicultura", "000000001", "01", "Agricultura, Pecuária e Serviços Relacionados", "000000001", "01.1", "Produção de lavouras temporárias", "000000001", "01.11-3", "Cultivo de cereais"));
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
	
	public List<List<Object>> getAuditoriaLogDatatable() {
		return getRowsByColumns();
	}
	
	private List<List<Object>> getRowsByColumns() {
		final List<List<Object>> dataTableRows = new ArrayList<List<Object>>();

		for (int lines = 1; lines <= 5; lines++) {
			final List<Object> row = new ArrayList<Object>();
			for (int columns = 1; columns <= 20; columns++) {
				row.add(new String("XXXXXX"));
			}
			dataTableRows.add(row);
		}
		return dataTableRows;
	}
}
