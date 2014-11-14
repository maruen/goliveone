package br.com.golive.entity.tipoproduto.model;

import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import br.com.golive.annotation.Jasper;
import br.com.golive.annotation.Label;
import br.com.golive.entity.Model;

@Entity
@Table(name = "tbTipoProduto")
@Label(name = "label.cadastroTipoProduto")
@Jasper(titulo = "label.tipoDeProduto", nomeDoArquivoGerado = "file.name.tipoproduto", nomeArquivoJasper = "TipoProduto")

public class TipoProdutoModel extends Model {

	@Transient
	private static final long serialVersionUID = 8449144453049328042L;
	
	@Column(name = "TipoProduto")
	@Label(name = "label.tipoDeProduto")
	private String tipoProduto;

	public TipoProdutoModel() {
		super();
	}

	public TipoProdutoModel(Long id, Calendar dataInclusao,
			Calendar dataAlteracao) {
		super(id, dataInclusao, dataAlteracao);
	}

	public TipoProdutoModel(String tipoProduto) {
		super();
		this.tipoProduto = tipoProduto;
	}

	public String getTipoProduto() {
		return tipoProduto;
	}

	public void setTipoProduto(String tipoProduto) {
		this.tipoProduto = tipoProduto;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result
				+ ((tipoProduto == null) ? 0 : tipoProduto.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		TipoProdutoModel other = (TipoProdutoModel) obj;
		if (tipoProduto == null) {
			if (other.tipoProduto != null)
				return false;
		} else if (!tipoProduto.equals(other.tipoProduto))
			return false;
		return true;
	}
}