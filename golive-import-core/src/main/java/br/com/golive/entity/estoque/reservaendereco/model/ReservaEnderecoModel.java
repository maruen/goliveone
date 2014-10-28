package br.com.golive.entity.estoque.reservaendereco.model;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "ReservaEndereco", 
		nomeDoArquivoGerado = "ReservaEndereco", 
		nomeArquivoJasper = "ReservaEndereco")
public class ReservaEnderecoModel extends Model {

	private static final long serialVersionUID = 1L;

	private String codProduto;
	private String produto;
	private String idPrateleira;
	private String prateleira;
	private String idRua;
	private String rua;
	private String idPavimento;
	private String pavimento;
	private String idDepartamento;
	private String departamento;
	private String idGrupoProdutos;
	private String grupoProdutos;
	private String idSubGrupoProdutos;
	private String subGrupoProdutos;

	public ReservaEnderecoModel() {
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}

	public ReservaEnderecoModel(Long id,
								Calendar dataInclusao,
								Calendar dataAlteracao,
								String codProduto, 
								String produto,
								String idPrateleira, 
								String prateleira, 
								String idRua, 
								String rua,
								String idPavimento, 
								String pavimento, 
								String idDepartamento,
								String departamento, 
								String idGrupoProdutos, 
								String grupoProdutos,
								String idSubGrupoProdutos, 
								String subGrupoProdutos) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.codProduto = codProduto;
		this.produto = produto;
		this.idPrateleira = idPrateleira;
		this.prateleira = prateleira;
		this.idRua = idRua;
		this.rua = rua;
		this.idPavimento = idPavimento;
		this.pavimento = pavimento;
		this.idDepartamento = idDepartamento;
		this.departamento = departamento;
		this.idGrupoProdutos = idGrupoProdutos;
		this.grupoProdutos = grupoProdutos;
		this.idSubGrupoProdutos = idSubGrupoProdutos;
		this.subGrupoProdutos = subGrupoProdutos;
	}

	public String getCodProduto() {
		return codProduto;
	}

	public void setCodProduto(String codProduto) {
		this.codProduto = codProduto;
	}

	public String getProduto() {
		return produto;
	}

	public void setProduto(String produto) {
		this.produto = produto;
	}

	public String getIdPrateleira() {
		return idPrateleira;
	}

	public void setIdPrateleira(String idPrateleira) {
		this.idPrateleira = idPrateleira;
	}

	public String getPrateleira() {
		return prateleira;
	}

	public void setPrateleira(String prateleira) {
		this.prateleira = prateleira;
	}

	public String getIdRua() {
		return idRua;
	}

	public void setIdRua(String idRua) {
		this.idRua = idRua;
	}

	public String getRua() {
		return rua;
	}

	public void setRua(String rua) {
		this.rua = rua;
	}

	public String getIdPavimento() {
		return idPavimento;
	}

	public void setIdPavimento(String idPavimento) {
		this.idPavimento = idPavimento;
	}

	public String getPavimento() {
		return pavimento;
	}

	public void setPavimento(String pavimento) {
		this.pavimento = pavimento;
	}

	public String getIdDepartamento() {
		return idDepartamento;
	}

	public void setIdDepartamento(String idDepartamento) {
		this.idDepartamento = idDepartamento;
	}

	public String getDepartamento() {
		return departamento;
	}

	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}

	public String getIdGrupoProdutos() {
		return idGrupoProdutos;
	}

	public void setIdGrupoProdutos(String idGrupoProdutos) {
		this.idGrupoProdutos = idGrupoProdutos;
	}

	public String getGrupoProdutos() {
		return grupoProdutos;
	}

	public void setGrupoProdutos(String grupoProdutos) {
		this.grupoProdutos = grupoProdutos;
	}

	public String getIdSubGrupoProdutos() {
		return idSubGrupoProdutos;
	}

	public void setIdSubGrupoProdutos(String idSubGrupoProdutos) {
		this.idSubGrupoProdutos = idSubGrupoProdutos;
	}

	public String getSubGrupoProdutos() {
		return subGrupoProdutos;
	}

	public void setSubGrupoProdutos(String subGrupoProdutos) {
		this.subGrupoProdutos = subGrupoProdutos;
	}
}
