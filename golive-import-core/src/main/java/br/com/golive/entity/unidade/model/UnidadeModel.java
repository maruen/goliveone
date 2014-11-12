package br.com.golive.entity.unidade.model;

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
@Table(name = "tbUnidade")
@Jasper(titulo = "Unidade", nomeDoArquivoGerado = "file.name.model", nomeArquivoJasper = "Unidade")
@Label(name = "label.cadastroUnidade")
public class UnidadeModel extends Model {

	@Transient
	private static final long serialVersionUID = 6943603852833041323L;

	@Column(name = "Abreviacao")
	private String abreviacao;

	@Column(name = "Unidade")
	private String unidade;

	@TransientColumn
	@Column(name = "UtilizacaoProdutoProdutos")
	private boolean utilizacaoProdutoProdutos;

	@TransientColumn
	@Column(name = "UtilizacaoProdutoCodigoBarrasProdutos")
	private boolean utilizacaoProdutoCodigoBarrasProdutos;

	@TransientColumn
	@Column(name = "UtilizacaoProdutoPadraoLargura")
	private boolean utilizacaoProdutoPadraoLargura;

	@TransientColumn
	@Column(name = "UtilizacaoProdutoPadraoEspessura")
	private boolean utilizacaoProdutoPadraoEspessura;

	@TransientColumn
	@Column(name = "UtilizacaoProdutoPesoLiquido")
	private boolean utilizacaoProdutoPesoLiquido;

	@TransientColumn
	@Column(name = "UtilizacaoProdutoPesoBruto")
	private boolean utilizacaoProdutoPesoBruto;

	@TransientColumn
	@Column(name = "UtilizacaoVendasQuantMinPedidoVenda")
	private boolean utilizacaoVendasQuantMinPedidoVenda;

	@TransientColumn
	@Column(name = "UtilizacaoVendasQuantMaxPedidoVenda")
	private boolean utilizacaoVendasQuantMaxPedidoVenda;

	@TransientColumn
	@Column(name = "UtilizacaoVendasTabelaPrecos")
	private boolean utilizacaoVendasTabelaPrecos;

	@TransientColumn
	@Column(name = "UtilizacaoComprasQuantMinPedidoCompra")
	private boolean utilizacaoComprasQuantMinPedidoCompra;

	@TransientColumn
	@Column(name = "UtilizacaoComprasQuantMaxPedidoCompra")
	private boolean utilizacaoComprasQuantMaxPedidoCompra;

	@TransientColumn
	@Column(name = "UtilizacaoComprasAnaliseComparativaPedidoCompra")
	private boolean utilizacaoComprasAnaliseComparativaPedidoCompra;

	@TransientColumn
	@Column(name = "UtilizacaoComprasAnaliseComparativaEstoque")
	private boolean utilizacaoComprasAnaliseComparativaEstoque;

	@TransientColumn
	@Column(name = "UtilizacaoFaturamentoCupomFiscal")
	private boolean utilizacaoFaturamentoCupomFiscal;

	@TransientColumn
	@Column(name = "UtilizacaoFaturamentoNFCe")
	private boolean utilizacaoFaturamentoNFCe;

	@TransientColumn
	@Column(name = "UtilizacaoFaturamentoNFeVenda")
	private boolean utilizacaoFaturamentoNFeVenda;

	@TransientColumn
	@Column(name = "UtilizacaoFaturamentoNFeDevolucao")
	private boolean utilizacaoFaturamentoNFeDevolucao;

	@TransientColumn
	@Column(name = "UtilizacaoFaturamentoNFeBeneficiamento")
	private boolean utilizacaoFaturamentoNFeBeneficiamento;

	@TransientColumn
	@Column(name = "UtilizacaoFaturamentoNFSe")
	private boolean utilizacaoFaturamentoNFSe;

	public UnidadeModel() {
		super();
	}

	public UnidadeModel(final Long id, final Calendar dataInclusao, final Calendar dataAlteracao) {
		super(id, dataInclusao, dataAlteracao);
	}

