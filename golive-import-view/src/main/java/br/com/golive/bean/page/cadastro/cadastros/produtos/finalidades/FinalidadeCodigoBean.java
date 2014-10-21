package br.com.golive.bean.page.cadastro.cadastros.produtos.finalidades;

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
import br.com.golive.entity.produto.model.ProdutoModel;
import br.com.golive.filter.FilterManager;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@ManagedBean
@ViewScoped
@Label(name = "label.cadastros.produtos.finalidades.finalidadeCodigo")
public class FinalidadeCodigoBean extends CadastroBeanRules<ProdutoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;

	@Inject
	@LabelSystemInjected
	private GoliveOneProperties labels;
	private Calendar data;

	@Override
	@PostConstruct
	public void init() {
		super.init(criarList());
		logger.info("Inicializando = {}", this.getClass().getName());

		fluxo = getFluxoListagem();
		data = Calendar.getInstance();
		fluxo = getFluxoListagem();
		data = Calendar.getInstance();
	}

	@Override
	public void incluir() {
		super.incluir();
		logger.info("Inclusao de registro");
		if (registro != null) {
			registro = null;
		}
	}

	@Override
	public void excluir() {
		if (isSelecionado()) {
			super.excluir();
		}
	}

	@Override
	public void editarRegistro() {
		if (isSelecionado()) {
			super.editarRegistro();
			logger.info("Edicao de registro = {} ", registro);
		}
	}

	@Override
	public void salvar() {
		super.salvar();
		logger.info("Salvando = {} ");
	}

	public void criarLogsList() {
	}

	public List<ProdutoModel> criarList() {
		final List<ProdutoModel> lista = new ArrayList<ProdutoModel>();
		for (Integer i = 0; i < 10; i++) {
			lista.add(new ProdutoModel(new Long(i), Calendar.getInstance(), Calendar.getInstance()));
		}
		return lista;

	}
	
	@Override
	public FilterManager<ProdutoModel> getFilterManager() {
		return null;
	}

	@Override
	public Logger getLogger() {
		return logger;
	}

	@Override
	public void setLogger(final Logger logger) {
		this.logger = logger;
	}

	public GoliveOneProperties getLabels() {
		return labels;
	}

	public void setLabels(final GoliveOneProperties labels) {
		this.labels = labels;
	}

	public Calendar getData() {
		return data;
	}

	public void setData(final Calendar data) {
		this.data = data;
	}
	
	public List<Object> getAuditoriaLogs() {
		ArrayList<Object> list = new ArrayList<Object>();
		
		list.add(new Object());
		list.add(new Object());
		list.add(new Object());

		return list;
	}
}
