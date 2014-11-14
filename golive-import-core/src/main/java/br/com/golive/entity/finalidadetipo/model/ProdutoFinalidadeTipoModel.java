package br.com.golive.entity.finalidadetipo.model;

import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import br.com.golive.annotation.Jasper;
import br.com.golive.annotation.Label;
import br.com.golive.annotation.TransientColumn;
import br.com.golive.entity.Model;

@Entity
@Table(name = "tbFinalidadeTipoProduto")
@Label(name = "label.cadastroFinalidadeTipo")
@Jasper(titulo = "FinalidadeTipo", nomeDoArquivoGerado = "file.name.model", nomeArquivoJasper = "FinalidadeTipo")
public class ProdutoFinalidadeTipoModel extends Model {

	@Transient
	private static final long serialVersionUID = 1L;

	@Column(name = "NumeroMinimoCaracteres")
	private Long numeroMinimoDeCaracteres;

	@Column(name = "NumeroMaximoCaracteres")
	private Long numeroMaximoDeCaracteres;

	@Column(name = "FinalidadeTipoProduto")
	private String descricao;

	@Column(name = "ApresentacaoSistemaLookupPesquisas")
	@TransientColumn
	private boolean apresentacaoSistemaLookupPesquisas;

	@Column(name = "ApresentacaoSistemaGridPesquisas")
	@TransientColumn
	private boolean apresentacaoSistemaGridPesquisas;

	@Column(name = "ApresentacaoSistemaRelatoriosCadastrais")
	@TransientColumn
	private boolean apresentacaoSistemaRelatoriosCadastrais;

	@Column(name = "ApresentacaoSistemaGraficosCadastrais")
	@TransientColumn
	private boolean apresentacaoSistemaGraficosCadastrais;

	@Column(name = "ApresentacaoVendasGraficos")
	@TransientColumn
	private boolean apresentacaoVendasGraficos;

	@Column(name = "ApresentacaoVendasPesquisas")
	@TransientColumn
	private boolean apresentacaoVendasPesquisas;

	@Column(name = "ApresentacaoVendasRelatorios")
	@TransientColumn
	private boolean apresentacaoVendasRelatorios;

	@Column(name = "ApresentacaoVendasOrcamentos")
	@TransientColumn
	private boolean apresentacaoVendasOrcamentos;

	@Column(name = "ApresentacaoVendasPedidosVenda")
	@TransientColumn
	private boolean apresentacaoVendasPedidosVenda;

	@Column(name = "ApresentacaoVendasDAV")
	@TransientColumn
	private boolean apresentacaoVendasDAV;

	@Column(name = "ApresentacaoComprasGraficos")
	@TransientColumn
	private boolean apresentacaoComprasGraficos;

	@Column(name = "ApresentacaoComprasPesquisas")
	@TransientColumn
	private boolean apresentacaoComprasPesquisas;

	@Column(name = "ApresentacaoComprasRelatorios")
	@TransientColumn
	private boolean apresentacaoComprasRelatorios;

	@Column(name = "ApresentacaoComprasCotacoes")
	@TransientColumn
	private boolean apresentacaoComprasCotacoes;

	@Column(name = "ApresentacaoComprasPedidosCompra")
	@TransientColumn
	private boolean apresentacaoComprasPedidosCompra;

	@Column(name = "ApresentacaoComprasEntradasNFeCompra")
	@TransientColumn
	private boolean apresentacaoComprasEntradasNFeCompra;

	@Column(name = "ApresentacaoFaturamentoVendaCumpomFiscal")
	@TransientColumn
	private boolean apresentacaoFaturamentoVendaCumpomFiscal;

	@Column(name = "ApresentacaoFaturamentoVendaNFCe")
	@TransientColumn
	private boolean apresentacaoFaturamentoVendaNFCe;

	@Column(name = "ApresentacaoFaturamentoVendaNFe")
	@TransientColumn
	private boolean apresentacaoFaturamentoVendaNFe;

	@Column(name = "ApresentacaoFaturamentoVendaNFSe")
	@TransientColumn
	private boolean apresentacaoFaturamentoVendaNFSe;