	public UnidadeModel(final String abreviacao, final String unidade, final boolean utilizacaoProdutoProdutos, final boolean utilizacaoProdutoCodigoBarrasProdutos, final boolean utilizacaoProdutoPadraoLargura, final boolean utilizacaoProdutoPadraoEspessura, final boolean utilizacaoProdutoPesoLiquido, final boolean utilizacaoProdutoPesoBruto, final boolean utilizacaoVendasQuantMinPedidoVenda, final boolean utilizacaoVendasQuantMaxPedidoVenda, final boolean utilizacaoVendasTabelaPrecos, final boolean utilizacaoComprasQuantMinPedidoCompra, final boolean utilizacaoComprasQuantMaxPedidoCompra, final boolean utilizacaoComprasAnaliseComparativaPedidoCompra, final boolean utilizacaoComprasAnaliseComparativaEstoque, final boolean utilizacaoFaturamentoCupomFiscal, final boolean utilizacaoFaturamentoNFCe, final boolean utilizacaoFaturamentoNFeVenda, final boolean utilizacaoFaturamentoNFeDevolucao, final boolean utilizacaoFaturamentoNFeBeneficiamento, final boolean utilizacaoFaturamentoNFSe) {
		super();
		this.abreviacao = abreviacao;
		this.unidade = unidade;
		this.utilizacaoProdutoProdutos = utilizacaoProdutoProdutos;
		this.utilizacaoProdutoCodigoBarrasProdutos = utilizacaoProdutoCodigoBarrasProdutos;
		this.utilizacaoProdutoPadraoLargura = utilizacaoProdutoPadraoLargura;
		this.utilizacaoProdutoPadraoEspessura = utilizacaoProdutoPadraoEspessura;
		this.utilizacaoProdutoPesoLiquido = utilizacaoProdutoPesoLiquido;
		this.utilizacaoProdutoPesoBruto = utilizacaoProdutoPesoBruto;
		this.utilizacaoVendasQuantMinPedidoVenda = utilizacaoVendasQuantMinPedidoVenda;
		this.utilizacaoVendasQuantMaxPedidoVenda = utilizacaoVendasQuantMaxPedidoVenda;
		this.utilizacaoVendasTabelaPrecos = utilizacaoVendasTabelaPrecos;
		this.utilizacaoComprasQuantMinPedidoCompra = utilizacaoComprasQuantMinPedidoCompra;
		this.utilizacaoComprasQuantMaxPedidoCompra = utilizacaoComprasQuantMaxPedidoCompra;
		this.utilizacaoComprasAnaliseComparativaPedidoCompra = utilizacaoComprasAnaliseComparativaPedidoCompra;
		this.utilizacaoComprasAnaliseComparativaEstoque = utilizacaoComprasAnaliseComparativaEstoque;
		this.utilizacaoFaturamentoCupomFiscal = utilizacaoFaturamentoCupomFiscal;
		this.utilizacaoFaturamentoNFCe = utilizacaoFaturamentoNFCe;
		this.utilizacaoFaturamentoNFeVenda = utilizacaoFaturamentoNFeVenda;
		this.utilizacaoFaturamentoNFeDevolucao = utilizacaoFaturamentoNFeDevolucao;
		this.utilizacaoFaturamentoNFeBeneficiamento = utilizacaoFaturamentoNFeBeneficiamento;
		this.utilizacaoFaturamentoNFSe = utilizacaoFaturamentoNFSe;
	}

	public String getAbreviacao() {
		return abreviacao;
	}

	public void setAbreviacao(final String abreviacao) {
		this.abreviacao = abreviacao;
	}

	public String getUnidade() {
		return unidade;
	}

	public void setUnidade(final String unidade) {
		this.unidade = unidade;
	}

	public boolean isUtilizacaoProdutoProdutos() {
		return utilizacaoProdutoProdutos;
	}

	public void setUtilizacaoProdutoProdutos(final boolean utilizacaoProdutoProdutos) {
		this.utilizacaoProdutoProdutos = utilizacaoProdutoProdutos;
	}

	public boolean isUtilizacaoProdutoCodigoBarrasProdutos() {
		return utilizacaoProdutoCodigoBarrasProdutos;
	}

