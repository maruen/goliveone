package br.com.golive.bean.page.cadastro.cadastros.produtos.tipoProduto;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroBeanRules;
import br.com.golive.entity.produto.ProdutoModel;
import br.com.golive.filter.FilterManager;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;
import br.com.golive.utils.JSFUtils;

@ManagedBean
@ViewScoped
@Label(name = "label.cadastros.produtos.tipoProduto.tipoProduto")
public class TipoProdutoBean extends CadastroBeanRules<ProdutoModel> {

	private static final long serialVersionUID = 6286581844381749904L;

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

	@Override
	public void cancelar() {
		super.cancelar();
		if (registro == null) {
			logger.info("Cancelando inclusao de registro");
		} else {
			logger.info("Cancelando edicao do registro = {} ", registro);
		}
	}

	@Override
	public void imprimir() {
		// TODO Auto-generated method stub

	}

	@Override
	public void exportarPdf() {
		// TODO Auto-generated method stub

	}

	@Override
	public void exportarXls() {
		// TODO Auto-generated method stub

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

	@Override
	public boolean isSelecionado() {
		if (registro == null) {
			JSFUtils.warnMessage(labels.getField("title.msg.selecione.registro") + ",", labels.getField("msg.selecionar.registro"));
			logger.info("Não existe registro para processar");
			return false;
		}
		return true;
	}

	public void criarLogsList() {
	}

	public List<ProdutoModel> criarList() {
		final List<ProdutoModel> lista = new ArrayList<ProdutoModel>();
		for (Integer i = 0; i < 10; i++) {
			lista.add(new ProdutoModel(new Long(i), new Date(), new Date()));
		}
		return lista;

	}

	@Override
	public Map<String, Object> obterParametrosRelatório() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected Logger getLogger() {
		return logger;
	}

	@Override
	public FilterManager<ProdutoModel> getFilterManager() {
		return null;
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

	@Override
	public void setLogger(final Logger logger) {
		this.logger = logger;
	}

	@Override
	public void confirmarExclusao() {
		// TODO Auto-generated method stub

	}

}
