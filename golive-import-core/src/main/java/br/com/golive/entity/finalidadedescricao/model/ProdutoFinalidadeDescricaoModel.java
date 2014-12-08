package br.com.golive.entity.finalidadedescricao.model;

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
@Label(name = "label.cadastroFinalidadeDescricao")
@Table(name = "tbFinalidadeDescricaoProduto")
@Jasper(titulo = "label.cadastroFinalidadeDescricao.finalidadeDescricaoProduto", nomeDoArquivoGerado = "file.name.finalidadedescricao", nomeArquivoJasper = "FinalidadeDescricao")
public class ProdutoFinalidadeDescricaoModel extends Model {

	@Transient
	private static final long serialVersionUID = 1L;

	@Column(name = "NumeroMinimoCaracteres")
	private Long numeroMinimoCaracteres;

	@Column(name = "NumeroMaximoCaracteres")
	private Long numeroMaximoCaracteres;

	@Column(name = "FinalidadeDescricaoProduto")
	private String finalidadeDescricaoProduto;

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

	public Long getNumeroMinimoCaracteres() {
		return numeroMinimoCaracteres;
	}

	public void setNumeroMinimoCaracteres(Long numeroMinimoCaracteres) {
		this.numeroMinimoCaracteres = numeroMinimoCaracteres;
	}

	public Long getNumeroMaximoCaracteres() {
		return numeroMaximoCaracteres;
	}

	public void setNumeroMaximoCaracteres(Long numeroMaximoCaracteres) {
		this.numeroMaximoCaracteres = numeroMaximoCaracteres;
	}

	public String getFinalidadeDescricaoProduto() {
		return finalidadeDescricaoProduto;
	}

	public void setFinalidadeDescricaoProduto(String finalidadeDescricaoProduto) {
		this.finalidadeDescricaoProduto = finalidadeDescricaoProduto;
	}

	public boolean isApresentacaoSistemaLookupPesquisas() {
		return apresentacaoSistemaLookupPesquisas;
	}

	public void setApresentacaoSistemaLookupPesquisas(
			boolean apresentacaoSistemaLookupPesquisas) {
		this.apresentacaoSistemaLookupPesquisas = apresentacaoSistemaLookupPesquisas;
	}

	public boolean isApresentacaoSistemaGridPesquisas() {
		return apresentacaoSistemaGridPesquisas;
	}

	public void setApresentacaoSistemaGridPesquisas(
			boolean apresentacaoSistemaGridPesquisas) {
		this.apresentacaoSistemaGridPesquisas = apresentacaoSistemaGridPesquisas;
	}

	public boolean isApresentacaoSistemaRelatoriosCadastrais() {
		return apresentacaoSistemaRelatoriosCadastrais;
	}

	public void setApresentacaoSistemaRelatoriosCadastrais(
			boolean apresentacaoSistemaRelatoriosCadastrais) {
		this.apresentacaoSistemaRelatoriosCadastrais = apresentacaoSistemaRelatoriosCadastrais;
	}

	public boolean isApresentacaoSistemaGraficosCadastrais() {
		return apresentacaoSistemaGraficosCadastrais;
	}

	public void setApresentacaoSistemaGraficosCadastrais(
			boolean apresentacaoSistemaGraficosCadastrais) {
		this.apresentacaoSistemaGraficosCadastrais = apresentacaoSistemaGraficosCadastrais;
	}

	public boolean isApresentacaoVendasGraficos() {
		return apresentacaoVendasGraficos;
	}

	public void setApresentacaoVendasGraficos(boolean apresentacaoVendasGraficos) {
		this.apresentacaoVendasGraficos = apresentacaoVendasGraficos;
	}

	public boolean isApresentacaoVendasPesquisas() {
		return apresentacaoVendasPesquisas;
	}

	public void setApresentacaoVendasPesquisas(boolean apresentacaoVendasPesquisas) {
		this.apresentacaoVendasPesquisas = apresentacaoVendasPesquisas;
	}

	public boolean isApresentacaoVendasRelatorios() {
		return apresentacaoVendasRelatorios;
	}

	public void setApresentacaoVendasRelatorios(boolean apresentacaoVendasRelatorios) {
		this.apresentacaoVendasRelatorios = apresentacaoVendasRelatorios;
	}