	public void setUtilizacaoProdutoCodigoBarrasProdutos(final boolean utilizacaoProdutoCodigoBarrasProdutos) {
		this.utilizacaoProdutoCodigoBarrasProdutos = utilizacaoProdutoCodigoBarrasProdutos;
	}

	public boolean isUtilizacaoProdutoPadraoLargura() {
		return utilizacaoProdutoPadraoLargura;
	}

	public void setUtilizacaoProdutoPadraoLargura(final boolean utilizacaoProdutoPadraoLargura) {
		this.utilizacaoProdutoPadraoLargura = utilizacaoProdutoPadraoLargura;
	}

	public boolean isUtilizacaoProdutoPadraoEspessura() {
		return utilizacaoProdutoPadraoEspessura;
	}

	public void setUtilizacaoProdutoPadraoEspessura(final boolean utilizacaoProdutoPadraoEspessura) {
		this.utilizacaoProdutoPadraoEspessura = utilizacaoProdutoPadraoEspessura;
	}

	public boolean isUtilizacaoProdutoPesoLiquido() {
		return utilizacaoProdutoPesoLiquido;
	}

	public void setUtilizacaoProdutoPesoLiquido(final boolean utilizacaoProdutoPesoLiquido) {
		this.utilizacaoProdutoPesoLiquido = utilizacaoProdutoPesoLiquido;
	}

	public boolean isUtilizacaoProdutoPesoBruto() {
		return utilizacaoProdutoPesoBruto;
	}

	public void setUtilizacaoProdutoPesoBruto(final boolean utilizacaoProdutoPesoBruto) {
		this.utilizacaoProdutoPesoBruto = utilizacaoProdutoPesoBruto;
	}

	public boolean isUtilizacaoVendasQuantMinPedidoVenda() {
		return utilizacaoVendasQuantMinPedidoVenda;
	}

	public void setUtilizacaoVendasQuantMinPedidoVenda(final boolean utilizacaoVendasQuantMinPedidoVenda) {
		this.utilizacaoVendasQuantMinPedidoVenda = utilizacaoVendasQuantMinPedidoVenda;
	}

	public boolean isUtilizacaoVendasQuantMaxPedidoVenda() {
		return utilizacaoVendasQuantMaxPedidoVenda;
	}

	public void setUtilizacaoVendasQuantMaxPedidoVenda(final boolean utilizacaoVendasQuantMaxPedidoVenda) {
		this.utilizacaoVendasQuantMaxPedidoVenda = utilizacaoVendasQuantMaxPedidoVenda;
	}

	public boolean isUtilizacaoVendasTabelaPrecos() {
		return utilizacaoVendasTabelaPrecos;
	}

	public void setUtilizacaoVendasTabelaPrecos(final boolean utilizacaoVendasTabelaPrecos) {
		this.utilizacaoVendasTabelaPrecos = utilizacaoVendasTabelaPrecos;
	}

	public boolean isUtilizacaoComprasQuantMinPedidoCompra() {
		return utilizacaoComprasQuantMinPedidoCompra;
	}

	public void setUtilizacaoComprasQuantMinPedidoCompra(final boolean utilizacaoComprasQuantMinPedidoCompra) {
		this.utilizacaoComprasQuantMinPedidoCompra = utilizacaoComprasQuantMinPedidoCompra;
	}

	public boolean isUtilizacaoComprasQuantMaxPedidoCompra() {
		return utilizacaoComprasQuantMaxPedidoCompra;
	}

	public void setUtilizacaoComprasQuantMaxPedidoCompra(final boolean utilizacaoComprasQuantMaxPedidoCompra) {
		this.utilizacaoComprasQuantMaxPedidoCompra = utilizacaoComprasQuantMaxPedidoCompra;
	}

	public boolean isUtilizacaoComprasAnaliseComparativaPedidoCompra() {
		return utilizacaoComprasAnaliseComparativaPedidoCompra;
	}

	public void setUtilizacaoComprasAnaliseComparativaPedidoCompra(final boolean utilizacaoComprasAnaliseComparativaPedidoCompra) {
		this.utilizacaoComprasAnaliseComparativaPedidoCompra = utilizacaoComprasAnaliseComparativaPedidoCompra;
	}