	@Column(name = "ApresentacaoFaturamentoCompraNFeCompra")
	@TransientColumn
	private boolean apresentacaoFaturamentoCompraNFeCompra;

	@Column(name = "ApresentacaoFaturamentoCompraNFeDevolucao")
	@TransientColumn
	private boolean apresentacaoFaturamentoCompraNFeDevolucao;

	@Column(name = "ApresentacaoFaturamentoCompraNFeBeneficiamento")
	@TransientColumn
	private boolean apresentacaoFaturamentoCompraNFeBeneficiamento;

	@Column(name = "AplicacaoSistemaLookupPesquisas")
	@TransientColumn
	private boolean aplicacaoSistemaLookupPesquisas;

	@Column(name = "AplicacaoSistemaGirdPesquisas")
	@TransientColumn
	private boolean aplicacaoSistemaGirdPesquisas;

	@Column(name = "AplicacaoSistemaRelatoriosCadastrais")
	@TransientColumn
	private boolean aplicacaoSistemaRelatoriosCadastrais;

	@Column(name = "AplicacaoSistemaGraficosCadastrais")
	@TransientColumn
	private boolean aplicacaoSistemaGraficosCadastrais;

	@Column(name = "AplicacaoVendasGraficos")
	@TransientColumn
	private boolean aplicacaoVendasGraficos;

	@Column(name = "AplicacaoVendasPesquisas")
	@TransientColumn
	private boolean aplicacaoVendasPesquisas;

	@Column(name = "AplicacaoVendasRelatorios")
	@TransientColumn
	private boolean aplicacaoVendasRelatorios;

	@Column(name = "AplicacaoVendasOrcamentos")
	@TransientColumn
	private boolean aplicacaoVendasOrcamentos;

	@Column(name = "AplicacaoVendasPedidosDeVenda")
	@TransientColumn
	private boolean aplicacaoVendasPedidosDeVenda;

	@Column(name = "AplicacaoVendasDAV")
	@TransientColumn
	private boolean aplicacaoVendasDAV;

	@Column(name = "AplicacaoComprasGraficos")
	@TransientColumn
	private boolean aplicacaoComprasGraficos;

	@Column(name = "AplicacaoComprasPesquisas")
	@TransientColumn
	private boolean aplicacaoComprasPesquisas;

	@Column(name = "AplicacaoComprasRelatorios")
	@TransientColumn
	private boolean aplicacaoComprasRelatorios;

	@Column(name = "AplicacaoComprasCotacoes")
	@TransientColumn
	private boolean aplicacaoComprasCotacoes;

	@Column(name = "AplicacaoComprasPedidosCompra")
	@TransientColumn
	private boolean aplicacaoComprasPedidosCompra;

	@Column(name = "AplicacaoComprasEntradasNFeCompra")
	@TransientColumn
	private boolean aplicacaoComprasEntradasNFeCompra;

	@Column(name = "AplicacaoFaturamentoVendaCupomFiscal")
	@TransientColumn
	private boolean aplicacaoFaturamentoVendaCupomFiscal;

	@Column(name = "AplicacaoFaturamentoVendaNFCe")
	@TransientColumn
	private boolean aplicacaoFaturamentoVendaNFCe;

	@Column(name = "AplicacaoFaturamentoVendaNFe")
	@TransientColumn
	private boolean aplicacaoFaturamentoVendaNFe;

	@Column(name = "AplicacaoFaturamentoVendaNFSe")
	@TransientColumn
	private boolean aplicacaoFaturamentoVendaNFSe;

	@Column(name = "AplicacaoFaturamentoCompraNFeCompra")
	@TransientColumn
	private boolean aplicacaoFaturamentoCompraNFeCompra;

	@Column(name = "AplicacaoFaturamentoCompraNFeDevolucao")
	@TransientColumn
	private boolean aplicacaoFaturamentoCompraNFeDevolucao;

	@Column(name = "AplicacaoFaturamentoCompraNFeBeneficiamento")
	@TransientColumn
	private boolean aplicacaoFaturamentoCompraNFeBeneficiamento;

	public ProdutoFinalidadeTipoModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProdutoFinalidadeTipoModel(final Long id, final Calendar dataInclusao, final Calendar dataAlteracao) {
		super(id, dataInclusao, dataAlteracao);
		// TODO Auto-generated constructor stub
	}

	public ProdutoFinalidadeTipoModel(final Long numeroMinimoDeCaracteres, final Long numeroMMinimoDeCaracteres, final String descricao, final boolean apresentacaoSistemaLookupPesquisas, final boolean apresentacaoSistemaGridPesquisas, final boolean apresentacaoSistemaRelatoriosCadastrais, final boolean apresentacaoSistemaGraficosCadastrais, final boolean apresentacaoVendasGraficos, final boolean apresentacaoVendasPesquisas, final boolean apresentacaoVendasRelatorios, final boolean apresentacaoVendasOrcamentos, final boolean apresentacaoVendasPedidosVenda, final boolean apresentacaoVendasDAV, final boolean apresentacaoComprasGraficos, final boolean apresentacaoComprasPesquisas, final boolean apresentacaoComprasRelatorios, final boolean apresentacaoComprasCotacoes, final boolean apresentacaoComprasPedidosCompra, final boolean apresentacaoComprasEntradasNFeCompra, final boolean apresentacaoFaturamentoVendaCumpomFiscal, final boolean apresentacaoFaturamentoVendaNFCe, final boolean apresentacaoFaturamentoVendaNFe, final boolean apresentacaoFaturamentoVendaNFSe, final boolean apresentacaoFaturamentoCompraNFeCompra, final boolean apresentacaoFaturamentoCompraNFeDevolucao, final boolean apresentacaoFaturamentoCompraNFeBeneficiamento, final boolean aplicacaoSistemaLookupPesquisas, final boolean aplicacaoSistemaGirdPesquisas, final boolean aplicacaoSistemaRelatoriosCadastrais, final boolean aplicacaoSistemaGraficosCadastrais, final boolean aplicacaoVendasGraficos, final boolean aplicacaoVendasPesquisas, final boolean aplicacaoVendasRelatorios, final boolean aplicacaoVendasOrcamentos, final boolean aplicacaoVendasPedidosDeVenda, final boolean aplicacaoVendasDAV, final boolean aplicacaoComprasGraficos, final boolean aplicacaoComprasPesquisas, final boolean aplicacaoComprasRelatorios, final boolean aplicacaoComprasCotacoes, final boolean aplicacaoComprasPedidosCompra, final boolean aplicacaoComprasEntradasNFeCompra, final boolean aplicacaoFaturamentoVendaCupomFiscal, final boolean aplicacaoFaturamentoVendaNFCe, final boolean aplicacaoFaturamentoVendaNFe, final boolean aplicacaoFaturamentoVendaNFSe, final boolean aplicacaoFaturamentoCompraNFeCompra, final boolean aplicacaoFaturamentoCompraNFeDevolucao, final boolean aplicacaoFaturamentoCompraNFeBeneficiamento) {
		super();
		this.numeroMinimoDeCaracteres = numeroMinimoDeCaracteres;
		numeroMaximoDeCaracteres = numeroMMinimoDeCaracteres;
		this.descricao = descricao;
		this.apresentacaoSistemaLookupPesquisas = apresentacaoSistemaLookupPesquisas;
		this.apresentacaoSistemaGridPesquisas = apresentacaoSistemaGridPesquisas;
		this.apresentacaoSistemaRelatoriosCadastrais = apresentacaoSistemaRelatoriosCadastrais;
		this.apresentacaoSistemaGraficosCadastrais = apresentacaoSistemaGraficosCadastrais;
		this.apresentacaoVendasGraficos = apresentacaoVendasGraficos;
		this.apresentacaoVendasPesquisas = apresentacaoVendasPesquisas;
		this.apresentacaoVendasRelatorios = apresentacaoVendasRelatorios;
		this.apresentacaoVendasOrcamentos = apresentacaoVendasOrcamentos;
		this.apresentacaoVendasPedidosVenda = apresentacaoVendasPedidosVenda;
		this.apresentacaoVendasDAV = apresentacaoVendasDAV;
		this.apresentacaoComprasGraficos = apresentacaoComprasGraficos;
		this.apresentacaoComprasPesquisas = apresentacaoComprasPesquisas;
		this.apresentacaoComprasRelatorios = apresentacaoComprasRelatorios;
		this.apresentacaoComprasCotacoes = apresentacaoComprasCotacoes;
		this.apresentacaoComprasPedidosCompra = apresentacaoComprasPedidosCompra;
		this.apresentacaoComprasEntradasNFeCompra = apresentacaoComprasEntradasNFeCompra;
		this.apresentacaoFaturamentoVendaCumpomFiscal = apresentacaoFaturamentoVendaCumpomFiscal;
		this.apresentacaoFaturamentoVendaNFCe = apresentacaoFaturamentoVendaNFCe;
		this.apresentacaoFaturamentoVendaNFe = apresentacaoFaturamentoVendaNFe;
		this.apresentacaoFaturamentoVendaNFSe = apresentacaoFaturamentoVendaNFSe;
		this.apresentacaoFaturamentoCompraNFeCompra = apresentacaoFaturamentoCompraNFeCompra;
		this.apresentacaoFaturamentoCompraNFeDevolucao = apresentacaoFaturamentoCompraNFeDevolucao;
		this.apresentacaoFaturamentoCompraNFeBeneficiamento = apresentacaoFaturamentoCompraNFeBeneficiamento;
		this.aplicacaoSistemaLookupPesquisas = aplicacaoSistemaLookupPesquisas;
		this.aplicacaoSistemaGirdPesquisas = aplicacaoSistemaGirdPesquisas;
		this.aplicacaoSistemaRelatoriosCadastrais = aplicacaoSistemaRelatoriosCadastrais;
		this.aplicacaoSistemaGraficosCadastrais = aplicacaoSistemaGraficosCadastrais;
		this.aplicacaoVendasGraficos = aplicacaoVendasGraficos;
		this.aplicacaoVendasPesquisas = aplicacaoVendasPesquisas;
		this.aplicacaoVendasRelatorios = aplicacaoVendasRelatorios;
		this.aplicacaoVendasOrcamentos = aplicacaoVendasOrcamentos;
		this.aplicacaoVendasPedidosDeVenda = aplicacaoVendasPedidosDeVenda;
		this.aplicacaoVendasDAV = aplicacaoVendasDAV;
		this.aplicacaoComprasGraficos = aplicacaoComprasGraficos;
		this.aplicacaoComprasPesquisas = aplicacaoComprasPesquisas;
		this.aplicacaoComprasRelatorios = aplicacaoComprasRelatorios;
		this.aplicacaoComprasCotacoes = aplicacaoComprasCotacoes;
		this.aplicacaoComprasPedidosCompra = aplicacaoComprasPedidosCompra;
		this.aplicacaoComprasEntradasNFeCompra = aplicacaoComprasEntradasNFeCompra;
		this.aplicacaoFaturamentoVendaCupomFiscal = aplicacaoFaturamentoVendaCupomFiscal;
		this.aplicacaoFaturamentoVendaNFCe = aplicacaoFaturamentoVendaNFCe;
		this.aplicacaoFaturamentoVendaNFe = aplicacaoFaturamentoVendaNFe;
		this.aplicacaoFaturamentoVendaNFSe = aplicacaoFaturamentoVendaNFSe;
		this.aplicacaoFaturamentoCompraNFeCompra = aplicacaoFaturamentoCompraNFeCompra;
		this.aplicacaoFaturamentoCompraNFeDevolucao = aplicacaoFaturamentoCompraNFeDevolucao;
		this.aplicacaoFaturamentoCompraNFeBeneficiamento = aplicacaoFaturamentoCompraNFeBeneficiamento;
	}