	public boolean isApresentacaoVendasOrcamentos() {
		return apresentacaoVendasOrcamentos;
	}

	public void setApresentacaoVendasOrcamentos(boolean apresentacaoVendasOrcamentos) {
		this.apresentacaoVendasOrcamentos = apresentacaoVendasOrcamentos;
	}

	public boolean isApresentacaoVendasPedidosVenda() {
		return apresentacaoVendasPedidosVenda;
	}

	public void setApresentacaoVendasPedidosVenda(
			boolean apresentacaoVendasPedidosVenda) {
		this.apresentacaoVendasPedidosVenda = apresentacaoVendasPedidosVenda;
	}

	public boolean isApresentacaoVendasDAV() {
		return apresentacaoVendasDAV;
	}

	public void setApresentacaoVendasDAV(boolean apresentacaoVendasDAV) {
		this.apresentacaoVendasDAV = apresentacaoVendasDAV;
	}

	public boolean isApresentacaoComprasGraficos() {
		return apresentacaoComprasGraficos;
	}

	public void setApresentacaoComprasGraficos(boolean apresentacaoComprasGraficos) {
		this.apresentacaoComprasGraficos = apresentacaoComprasGraficos;
	}

	public boolean isApresentacaoComprasPesquisas() {
		return apresentacaoComprasPesquisas;
	}

	public void setApresentacaoComprasPesquisas(boolean apresentacaoComprasPesquisas) {
		this.apresentacaoComprasPesquisas = apresentacaoComprasPesquisas;
	}

	public boolean isApresentacaoComprasRelatorios() {
		return apresentacaoComprasRelatorios;
	}

	public void setApresentacaoComprasRelatorios(
			boolean apresentacaoComprasRelatorios) {
		this.apresentacaoComprasRelatorios = apresentacaoComprasRelatorios;
	}

	public boolean isApresentacaoComprasCotacoes() {
		return apresentacaoComprasCotacoes;
	}

	public void setApresentacaoComprasCotacoes(boolean apresentacaoComprasCotacoes) {
		this.apresentacaoComprasCotacoes = apresentacaoComprasCotacoes;
	}

	public boolean isApresentacaoComprasPedidosCompra() {
		return apresentacaoComprasPedidosCompra;
	}

	public void setApresentacaoComprasPedidosCompra(
			boolean apresentacaoComprasPedidosCompra) {
		this.apresentacaoComprasPedidosCompra = apresentacaoComprasPedidosCompra;
	}

	public boolean isApresentacaoComprasEntradasNFeCompra() {
		return apresentacaoComprasEntradasNFeCompra;
	}

	public void setApresentacaoComprasEntradasNFeCompra(
			boolean apresentacaoComprasEntradasNFeCompra) {
		this.apresentacaoComprasEntradasNFeCompra = apresentacaoComprasEntradasNFeCompra;
	}

	public boolean isApresentacaoFaturamentoVendaCumpomFiscal() {
		return apresentacaoFaturamentoVendaCumpomFiscal;
	}

	public void setApresentacaoFaturamentoVendaCumpomFiscal(
			boolean apresentacaoFaturamentoVendaCumpomFiscal) {
		this.apresentacaoFaturamentoVendaCumpomFiscal = apresentacaoFaturamentoVendaCumpomFiscal;
	}

	public boolean isApresentacaoFaturamentoVendaNFCe() {
		return apresentacaoFaturamentoVendaNFCe;
	}

	public void setApresentacaoFaturamentoVendaNFCe(
			boolean apresentacaoFaturamentoVendaNFCe) {
		this.apresentacaoFaturamentoVendaNFCe = apresentacaoFaturamentoVendaNFCe;
	}

	public boolean isApresentacaoFaturamentoVendaNFe() {
		return apresentacaoFaturamentoVendaNFe;
	}

	public void setApresentacaoFaturamentoVendaNFe(
			boolean apresentacaoFaturamentoVendaNFe) {
		this.apresentacaoFaturamentoVendaNFe = apresentacaoFaturamentoVendaNFe;
	}

	public boolean isApresentacaoFaturamentoVendaNFSe() {
		return apresentacaoFaturamentoVendaNFSe;
	}

	public void setApresentacaoFaturamentoVendaNFSe(
			boolean apresentacaoFaturamentoVendaNFSe) {
		this.apresentacaoFaturamentoVendaNFSe = apresentacaoFaturamentoVendaNFSe;
	}

