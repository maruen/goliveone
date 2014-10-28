package br.com.golive.bean.page.cadastro.cadastros.empresas.usuarios;

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
import br.com.golive.entity.empresas.usuarios.model.UsuariosModel;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@Label(name = "label.cadastroUsuarios")
@ManagedBean
@ViewScoped
public class UsuariosBean extends CadastroBeanRules<UsuariosModel> {

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

	private List<UsuariosModel> criarLista() {
		final List<UsuariosModel> lista = new ArrayList<UsuariosModel>();
		
		for (Integer i = 0; i < 10; i ++){
			lista.add(new UsuariosModel(new Long(i), Calendar.getInstance(), Calendar.getInstance(), "roberto.tradicao@gmail.com", "000001", "Roberto Costa", "000001", "Persianas New York", "000001", "China Export"));
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
	
	public void salvarContato(){
		
	}
	
	public void excluirContato(){
		
	}
	
	public List<String> completeText(String query) {
        List<String> results = new ArrayList<String>();
        
        for(int i = 0; i < 10; i++) {
            results.add(query + i + " - Roberto de Andrade da Costa");
        }
         
        return results;
    }
}
