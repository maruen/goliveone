package br.com.golive.entity.financeiro.condicoespagamento.model;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "CondicoesPagamento",
		nomeDoArquivoGerado = "CondicoesPagamento",
		nomeArquivoJasper = "CondicoesPagamento")
public class CondicoesPagamentoModel extends Model{
	
	
	private static final long serialVersionUID = 1L;
	private String condicaoPagamento;
	
	public CondicoesPagamentoModel(){
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}
	
	public CondicoesPagamentoModel(Long id,
								   Calendar dataInclusao,
								   Calendar dataAlteracao,
								   String condicaoPagamento){
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.condicaoPagamento = condicaoPagamento;
	}
	
	public String getCondicaoPagamento() {
		return condicaoPagamento;
	}

	public void setCondicaoPagamento(String condicaoPagamento) {
		this.condicaoPagamento = condicaoPagamento;
	}
}
