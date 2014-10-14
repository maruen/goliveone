package br.com.golive.bean.page.cadastro.cadastros.produtos.classificacao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.imageio.ImageIO;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroBeanRules;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.filter.FilterManager;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.service.DepartamentoService;
import br.com.golive.utils.Fluxo;
import br.com.golive.utils.GoliveOneProperties;

@ManagedBean
@ViewScoped
@Label(name = "label.cadastroDepartamento")
public class DepartamentoBean extends CadastroBeanRules<DepartamentoModel> {

	private static final long serialVersionUID = 8520424471796591515L;

	@Inject
	private Logger logger;

	@Inject
	@LabelSystemInjected
	private GoliveOneProperties labels;
	private Calendar data;

	@EJB
	private DepartamentoService departamentoService;
	
	@Override
	@PostConstruct
	public void init() {
		logger.info("Inicializando = {}", this.getClass().getName());
		this.conteudo = departamentoService.listar();
		fluxo = Fluxo.LISTAGEM;
	}
	

	@SuppressWarnings("unused")
	private void saveExample() {
		DepartamentoModel departamentoModel = new DepartamentoModel();
		departamentoModel.setDataAlteracao(new Date());
		departamentoModel.setDataInclusao(new Date());
		departamentoModel.setDescricao("Teste");
		departamentoService.salvar(departamentoModel);
	}
	
	@Override
	public Map<String, Object> obterParametrosRelatório() {
		logger.info("Obtendo parametros para carregar relatório");
		final Map<String, Object> parametros = new HashMap<String, Object>();
		parametros.put("usuarioLogado", "Guilherme Desenvolvimento");
		parametros.put("label.usuario", labels.getField("label.usuario"));
		try {
			logger.info("Carregando logo da empresa");
			parametros.put("logo", ImageIO.read(Thread.currentThread().getContextClassLoader().getResourceAsStream("01.png")));
		} catch (final IOException e) {
			logger.error("Erro ao carregar logo da empresa");
		}
		return parametros;
	}
	
	@Override
	public void salvar() {
		super.salvar();
		logger.info("Salvando = {} ");
	}
	
	public Calendar getDataInclusaoFiltro() {
		return data;
	}

	public void setDataInclusaoFiltro(final Calendar dataInclusaoFiltro) {
		data = dataInclusaoFiltro;
	}

	@Override
	protected Logger getLogger() {
		return logger;
	}

	@Override
	public FilterManager<DepartamentoModel> getFilterManager() {
		// TODO Auto-generated method stub
		return null;
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
