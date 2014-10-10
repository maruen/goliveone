package br.com.golive.bean.page.cadastro.cadastros.produtos.finalidades;

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
import br.com.golive.entity.finalidadepadraoespessura.FinalidadePadraoEspessuraModel;
import br.com.golive.filter.FilterManager;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@Label(name = "label.cadastroFinalidadePadraoEspessura")
@ManagedBean
@ViewScoped
public class FinalidadePadraoEspessuraBean extends CadastroBeanRules<FinalidadePadraoEspessuraModel> {

	private static final long serialVersionUID = 2514116552523572486L;

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

	private List<FinalidadePadraoEspessuraModel> criarLista() {
		final List<FinalidadePadraoEspessuraModel> lista = new ArrayList<FinalidadePadraoEspessuraModel>();
		
		for (Integer i = 0; i < 10; i++){
			lista.add(new FinalidadePadraoEspessuraModel(new Long(i), new Date(), new Date(), 
					"Pedido de Compra - Lâmina Horizontal Alumínio 0.18mm", "0000000001", "MM", 
					"Milimetros"));
		}
		
		return lista;
	}

	@Override
	public FilterManager<FinalidadePadraoEspessuraModel> getFilterManager() {
		// TODO Auto-generated method stub
		return null;
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
	protected Logger getLogger() {
		return logger;
	}
	
	@Override
	public void salvar(){
		super.salvar();
		logger.info("Salvando = {}");
	}
	
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
