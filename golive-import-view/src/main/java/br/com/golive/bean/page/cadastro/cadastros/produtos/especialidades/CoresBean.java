package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades;

import java.text.ParseException;
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
import br.com.golive.entity.especialidades.CoresModel;
import br.com.golive.filter.FilterManager;
import br.com.golive.qualifier.FilterInjected;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@Label(name = "label.cadastroCores")
@ManagedBean
@ViewScoped
public class CoresBean extends CadastroBeanRules<CoresModel> {

	private static final long serialVersionUID = 6286581844381749904L;

	@Inject
	private Logger logger;

	@Inject
	@FilterInjected
	private FilterManager<CoresModel> filterManager;

	@Inject
	@LabelSystemInjected
	private GoliveOneProperties labels;

	@Override
	@PostConstruct
	public void init() {
		try {
			super.init(criarList());
		} catch (final ParseException e) {
			e.printStackTrace();
		}
		this.registro = new CoresModel();
		logger.info("Inicializando = {}", this.getClass().getName());
	}

	@Override
	public void incluir() {
		super.incluir();
	}

	@Override
	public void editarRegistro() {
		if (isSelecionado()) {
			super.editarRegistro();
			logger.info("Edicao de registro = {} " );

		}
	}
	
	
	@Override
	@Deprecated
	public void salvar() {
		final boolean insert = false;
		if (insert) {
			super.salvar();
		}
	}

	@Deprecated
	public List<CoresModel> criarList() throws ParseException {
		final List<CoresModel> lista = new ArrayList<CoresModel>();
		for (Integer i = 0; i < 10; i++) {
			final CoresModel coresModel = new CoresModel(Long.valueOf(i.longValue()),
												   new Date(),
												   new Date(),
												   "0000000025",
												   "Vermelho",
												   "0000000001",
												   	"asbca14",
												   	"Mountain Vibe Glass Colors"
												   );
			
			lista.add(coresModel);
		}
		return lista;

	}

	@Override
	public Logger getLogger() {
		return logger;
	}

	public GoliveOneProperties getLabels() {
		return labels;
	}

	public void setLabels(final GoliveOneProperties labels) {
		this.labels = labels;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public void setLogger(final Logger logger) {
		this.logger = logger;
	}

	@Override
	public FilterManager<CoresModel> getFilterManager() {
		return filterManager;
	}

	public void setFilterManager(final FilterManager<CoresModel> filterManager) {
		this.filterManager = filterManager;
	}



}
