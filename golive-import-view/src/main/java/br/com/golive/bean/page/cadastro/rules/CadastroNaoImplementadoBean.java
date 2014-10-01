package br.com.golive.bean.page.cadastro.rules;

import java.util.Map;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.filter.FilterManager;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@ManagedBean
@ViewScoped
public class CadastroNaoImplementadoBean extends CadastroBeanRules<Object> {

	private static final long serialVersionUID = 8476998410907807686L;

	private static final String labelPagina = "msg.paginaNaoImplementada";

	@Inject
	private Logger logger;

	@Inject
	@LabelSystemInjected
	@Deprecated
	private GoliveOneProperties labels;

	@Override
	@PostConstruct
	public void init() {
		logger.info("Inicializando = {}", this.getClass().getName());
		setImplementada(false);
		fluxo = getFluxoListagem();
	}

	@Override
	public void incluir() {
		super.incluir();
		logger.info("Inclusao de registro");
	}

	@Override
	public void excluir() {
		super.excluir();
	}

	@Override
	public void editarRegistro() {
		super.editarRegistro();
	}

	@Override
	public void imprimir() {
		logger.info("Imprimindo = {} ");
	}

	@Override
	public void exportarPdf() {
		logger.info("Exportando pdf = {} ");
	}

	@Override
	public void exportarXls() {
		logger.info("Exportando xls = {} ");
	}

	@Override
	public void salvar() {
		super.salvar();
		logger.info("Salvando = {} ");
	}

	@Override
	public void cancelar() {
		super.cancelar();
	}

	public static String getLabelpagina() {
		return labelPagina;
	}

	@Override
	public Map<String, Object> obterParametrosRelatório() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isSelecionado() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void inicializarFiltros() {
		// TODO Auto-generated method stub

	}

	@Override
	protected Logger getLogger() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FilterManager<Object> getFilterManager() {
		// TODO Auto-generated method stub
		return null;
	}

}
