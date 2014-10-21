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
import br.com.golive.entity.padroesespessura.model.PadroesEspessuraModel;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;

@Label(name = "label.cadastroPadroesEspessura")
@ManagedBean
@ViewScoped
public class PadroesEspessuraBean extends CadastroBeanRules<PadroesEspessuraModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;

	@Inject
	@LabelSystemInjected
	private GoliveOneProperties labels;

	@Override
	@PostConstruct
	public void init() {
		super.init(criarList());

		logger.info("Inicializando = {}", this.getClass().getName());

		fluxo = getFluxoListagem();
	}

	public List<PadroesEspessuraModel> criarList() {
		final List<PadroesEspessuraModel> lista = new ArrayList<PadroesEspessuraModel>();
		
		for (Integer i = 0; i < 10; i++) {
			lista.add(new PadroesEspessuraModel(new Long(i), new Date(), new Date(), 
					"0.18", "MM", "18 Microns de Espessura da Peça", "0000000001", 
					"0000000025", "Mountain Viber Glass Colors", "0000000001", 
					"1234567Baec", "Vermelho"));
		}
		
		return lista;
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
	public void salvar() {
		super.salvar();
		logger.info("Salvando = {} ");
	}

	public List<Object> getAuditoriaLogs() {
		ArrayList<Object> list = new ArrayList<Object>();
		
		list.add(new Object());
		list.add(new Object());
		list.add(new Object());

		return list;
	}
}