	public boolean isApresentacaoFaturamentoCompraNFeCompra() {
		return apresentacaoFaturamentoCompraNFeCompra;
	}

	public void setApresentacaoFaturamentoCompraNFeCompra(
			boolean apresentacaoFaturamentoCompraNFeCompra) {
		this.apresentacaoFaturamentoCompraNFeCompra = apresentacaoFaturamentoCompraNFeCompra;
	}

	public boolean isApresentacaoFaturamentoCompraNFeDevolucao() {
		return apresentacaoFaturamentoCompraNFeDevolucao;
	}

	public void setApresentacaoFaturamentoCompraNFeDevolucao(
			boolean apresentacaoFaturamentoCompraNFeDevolucao) {
		this.apresentacaoFaturamentoCompraNFeDevolucao = apresentacaoFaturamentoCompraNFeDevolucao;
	}

	public boolean isApresentacaoFaturamentoCompraNFeBeneficiamento() {
		return apresentacaoFaturamentoCompraNFeBeneficiamento;
	}

	public void setApresentacaoFaturamentoCompraNFeBeneficiamento(
			boolean apresentacaoFaturamentoCompraNFeBeneficiamento) {
		this.apresentacaoFaturamentoCompraNFeBeneficiamento = apresentacaoFaturamentoCompraNFeBeneficiamento;
	}

	public boolean isAplicacaoSistemaLookupPesquisas() {
		return aplicacaoSistemaLookupPesquisas;
	}

	public void setAplicacaoSistemaLookupPesquisas(
			boolean aplicacaoSistemaLookupPesquisas) {
		this.aplicacaoSistemaLookupPesquisas = aplicacaoSistemaLookupPesquisas;
	}

	public boolean isAplicacaoSistemaGirdPesquisas() {
		return aplicacaoSistemaGirdPesquisas;
	}

	public void setAplicacaoSistemaGirdPesquisas(
			boolean aplicacaoSistemaGirdPesquisas) {
		this.aplicacaoSistemaGirdPesquisas = aplicacaoSistemaGirdPesquisas;
	}

	public boolean isAplicacaoSistemaRelatoriosCadastrais() {
		return aplicacaoSistemaRelatoriosCadastrais;
	}

	public void setAplicacaoSistemaRelatoriosCadastrais(
			boolean aplicacaoSistemaRelatoriosCadastrais) {
		this.aplicacaoSistemaRelatoriosCadastrais = aplicacaoSistemaRelatoriosCadastrais;
	}

	public boolean isAplicacaoSistemaGraficosCadastrais() {
		return aplicacaoSistemaGraficosCadastrais;
	}

	public void setAplicacaoSistemaGraficosCadastrais(
			boolean aplicacaoSistemaGraficosCadastrais) {
		this.aplicacaoSistemaGraficosCadastrais = aplicacaoSistemaGraficosCadastrais;
	}

	public boolean isAplicacaoVendasGraficos() {
		return aplicacaoVendasGraficos;
	}

	public void setAplicacaoVendasGraficos(boolean aplicacaoVendasGraficos) {
		this.aplicacaoVendasGraficos = aplicacaoVendasGraficos;
	}

	public boolean isAplicacaoVendasPesquisas() {
		return aplicacaoVendasPesquisas;
	}

	public void setAplicacaoVendasPesquisas(boolean aplicacaoVendasPesquisas) {
		this.aplicacaoVendasPesquisas = aplicacaoVendasPesquisas;
	}

	public boolean isAplicacaoVendasRelatorios() {
		return aplicacaoVendasRelatorios;
	}

	public void setAplicacaoVendasRelatorios(boolean aplicacaoVendasRelatorios) {
		this.aplicacaoVendasRelatorios = aplicacaoVendasRelatorios;
	}

	public boolean isAplicacaoVendasOrcamentos() {
		return aplicacaoVendasOrcamentos;
	}

	public void setAplicacaoVendasOrcamentos(boolean aplicacaoVendasOrcamentos) {
		this.aplicacaoVendasOrcamentos = aplicacaoVendasOrcamentos;
	}

	public boolean isAplicacaoVendasPedidosDeVenda() {
		return aplicacaoVendasPedidosDeVenda;
	}

