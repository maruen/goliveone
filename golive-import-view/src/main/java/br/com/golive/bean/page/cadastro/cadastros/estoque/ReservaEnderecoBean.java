package br.com.golive.bean.page.cadastro.cadastros.estoque;

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
import br.com.golive.entity.estoque.reservaendereco.model.ReservaEnderecoModel;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@Label(name = "label.cadastroReservaEndereco")
@ManagedBean
@ViewScoped
public class ReservaEnderecoBean extends CadastroBeanRules<ReservaEnderecoModel> {

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

	private List<ReservaEnderecoModel> criarLista() {
		final List<ReservaEnderecoModel> lista = new ArrayList<ReservaEnderecoModel>();
		
		for (Integer i = 0; i < 10; i ++){
			lista.add(new ReservaEnderecoModel(new Long(i), Calendar.getInstance(), Calendar.getInstance(), "H25-LAM-O25-E0.18", "Lâmina de Alumínio 25mm X 0.18mm", "0000000001", "000001", "000001", "Rua A", "000001", "Térreo", "000001", "Acessórios Parte e Peças para  Persianas", "000001", "Lâminas em Alumínios 25mm", "000001", "Lâminas em Alumínio 25mm X 0.18mm"));
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
