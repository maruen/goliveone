package br.com.golive.entity.financeiro.formaspagamento;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "FormasPagamento",
		nomeDoArquivoGerado = "FormasPagamento",
		nomeArquivoJasper = "FormasPagamento")
public class FormasPagamentoModel {
	private Long id;
	private Date dataInclusao;
	private Date dataAlteracao;
	private String formaPagamento;
	
	public FormasPagamentoModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}

	public FormasPagamentoModel(Long id, 
								Date dataInclusao, 
								Date dataAlteracao,
								String formaPagamento) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.formaPagamento = formaPagamento;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDataInclusao() {
		return dataInclusao;
	}

	public void setDataInclusao(Date dataInclusao) {
		this.dataInclusao = dataInclusao;
	}

	public Date getDataAlteracao() {
		return dataAlteracao;
	}

	public void setDataAlteracao(Date dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
	}

	public String getFormaPagamento() {
		return formaPagamento;
	}

	public void setFormaPagamento(String formaPagamento) {
		this.formaPagamento = formaPagamento;
	}
}
