package br.com.golive.entity.financeiro.formapagamento.model;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "FormasPagamento",
		nomeDoArquivoGerado = "FormasPagamento",
		nomeArquivoJasper = "FormasPagamento")

public class FormaPagamentoModel extends Model {
	
	private static final long serialVersionUID = 1L;
	private String formaPagamento;
	
	public FormaPagamentoModel(){
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}

	public FormaPagamentoModel(Long id, 
								Calendar dataInclusao, 
								Calendar dataAlteracao,
								String formaPagamento) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.formaPagamento = formaPagamento;
	}

	
	public void setDataAlteracao(Calendar dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
	}

	public String getFormaPagamento() {
		return formaPagamento;
	}

	public void setFormaPagamento(String formaPagamento) {
		this.formaPagamento = formaPagamento;
	}
}