	public void setAplicacaoVendasPedidosDeVenda(
			boolean aplicacaoVendasPedidosDeVenda) {
		this.aplicacaoVendasPedidosDeVenda = aplicacaoVendasPedidosDeVenda;
	}

	public boolean isAplicacaoVendasDAV() {
		return aplicacaoVendasDAV;
	}

	public void setAplicacaoVendasDAV(boolean aplicacaoVendasDAV) {
		this.aplicacaoVendasDAV = aplicacaoVendasDAV;
	}

	public boolean isAplicacaoComprasGraficos() {
		return aplicacaoComprasGraficos;
	}

	public void setAplicacaoComprasGraficos(boolean aplicacaoComprasGraficos) {
		this.aplicacaoComprasGraficos = aplicacaoComprasGraficos;
	}

	public boolean isAplicacaoComprasPesquisas() {
		return aplicacaoComprasPesquisas;
	}

	public void setAplicacaoComprasPesquisas(boolean aplicacaoComprasPesquisas) {
		this.aplicacaoComprasPesquisas = aplicacaoComprasPesquisas;
	}

	public boolean isAplicacaoComprasRelatorios() {
		return aplicacaoComprasRelatorios;
	}

	public void setAplicacaoComprasRelatorios(boolean aplicacaoComprasRelatorios) {
		this.aplicacaoComprasRelatorios = aplicacaoComprasRelatorios;
	}

	public boolean isAplicacaoComprasCotacoes() {
		return aplicacaoComprasCotacoes;
	}

	public void setAplicacaoComprasCotacoes(boolean aplicacaoComprasCotacoes) {
		this.aplicacaoComprasCotacoes = aplicacaoComprasCotacoes;
	}

	public boolean isAplicacaoComprasPedidosCompra() {
		return aplicacaoComprasPedidosCompra;
	}

	public void setAplicacaoComprasPedidosCompra(
			boolean aplicacaoComprasPedidosCompra) {
		this.aplicacaoComprasPedidosCompra = aplicacaoComprasPedidosCompra;
	}

	public boolean isAplicacaoComprasEntradasNFeCompra() {
		return aplicacaoComprasEntradasNFeCompra;
	}

	public void setAplicacaoComprasEntradasNFeCompra(
			boolean aplicacaoComprasEntradasNFeCompra) {
		this.aplicacaoComprasEntradasNFeCompra = aplicacaoComprasEntradasNFeCompra;
	}

	public boolean isAplicacaoFaturamentoVendaCupomFiscal() {
		return aplicacaoFaturamentoVendaCupomFiscal;
	}

	public void setAplicacaoFaturamentoVendaCupomFiscal(
			boolean aplicacaoFaturamentoVendaCupomFiscal) {
		this.aplicacaoFaturamentoVendaCupomFiscal = aplicacaoFaturamentoVendaCupomFiscal;
	}

	public boolean isAplicacaoFaturamentoVendaNFCe() {
		return aplicacaoFaturamentoVendaNFCe;
	}

	public void setAplicacaoFaturamentoVendaNFCe(
			boolean aplicacaoFaturamentoVendaNFCe) {
		this.aplicacaoFaturamentoVendaNFCe = aplicacaoFaturamentoVendaNFCe;
	}

	public boolean isAplicacaoFaturamentoVendaNFe() {
		return aplicacaoFaturamentoVendaNFe;
	}

	public void setAplicacaoFaturamentoVendaNFe(boolean aplicacaoFaturamentoVendaNFe) {
		this.aplicacaoFaturamentoVendaNFe = aplicacaoFaturamentoVendaNFe;
	}

	public boolean isAplicacaoFaturamentoVendaNFSe() {
		return aplicacaoFaturamentoVendaNFSe;
	}

	public void setAplicacaoFaturamentoVendaNFSe(
			boolean aplicacaoFaturamentoVendaNFSe) {
		this.aplicacaoFaturamentoVendaNFSe = aplicacaoFaturamentoVendaNFSe;
	}

	public boolean isAplicacaoFaturamentoCompraNFeCompra() {
		return aplicacaoFaturamentoCompraNFeCompra;
	}

	public void setAplicacaoFaturamentoCompraNFeCompra(
			boolean aplicacaoFaturamentoCompraNFeCompra) {
		this.aplicacaoFaturamentoCompraNFeCompra = aplicacaoFaturamentoCompraNFeCompra;
	}

