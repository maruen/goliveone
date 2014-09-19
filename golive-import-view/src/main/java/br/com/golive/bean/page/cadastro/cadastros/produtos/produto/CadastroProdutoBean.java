package br.com.golive.bean.page.cadastro.cadastros.produtos.produto;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Data;
import lombok.EqualsAndHashCode;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroBeanRules;
import br.com.golive.entity.GenericModel;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;
import br.com.golive.utils.JSFUtils;

@ManagedBean
@ViewScoped
@Label(name="label.cadastroProdutos.cadastroProdutos")
@Data
@EqualsAndHashCode(callSuper=false)
public class CadastroProdutoBean extends CadastroBeanRules<GenericModel> {

	private static final long serialVersionUID = 6286581844381749904L;

	@Inject
	private Logger logger;

	@Inject
	@LabelSystemInjected
	private GoliveOneProperties labels;
	private Calendar data;

	private Long id;
	private Long codigoProduto;
	private String descricaoProduto;
	private Date dataUltimaAlteracao;
	private Date dataInclusao; 
	private List<String> unidades;
	private List<String> codigos;
	private List<String> descricoes;
	private List<String> colecoes;
	private List<String> codigoBarras;
	private List<String> cores;
	private List<String> padraoLargura;
	private List<String> padraoEspessura;
	
	@Override
	@PostConstruct
	public void init() {
		super.init(criarList());
		logger.info("Inicializando = {}", this.getClass().getName());

		fluxo 				= getFluxoListagem();
		data  				= Calendar.getInstance();
		dataUltimaAlteracao = Calendar.getInstance().getTime();
		dataInclusao		= Calendar.getInstance().getTime();
	}
	
	public List<String> getCodigos() {
		codigos = new ArrayList<String>();
		codigos.add("Selecione Finalidade Código Produto");
		codigos.add("Código 1");
		codigos.add("Código 2");
		codigos.add("Código 3");
		return codigos;
	}

	public List<String> getCores() {
		cores = new ArrayList<String>();
		cores.add("Selecione Finalidade Cor");
		cores.add("Vermelha");
		cores.add("Azul");
		cores.add("Preta");
		return cores;
	}

	public List<String> getUnidades() {
		unidades = new ArrayList<String>();
		unidades.add("Selecione Finalidade da Unidade");
		unidades.add("Unidade 1");
		unidades.add("Unidade 2");
		unidades.add("Unidade 3");
		return unidades;
	}

	public List<String> getColecoes() {
		colecoes = new ArrayList<String>();
		colecoes.add("Selecione Finalidade Coleção");
		colecoes.add("Coleção 1");
		colecoes.add("Coleção 2");
		colecoes.add("Coleção 3");
		return colecoes;
	}

	public List<String> getDescricoes() {
		descricoes = new ArrayList<String>();
		descricoes.add("Descriçao 1");
		descricoes.add("Descriçao 2");
		descricoes.add("Descriçao 3");
		return descricoes;
	}

	public List<String> getCodigoBarras() {
		codigoBarras = new ArrayList<String>();
		codigoBarras.add("Selecione Finalidade Código Barras");
		codigoBarras.add("Descriçao 1");
		codigoBarras.add("Descriçao 2");
		codigoBarras.add("Descriçao 3");
		return codigoBarras;
	}

	public List<String> getPadraoLargura() {
		padraoLargura = new ArrayList<String>();
		padraoLargura.add("Selecione Finalidade Padrão de Largura");
		padraoLargura.add("Largura 1");
		padraoLargura.add("Largura 2");
		padraoLargura.add("Largura 3");
		return padraoLargura;
	}

	public List<String> getPadraoEspessura() {
		padraoEspessura = new ArrayList<String>();
		padraoEspessura.add("Selecione Finalidade Padrão de Espessura");
		padraoEspessura.add("Espessura 1");
		padraoEspessura.add("Espessura 2");
		padraoEspessura.add("Espessura 3");
		return padraoEspessura;
	}

	public List<List<Object>> getColecaoDatatable() {
		return getRowsByColumns();
	}

	public List<List<Object>> getCodigoDatatable() {
		return getRowsByColumns();
	}

	public List<List<Object>> getDescricoesDatatable() {
		return getRowsByColumns();
	}

	public List<List<Object>> getFornecedoresDatatable() {
		return getRowsByColumns();
	}

	public List<List<Object>> getUnidadesDatatable() {
		return getRowsByColumns();
	}

	public List<List<Object>> getCodigoBarrasDatatable() {
		return getRowsByColumns();
	}

	public List<List<Object>> getCustosCompraDatatable() {
		return getRowsByColumns();
	}

	public List<List<Object>> getCustosVendaDatatable() {
		return getRowsByColumns();
	}

	public List<List<Object>> getAuditoriaLogDatatable() {
		return getRowsByColumns();
	}

	public List<List<Object>> getCorDatatable() {
		return getRowsByColumns();
	}

	public List<List<Object>> getPadraoLarguraDatatable() {
		return getRowsByColumns();
	}

	public List<List<Object>> getPadraoEspessuraDatatable() {
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

	public List<GenericModel> criarList() {
		List<GenericModel> lista = new ArrayList<GenericModel>();
		for (Integer i = 0; i < 10; i++) {
			lista.add(new GenericModel(new Long(i), new Date(), new Date()));
		}
		return lista;

	}

	public Calendar getDataInclusaoFiltro() {
		return data;
	}

	public void setDataInclusaoFiltro(final Calendar dataInclusaoFiltro) {
		data = dataInclusaoFiltro;
	}

	@Override
	public Map<String, Object> obterParametrosRelatório() {
		// TODO Auto-generated method stub
		return null;
	}



	
	


}