	public boolean isUtilizacaoComprasAnaliseComparativaEstoque() {
		return utilizacaoComprasAnaliseComparativaEstoque;
	}

	public void setUtilizacaoComprasAnaliseComparativaEstoque(final boolean utilizacaoComprasAnaliseComparativaEstoque) {
		this.utilizacaoComprasAnaliseComparativaEstoque = utilizacaoComprasAnaliseComparativaEstoque;
	}

	public boolean isUtilizacaoFaturamentoCupomFiscal() {
		return utilizacaoFaturamentoCupomFiscal;
	}

	public void setUtilizacaoFaturamentoCupomFiscal(final boolean utilizacaoFaturamentoCupomFiscal) {
		this.utilizacaoFaturamentoCupomFiscal = utilizacaoFaturamentoCupomFiscal;
	}

	public boolean isUtilizacaoFaturamentoNFCe() {
		return utilizacaoFaturamentoNFCe;
	}

	public void setUtilizacaoFaturamentoNFCe(final boolean utilizacaoFaturamentoNFCe) {
		this.utilizacaoFaturamentoNFCe = utilizacaoFaturamentoNFCe;
	}

	public boolean isUtilizacaoFaturamentoNFeVenda() {
		return utilizacaoFaturamentoNFeVenda;
	}

	public void setUtilizacaoFaturamentoNFeVenda(final boolean utilizacaoFaturamentoNFeVenda) {
		this.utilizacaoFaturamentoNFeVenda = utilizacaoFaturamentoNFeVenda;
	}

	public boolean isUtilizacaoFaturamentoNFeDevolucao() {
		return utilizacaoFaturamentoNFeDevolucao;
	}

	public void setUtilizacaoFaturamentoNFeDevolucao(final boolean utilizacaoFaturamentoNFeDevolucao) {
		this.utilizacaoFaturamentoNFeDevolucao = utilizacaoFaturamentoNFeDevolucao;
	}

	public boolean isUtilizacaoFaturamentoNFeBeneficiamento() {
		return utilizacaoFaturamentoNFeBeneficiamento;
	}

	public void setUtilizacaoFaturamentoNFeBeneficiamento(final boolean utilizacaoFaturamentoNFeBeneficiamento) {
		this.utilizacaoFaturamentoNFeBeneficiamento = utilizacaoFaturamentoNFeBeneficiamento;
	}

	public boolean isUtilizacaoFaturamentoNFSe() {
		return utilizacaoFaturamentoNFSe;
	}

	public void setUtilizacaoFaturamentoNFSe(final boolean utilizacaoFaturamentoNFSe) {
		this.utilizacaoFaturamentoNFSe = utilizacaoFaturamentoNFSe;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = (prime * result) + ((abreviacao == null) ? 0 : abreviacao.hashCode());
		result = (prime * result) + ((unidade == null) ? 0 : unidade.hashCode());
		result = (prime * result) + (utilizacaoComprasAnaliseComparativaEstoque ? 1231 : 1237);
		result = (prime * result) + (utilizacaoComprasAnaliseComparativaPedidoCompra ? 1231 : 1237);
		result = (prime * result) + (utilizacaoComprasQuantMaxPedidoCompra ? 1231 : 1237);
		result = (prime * result) + (utilizacaoComprasQuantMinPedidoCompra ? 1231 : 1237);
		result = (prime * result) + (utilizacaoFaturamentoCupomFiscal ? 1231 : 1237);
		result = (prime * result) + (utilizacaoFaturamentoNFCe ? 1231 : 1237);
		result = (prime * result) + (utilizacaoFaturamentoNFSe ? 1231 : 1237);
		result = (prime * result) + (utilizacaoFaturamentoNFeBeneficiamento ? 1231 : 1237);
		result = (prime * result) + (utilizacaoFaturamentoNFeDevolucao ? 1231 : 1237);
		result = (prime * result) + (utilizacaoFaturamentoNFeVenda ? 1231 : 1237);
		result = (prime * result) + (utilizacaoProdutoCodigoBarrasProdutos ? 1231 : 1237);
		result = (prime * result) + (utilizacaoProdutoPadraoEspessura ? 1231 : 1237);
		result = (prime * result) + (utilizacaoProdutoPadraoLargura ? 1231 : 1237);
		result = (prime * result) + (utilizacaoProdutoPesoBruto ? 1231 : 1237);
		result = (prime * result) + (utilizacaoProdutoPesoLiquido ? 1231 : 1237);
		result = (prime * result) + (utilizacaoProdutoProdutos ? 1231 : 1237);
		result = (prime * result) + (utilizacaoVendasQuantMaxPedidoVenda ? 1231 : 1237);
		result = (prime * result) + (utilizacaoVendasQuantMinPedidoVenda ? 1231 : 1237);
		result = (prime * result) + (utilizacaoVendasTabelaPrecos ? 1231 : 1237);
		return result;
	}

