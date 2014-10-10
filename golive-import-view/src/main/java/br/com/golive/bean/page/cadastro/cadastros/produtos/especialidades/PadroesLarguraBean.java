package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.imageio.ImageIO;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroBeanRules;
import br.com.golive.constants.TipoRelatorio;
import br.com.golive.entity.padroeslargura.PadroesLarguraModel;
import br.com.golive.filter.FilterManager;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@Label(name = "label.cadastroPadroesLargura")
@ManagedBean
@ViewScoped
public class PadroesLarguraBean extends CadastroBeanRules<PadroesLarguraModel>{

	private static final long serialVersionUID = 1695967414981458910L;

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

	private List<PadroesLarguraModel> criarLista() {
		final List<PadroesLarguraModel> lista = new ArrayList<PadroesLarguraModel>();
		
		for (Integer i = 0; i < 10; i++){
			lista.add(new PadroesLarguraModel(new Long(i), new Date(), new Date(), "2.58", 
					"ML", "2.58ML de Largura da Peça", "0000000001", "0000000025", 
					"Mountain Viber Glass Colors", "0000000001", "1234567Baec", "Vermelho"));
		}
		
		return lista;
	}

	@Override
	public FilterManager<PadroesLarguraModel> getFilterManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void imprimir() {
		gerarRelatorio(TipoRelatorio.IMPRESSAO, labels);
	}

	@Override
	public void exportarXls() {
		gerarRelatorio(TipoRelatorio.EXCEL, labels);
	}

	@Override
	public void exportarPdf() {
		gerarRelatorio(TipoRelatorio.PDF, labels);
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
	public void confirmarExclusao() {
		// TODO Auto-generated method stub
		
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
	
	@Override
	public void cancelar(){
		super.cancelar();
		
		if (registro == null) {
			logger.info("Cancelando inclusão de registro");
		} else {
			logger.info("Cancelando edição do registro = {} ", registro);
		}
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