	public Long getNumeroMinimoDeCaracteres() {
		return numeroMinimoDeCaracteres;
	}

	public void setNumeroMinimoDeCaracteres(final Long numeroMinimoDeCaracteres) {
		this.numeroMinimoDeCaracteres = numeroMinimoDeCaracteres;
	}

	public Long getNumeroMaximoDeCaracteres() {
		return numeroMaximoDeCaracteres;
	}

	public void NumeroMaximoDeCaracteres(final Long numeroMaximoDeCaracteres) {
		this.numeroMaximoDeCaracteres = numeroMaximoDeCaracteres;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(final String descricao) {
		this.descricao = descricao;
	}

	public boolean isApresentacaoSistemaLookupPesquisas() {
		return apresentacaoSistemaLookupPesquisas;
	}

	public void setApresentacaoSistemaLookupPesquisas(final boolean apresentacaoSistemaLookupPesquisas) {
		this.apresentacaoSistemaLookupPesquisas = apresentacaoSistemaLookupPesquisas;
	}

	public boolean isApresentacaoSistemaGridPesquisas() {
		return apresentacaoSistemaGridPesquisas;
	}

	public void setApresentacaoSistemaGridPesquisas(final boolean apresentacaoSistemaGridPesquisas) {
		this.apresentacaoSistemaGridPesquisas = apresentacaoSistemaGridPesquisas;
	}

	public boolean isApresentacaoSistemaRelatoriosCadastrais() {
		return apresentacaoSistemaRelatoriosCadastrais;
	}

	public void setApresentacaoSistemaRelatoriosCadastrais(final boolean apresentacaoSistemaRelatoriosCadastrais) {
		this.apresentacaoSistemaRelatoriosCadastrais = apresentacaoSistemaRelatoriosCadastrais;
	}

	public boolean isApresentacaoSistemaGraficosCadastrais() {
		return apresentacaoSistemaGraficosCadastrais;
	}

	public void setApresentacaoSistemaGraficosCadastrais(final boolean apresentacaoSistemaGraficosCadastrais) {
		this.apresentacaoSistemaGraficosCadastrais = apresentacaoSistemaGraficosCadastrais;
	}

	public boolean isApresentacaoVendasGraficos() {
		return apresentacaoVendasGraficos;
	}

	public void setApresentacaoVendasGraficos(final boolean apresentacaoVendasGraficos) {
		this.apresentacaoVendasGraficos = apresentacaoVendasGraficos;
	}

	public boolean isApresentacaoVendasPesquisas() {
		return apresentacaoVendasPesquisas;
	}

	public void setApresentacaoVendasPesquisas(final boolean apresentacaoVendasPesquisas) {
		this.apresentacaoVendasPesquisas = apresentacaoVendasPesquisas;
	}

	public boolean isApresentacaoVendasRelatorios() {
		return apresentacaoVendasRelatorios;
	}

	public void setApresentacaoVendasRelatorios(final boolean apresentacaoVendasRelatorios) {
		this.apresentacaoVendasRelatorios = apresentacaoVendasRelatorios;
	}

	public boolean isApresentacaoVendasOrcamentos() {
		return apresentacaoVendasOrcamentos;
	}

	public void setApresentacaoVendasOrcamentos(final boolean apresentacaoVendasOrcamentos) {
		this.apresentacaoVendasOrcamentos = apresentacaoVendasOrcamentos;
	}

	public boolean isApresentacaoVendasPedidosVenda() {
		return apresentacaoVendasPedidosVenda;
	}

	public void setApresentacaoVendasPedidosVenda(final boolean apresentacaoVendasPedidosVenda) {
		this.apresentacaoVendasPedidosVenda = apresentacaoVendasPedidosVenda;
	}

	public boolean isApresentacaoVendasDAV() {
		return apresentacaoVendasDAV;
	}

	public void setApresentacaoVendasDAV(final boolean apresentacaoVendasDAV) {
		this.apresentacaoVendasDAV = apresentacaoVendasDAV;
	}

	public boolean isApresentacaoComprasGraficos() {
		return apresentacaoComprasGraficos;
	}

	public void setApresentacaoComprasGraficos(final boolean apresentacaoComprasGraficos) {
		this.apresentacaoComprasGraficos = apresentacaoComprasGraficos;
	}

	public boolean isApresentacaoComprasPesquisas() {
		return apresentacaoComprasPesquisas;
	}

	public void setApresentacaoComprasPesquisas(final boolean apresentacaoComprasPesquisas) {
		this.apresentacaoComprasPesquisas = apresentacaoComprasPesquisas;
	}

	public boolean isApresentacaoComprasRelatorios() {
		return apresentacaoComprasRelatorios;
	}

	public void setApresentacaoComprasRelatorios(final boolean apresentacaoComprasRelatorios) {
		this.apresentacaoComprasRelatorios = apresentacaoComprasRelatorios;
	}

	public boolean isApresentacaoComprasCotacoes() {
		return apresentacaoComprasCotacoes;
	}

	public void setApresentacaoComprasCotacoes(final boolean apresentacaoComprasCotacoes) {
		this.apresentacaoComprasCotacoes = apresentacaoComprasCotacoes;
	}

	public boolean isApresentacaoComprasPedidosCompra() {
		return apresentacaoComprasPedidosCompra;
	}

	public void setApresentacaoComprasPedidosCompra(final boolean apresentacaoComprasPedidosCompra) {
		this.apresentacaoComprasPedidosCompra = apresentacaoComprasPedidosCompra;
	}

	public boolean isApresentacaoComprasEntradasNFeCompra() {
		return apresentacaoComprasEntradasNFeCompra;
	}

	public void setApresentacaoComprasEntradasNFeCompra(final boolean apresentacaoComprasEntradasNFeCompra) {
		this.apresentacaoComprasEntradasNFeCompra = apresentacaoComprasEntradasNFeCompra;
	}

	public boolean isApresentacaoFaturamentoVendaCumpomFiscal() {
		return apresentacaoFaturamentoVendaCumpomFiscal;
	}

	public void setApresentacaoFaturamentoVendaCumpomFiscal(final boolean apresentacaoFaturamentoVendaCumpomFiscal) {
		this.apresentacaoFaturamentoVendaCumpomFiscal = apresentacaoFaturamentoVendaCumpomFiscal;
	}

	public boolean isApresentacaoFaturamentoVendaNFCe() {
		return apresentacaoFaturamentoVendaNFCe;
	}

	public void setApresentacaoFaturamentoVendaNFCe(final boolean apresentacaoFaturamentoVendaNFCe) {
		this.apresentacaoFaturamentoVendaNFCe = apresentacaoFaturamentoVendaNFCe;
	}

	public boolean isApresentacaoFaturamentoVendaNFe() {
		return apresentacaoFaturamentoVendaNFe;
	}

	public void setApresentacaoFaturamentoVendaNFe(final boolean apresentacaoFaturamentoVendaNFe) {
		this.apresentacaoFaturamentoVendaNFe = apresentacaoFaturamentoVendaNFe;
	}

	public boolean isApresentacaoFaturamentoVendaNFSe() {
		return apresentacaoFaturamentoVendaNFSe;
	}

	public void setApresentacaoFaturamentoVendaNFSe(final boolean apresentacaoFaturamentoVendaNFSe) {
		this.apresentacaoFaturamentoVendaNFSe = apresentacaoFaturamentoVendaNFSe;
	}

	public boolean isApresentacaoFaturamentoCompraNFeCompra() {
		return apresentacaoFaturamentoCompraNFeCompra;
	}

	public void setApresentacaoFaturamentoCompraNFeCompra(final boolean apresentacaoFaturamentoCompraNFeCompra) {
		this.apresentacaoFaturamentoCompraNFeCompra = apresentacaoFaturamentoCompraNFeCompra;
	}

	public boolean isApresentacaoFaturamentoCompraNFeDevolucao() {
		return apresentacaoFaturamentoCompraNFeDevolucao;
	}

	public void setApresentacaoFaturamentoCompraNFeDevolucao(final boolean apresentacaoFaturamentoCompraNFeDevolucao) {
		this.apresentacaoFaturamentoCompraNFeDevolucao = apresentacaoFaturamentoCompraNFeDevolucao;
	}

	public boolean isApresentacaoFaturamentoCompraNFeBeneficiamento() {
		return apresentacaoFaturamentoCompraNFeBeneficiamento;
	}

	public void setApresentacaoFaturamentoCompraNFeBeneficiamento(final boolean apresentacaoFaturamentoCompraNFeBeneficiamento) {
		this.apresentacaoFaturamentoCompraNFeBeneficiamento = apresentacaoFaturamentoCompraNFeBeneficiamento;
	}

	public boolean isAplicacaoSistemaLookupPesquisas() {
		return aplicacaoSistemaLookupPesquisas;
	}

	public void setAplicacaoSistemaLookupPesquisas(final boolean aplicacaoSistemaLookupPesquisas) {
		this.aplicacaoSistemaLookupPesquisas = aplicacaoSistemaLookupPesquisas;
	}

	public boolean isAplicacaoSistemaGirdPesquisas() {
		return aplicacaoSistemaGirdPesquisas;
	}

	public void setAplicacaoSistemaGirdPesquisas(final boolean aplicacaoSistemaGirdPesquisas) {
		this.aplicacaoSistemaGirdPesquisas = aplicacaoSistemaGirdPesquisas;
	}

	public boolean isAplicacaoSistemaRelatoriosCadastrais() {
		return aplicacaoSistemaRelatoriosCadastrais;
	}

	public void setAplicacaoSistemaRelatoriosCadastrais(final boolean aplicacaoSistemaRelatoriosCadastrais) {
		this.aplicacaoSistemaRelatoriosCadastrais = aplicacaoSistemaRelatoriosCadastrais;
	}

	public boolean isAplicacaoSistemaGraficosCadastrais() {
		return aplicacaoSistemaGraficosCadastrais;
	}

	public void setAplicacaoSistemaGraficosCadastrais(final boolean aplicacaoSistemaGraficosCadastrais) {
		this.aplicacaoSistemaGraficosCadastrais = aplicacaoSistemaGraficosCadastrais;
	}

	public boolean isAplicacaoVendasGraficos() {
		return aplicacaoVendasGraficos;
	}

	public void setAplicacaoVendasGraficos(final boolean aplicacaoVendasGraficos) {
		this.aplicacaoVendasGraficos = aplicacaoVendasGraficos;
	}

	public boolean isAplicacaoVendasPesquisas() {
		return aplicacaoVendasPesquisas;
	}

	public void setAplicacaoVendasPesquisas(final boolean aplicacaoVendasPesquisas) {
		this.aplicacaoVendasPesquisas = aplicacaoVendasPesquisas;
	}

	public boolean isAplicacaoVendasRelatorios() {
		return aplicacaoVendasRelatorios;
	}

	public void setAplicacaoVendasRelatorios(final boolean aplicacaoVendasRelatorios) {
		this.aplicacaoVendasRelatorios = aplicacaoVendasRelatorios;
	}

	public boolean isAplicacaoVendasOrcamentos() {
		return aplicacaoVendasOrcamentos;
	}

	public void setAplicacaoVendasOrcamentos(final boolean aplicacaoVendasOrcamentos) {
		this.aplicacaoVendasOrcamentos = aplicacaoVendasOrcamentos;
	}

	public boolean isAplicacaoVendasPedidosDeVenda() {
		return aplicacaoVendasPedidosDeVenda;
	}

	public void setAplicacaoVendasPedidosDeVenda(final boolean aplicacaoVendasPedidosDeVenda) {
		this.aplicacaoVendasPedidosDeVenda = aplicacaoVendasPedidosDeVenda;
	}

	public boolean isAplicacaoVendasDAV() {
		return aplicacaoVendasDAV;
	}

	public void setAplicacaoVendasDAV(final boolean aplicacaoVendasDAV) {
		this.aplicacaoVendasDAV = aplicacaoVendasDAV;
	}

	public boolean isAplicacaoComprasGraficos() {
		return aplicacaoComprasGraficos;
	}

	public void setAplicacaoComprasGraficos(final boolean aplicacaoComprasGraficos) {
		this.aplicacaoComprasGraficos = aplicacaoComprasGraficos;
	}

	public boolean isAplicacaoComprasPesquisas() {
		return aplicacaoComprasPesquisas;
	}

	public void setAplicacaoComprasPesquisas(final boolean aplicacaoComprasPesquisas) {
		this.aplicacaoComprasPesquisas = aplicacaoComprasPesquisas;
	}

	public boolean isAplicacaoComprasRelatorios() {
		return aplicacaoComprasRelatorios;
	}

	public void setAplicacaoComprasRelatorios(final boolean aplicacaoComprasRelatorios) {
		this.aplicacaoComprasRelatorios = aplicacaoComprasRelatorios;
	}

	public boolean isAplicacaoComprasCotacoes() {
		return aplicacaoComprasCotacoes;
	}

	public void setAplicacaoComprasCotacoes(final boolean aplicacaoComprasCotacoes) {
		this.aplicacaoComprasCotacoes = aplicacaoComprasCotacoes;
	}

	public boolean isAplicacaoComprasPedidosCompra() {
		return aplicacaoComprasPedidosCompra;
	}

	public void setAplicacaoComprasPedidosCompra(final boolean aplicacaoComprasPedidosCompra) {
		this.aplicacaoComprasPedidosCompra = aplicacaoComprasPedidosCompra;
	}

	public boolean isAplicacaoComprasEntradasNFeCompra() {
		return aplicacaoComprasEntradasNFeCompra;
	}

	public void setAplicacaoComprasEntradasNFeCompra(final boolean aplicacaoComprasEntradasNFeCompra) {
		this.aplicacaoComprasEntradasNFeCompra = aplicacaoComprasEntradasNFeCompra;
	}

	public boolean isAplicacaoFaturamentoVendaCupomFiscal() {
		return aplicacaoFaturamentoVendaCupomFiscal;
	}

	public void setAplicacaoFaturamentoVendaCupomFiscal(final boolean aplicacaoFaturamentoVendaCupomFiscal) {
		this.aplicacaoFaturamentoVendaCupomFiscal = aplicacaoFaturamentoVendaCupomFiscal;
	}

	public boolean isAplicacaoFaturamentoVendaNFCe() {
		return aplicacaoFaturamentoVendaNFCe;
	}

	public void setAplicacaoFaturamentoVendaNFCe(final boolean aplicacaoFaturamentoVendaNFCe) {
		this.aplicacaoFaturamentoVendaNFCe = aplicacaoFaturamentoVendaNFCe;
	}

	public boolean isAplicacaoFaturamentoVendaNFe() {
		return aplicacaoFaturamentoVendaNFe;
	}

	public void setAplicacaoFaturamentoVendaNFe(final boolean aplicacaoFaturamentoVendaNFe) {
		this.aplicacaoFaturamentoVendaNFe = aplicacaoFaturamentoVendaNFe;
	}

	public boolean isAplicacaoFaturamentoVendaNFSe() {
		return aplicacaoFaturamentoVendaNFSe;
	}

	public void setAplicacaoFaturamentoVendaNFSe(final boolean aplicacaoFaturamentoVendaNFSe) {
		this.aplicacaoFaturamentoVendaNFSe = aplicacaoFaturamentoVendaNFSe;
	}

	public boolean isAplicacaoFaturamentoCompraNFeCompra() {
		return aplicacaoFaturamentoCompraNFeCompra;
	}

	public void setAplicacaoFaturamentoCompraNFeCompra(final boolean aplicacaoFaturamentoCompraNFeCompra) {
		this.aplicacaoFaturamentoCompraNFeCompra = aplicacaoFaturamentoCompraNFeCompra;
	}

	public boolean isAplicacaoFaturamentoCompraNFeDevolucao() {
		return aplicacaoFaturamentoCompraNFeDevolucao;
	}

	public void setAplicacaoFaturamentoCompraNFeDevolucao(final boolean aplicacaoFaturamentoCompraNFeDevolucao) {
		this.aplicacaoFaturamentoCompraNFeDevolucao = aplicacaoFaturamentoCompraNFeDevolucao;
	}

	public boolean isAplicacaoFaturamentoCompraNFeBeneficiamento() {
		return aplicacaoFaturamentoCompraNFeBeneficiamento;
	}

	public void setAplicacaoFaturamentoCompraNFeBeneficiamento(final boolean aplicacaoFaturamentoCompraNFeBeneficiamento) {
		this.aplicacaoFaturamentoCompraNFeBeneficiamento = aplicacaoFaturamentoCompraNFeBeneficiamento;
	}

}