	@Override
	public boolean equals(final Object obj) {
		if (this == obj) {
			return true;
		}
		if (!super.equals(obj)) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		final UnidadeModel other = (UnidadeModel) obj;
		if (abreviacao == null) {
			if (other.abreviacao != null) {
				return false;
			}
		} else if (!abreviacao.equals(other.abreviacao)) {
			return false;
		}
		if (unidade == null) {
			if (other.unidade != null) {
				return false;
			}
		} else if (!unidade.equals(other.unidade)) {
			return false;
		}
		if (utilizacaoComprasAnaliseComparativaEstoque != other.utilizacaoComprasAnaliseComparativaEstoque) {
			return false;
		}
		if (utilizacaoComprasAnaliseComparativaPedidoCompra != other.utilizacaoComprasAnaliseComparativaPedidoCompra) {
			return false;
		}
		if (utilizacaoComprasQuantMaxPedidoCompra != other.utilizacaoComprasQuantMaxPedidoCompra) {
			return false;
		}
		if (utilizacaoComprasQuantMinPedidoCompra != other.utilizacaoComprasQuantMinPedidoCompra) {
			return false;
		}
		if (utilizacaoFaturamentoCupomFiscal != other.utilizacaoFaturamentoCupomFiscal) {
			return false;
		}
		if (utilizacaoFaturamentoNFCe != other.utilizacaoFaturamentoNFCe) {
			return false;
		}
		if (utilizacaoFaturamentoNFSe != other.utilizacaoFaturamentoNFSe) {
			return false;
		}
		if (utilizacaoFaturamentoNFeBeneficiamento != other.utilizacaoFaturamentoNFeBeneficiamento) {
			return false;
		}
		if (utilizacaoFaturamentoNFeDevolucao != other.utilizacaoFaturamentoNFeDevolucao) {
			return false;
		}
		if (utilizacaoFaturamentoNFeVenda != other.utilizacaoFaturamentoNFeVenda) {
			return false;
		}
		if (utilizacaoProdutoCodigoBarrasProdutos != other.utilizacaoProdutoCodigoBarrasProdutos) {
			return false;
		}
		if (utilizacaoProdutoPadraoEspessura != other.utilizacaoProdutoPadraoEspessura) {
			return false;
		}
		if (utilizacaoProdutoPadraoLargura != other.utilizacaoProdutoPadraoLargura) {
			return false;
		}
		if (utilizacaoProdutoPesoBruto != other.utilizacaoProdutoPesoBruto) {
			return false;
		}
		if (utilizacaoProdutoPesoLiquido != other.utilizacaoProdutoPesoLiquido) {
			return false;
		}
		if (utilizacaoProdutoProdutos != other.utilizacaoProdutoProdutos) {
			return false;
		}
		if (utilizacaoVendasQuantMaxPedidoVenda != other.utilizacaoVendasQuantMaxPedidoVenda) {
			return false;
		}
		if (utilizacaoVendasQuantMinPedidoVenda != other.utilizacaoVendasQuantMinPedidoVenda) {
			return false;
		}
		if (utilizacaoVendasTabelaPrecos != other.utilizacaoVendasTabelaPrecos) {
			return false;
		}
		return true;
	}

}