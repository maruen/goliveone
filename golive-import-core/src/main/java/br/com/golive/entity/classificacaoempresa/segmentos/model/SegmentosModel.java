package br.com.golive.entity.classificacaoempresa.segmentos.model;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "Segmentos", 
		nomeDoArquivoGerado = "Segmentos", 
		nomeArquivoJasper = "Segmentos")
public class SegmentosModel extends Model {

	private static final long serialVersionUID = 1L;

	private String segmentos;

	public SegmentosModel() {
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}

	public SegmentosModel(Long id, 
						  Calendar dataInclusao,
						  Calendar dataAlteracao, 
						  String segmentos) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.segmentos = segmentos;
	}

	public String getSegmentos() {
		return segmentos;
	}

	public void setSegmentos(String segmentos) {
		this.segmentos = segmentos;
	}
}
