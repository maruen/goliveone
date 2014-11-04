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
import br.com.golive.entity.empresa.empresa.model.EmpresaModel;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@Label(name = "label.cadastroEmpresa")
@ManagedBean
@ViewScoped
public class EmpresaBean extends CadastroBeanRules<EmpresaModel> {

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

	private List<EmpresaModel> criarLista() {
		final List<EmpresaModel> lista = new ArrayList<EmpresaModel>();

		for (Integer i = 0; i < 10; i++) {
			lista.add(new EmpresaModel(new Long(i), Calendar.getInstance(),
					Calendar.getInstance(), "09.363.143/0001-00",
					"111.222.333-11", "Ação Importadora",
					"Ação Persianas Importadora e Exportadora Ltda."));
		}

		return lista;
	}

	@Override
	protected Logger getLogger() {
		return logger;
	}

	@Override
	public void salvar() {
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

		for (int i = 0; i < 10; i++) {
			results.add(query + i + " - Pessoa Jurídica");
		}

		return results;
	}
	
	public void excluirCnae(){
		logger.info("Excluir CNAE");
	}
	
	public void salvarCnae(){
		logger.info("Salvar CNAE");
	}
	
	public List<String> tipoLogradouroComplete(final String query) {
		final List<String> results = new ArrayList<String>();

		for (int i = 0; i < 10; i++) {
			results.add(query + i + " - Rua");
		}

		return results;
	}
	
	public void limparEntrega(){
		logger.info("Limpar Entrega");
	}
	
	public void limparCobranca(){
		logger.info("Limpar Cobrança");
	}
	
	public void excluirPessoas(){
		logger.info("Excluir Pessoas");
	}
	
	public void salvarPessoas(){
		logger.info("Salvar Pessoas");
	}
	
	public List<String> regimeApuracaoComplete(final String query) {
		final List<String> results = new ArrayList<String>();

		for (int i = 0; i < 10; i++) {
			results.add(query + i + " - Simples Nacional");
		}

		return results;
	}
	
	public List<String> partilhaSimplesNacionalComplete(final String query) {
		final List<String> results = new ArrayList<String>();

		for (int i = 0; i < 10; i++) {
			results.add(query + i + " - Anexo I - Partilha do Simples Nacional - Comércio");
		}

		return results;
	}
}
