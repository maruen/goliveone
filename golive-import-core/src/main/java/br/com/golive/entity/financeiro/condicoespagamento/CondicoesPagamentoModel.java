package br.com.golive.entity.financeiro.condicoespagamento;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "CondicoesPagamento",
		nomeDoArquivoGerado = "CondicoesPagamento",
		nomeArquivoJasper = "CondicoesPagamento")
public class CondicoesPagamentoModel {
	private Long id;
	private Date dataInclusao;
	private Date dataAlteracao;
	private String condicaoPagamento;
	
	public CondicoesPagamentoModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}
	
	public CondicoesPagamentoModel(Long id,
								   Date dataInclusao,
								   Date dataAlteracao,
								   String condicaoPagamento){
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.condicaoPagamento = condicaoPagamento;
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

	public String getCondicaoPagamento() {
		return condicaoPagamento;
	}

	public void setCondicaoPagamento(String condicaoPagamento) {
		this.condicaoPagamento = condicaoPagamento;
	}
}