	public boolean isAplicacaoFaturamentoCompraNFeDevolucao() {
		return aplicacaoFaturamentoCompraNFeDevolucao;
	}

	public void setAplicacaoFaturamentoCompraNFeDevolucao(
			boolean aplicacaoFaturamentoCompraNFeDevolucao) {
		this.aplicacaoFaturamentoCompraNFeDevolucao = aplicacaoFaturamentoCompraNFeDevolucao;
	}

	public boolean isAplicacaoFaturamentoCompraNFeBeneficiamento() {
		return aplicacaoFaturamentoCompraNFeBeneficiamento;
	}

	public void setAplicacaoFaturamentoCompraNFeBeneficiamento(
			boolean aplicacaoFaturamentoCompraNFeBeneficiamento) {
		this.aplicacaoFaturamentoCompraNFeBeneficiamento = aplicacaoFaturamentoCompraNFeBeneficiamento;
	}

	public ProdutoFinalidadeDescricaoModel(Long numeroMinimoCaracteres,
			Long numeroMaximoCaracteres, String finalidadeDescricaoProduto,
			boolean apresentacaoSistemaLookupPesquisas,
			boolean apresentacaoSistemaGridPesquisas,
			boolean apresentacaoSistemaRelatoriosCadastrais,
			boolean apresentacaoSistemaGraficosCadastrais,
			boolean apresentacaoVendasGraficos,
			boolean apresentacaoVendasPesquisas,
			boolean apresentacaoVendasRelatorios,
			boolean apresentacaoVendasOrcamentos,
			boolean apresentacaoVendasPedidosVenda,
			boolean apresentacaoVendasDAV, boolean apresentacaoComprasGraficos,
			boolean apresentacaoComprasPesquisas,
			boolean apresentacaoComprasRelatorios,
			boolean apresentacaoComprasCotacoes,
			boolean apresentacaoComprasPedidosCompra,
			boolean apresentacaoComprasEntradasNFeCompra,
			boolean apresentacaoFaturamentoVendaCumpomFiscal,
			boolean apresentacaoFaturamentoVendaNFCe,
			boolean apresentacaoFaturamentoVendaNFe,
			boolean apresentacaoFaturamentoVendaNFSe,
			boolean apresentacaoFaturamentoCompraNFeCompra,
			boolean apresentacaoFaturamentoCompraNFeDevolucao,
			boolean apresentacaoFaturamentoCompraNFeBeneficiamento,
			boolean aplicacaoSistemaLookupPesquisas,
			boolean aplicacaoSistemaGirdPesquisas,
			boolean aplicacaoSistemaRelatoriosCadastrais,
			boolean aplicacaoSistemaGraficosCadastrais,
			boolean aplicacaoVendasGraficos, boolean aplicacaoVendasPesquisas,
			boolean aplicacaoVendasRelatorios,
			boolean aplicacaoVendasOrcamentos,
			boolean aplicacaoVendasPedidosDeVenda, boolean aplicacaoVendasDAV,
			boolean aplicacaoComprasGraficos,
			boolean aplicacaoComprasPesquisas,
			boolean aplicacaoComprasRelatorios,
			boolean aplicacaoComprasCotacoes,
			boolean aplicacaoComprasPedidosCompra,
			boolean aplicacaoComprasEntradasNFeCompra,
			boolean aplicacaoFaturamentoVendaCupomFiscal,
			boolean aplicacaoFaturamentoVendaNFCe,
			boolean aplicacaoFaturamentoVendaNFe,
			boolean aplicacaoFaturamentoVendaNFSe,
			boolean aplicacaoFaturamentoCompraNFeCompra,
			boolean aplicacaoFaturamentoCompraNFeDevolucao,
			boolean aplicacaoFaturamentoCompraNFeBeneficiamento) {
		super();
		this.numeroMinimoCaracteres = numeroMinimoCaracteres;
		this.numeroMaximoCaracteres = numeroMaximoCaracteres;
		this.finalidadeDescricaoProduto = finalidadeDescricaoProduto;
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

	public ProdutoFinalidadeDescricaoModel() {
		super();
	}

	public ProdutoFinalidadeDescricaoModel(Long id, Calendar dataInclusao,
			Calendar dataAlteracao) {
		super(id, dataInclusao, dataAlteracao);
	}
}