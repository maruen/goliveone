package br.com.golive.entity.financeiro.formaspagamento.model;

import java.util.Date;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "FormasPagamento",
		nomeDoArquivoGerado = "FormasPagamento",
		nomeArquivoJasper = "FormasPagamento")

public class FormasPagamentoModel extends Model {
	
	private static final long serialVersionUID = 1L;
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
