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
import br.com.golive.entity.empresas.fornecedores.model.FornecedoresModel;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@Label(name = "label.cadastroFornecedores")
@ManagedBean
@ViewScoped
public class FornecedoresBean extends CadastroBeanRules<FornecedoresModel> {

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
	
	private List<FornecedoresModel> criarLista() {
		final List<FornecedoresModel> lista = new ArrayList<FornecedoresModel>();
		
		for (Integer i = 0; i < 10; i++){
			lista.add(new FornecedoresModel(new Long(i), Calendar.getInstance(), Calendar.getInstance(), "09.363.143/0001-00", "111.222.333-11", "Alpex Alumínio", "Ind.Com.de Alumínios Alpex Ltda."));
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
		final ArrayList<Object> lista = new ArrayList<Object>();
		
		lista.add(new Object());
		lista.add(new Object());
		lista.add(new Object());

		return lista;
	}
	
	public List<String> tipoPessoaComplete(final String query) {
        final List<String> results = new ArrayList<String>();
        
        for(int i = 0; i < 10; i++) {
            results.add(query + i + " - Pessoa Jurídica");
        }
         
        return results;
    }
	
	public void salvarCnae(){
		logger.info("Salvar CNAE");
	}
	
	public void excluirCnae(){
		logger.info("Excluir CNAE");
	}
	
	public List<String> tipoLogradouroComplete(final String query) {
        final List<String> results = new ArrayList<String>();
        
        for(int i = 0; i < 10; i++) {
            results.add(query + i + " - Rua");
        }
         
        return results;
    }
	
	public void salvarPessoas(){
		logger.info("Salvar contato");
	}
	
	public void excluirPessoas(){
		logger.info("Excluir contato");
	}
	
	public List<Object> getCnaeDataTable(){
		ArrayList<Object> lista = new ArrayList<Object>();
		
		lista.add(new Object());
		lista.add(new Object());
		lista.add(new Object());
		
		return lista;
	}
	
	public List<Object> getPessoasDataTable(){
		ArrayList<Object> lista = new ArrayList<Object>();
		
		lista.add(new Object());
		lista.add(new Object());
		lista.add(new Object());
		
		return lista;
	}
	
	public void limparEntrega(){
		logger.info("Limpar dados entrega");
	}
	
	public List<Object> getCondicaoPagamentoDataTable(){
		ArrayList<Object> lista = new ArrayList<Object>();
		
		lista.add(new Object());
		lista.add(new Object());
		lista.add(new Object());
		
		return lista;
	}
	
	public void limparCobranca(){
		logger.info("Limpar dados cobrança");
	}
}