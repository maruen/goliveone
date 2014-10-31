package br.com.golive.bean.page.cadastro.cadastros.produtos.classificacao;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Data;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBean;
import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.exception.GolivePersistenceException;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.NumberFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;
import br.com.golive.service.DepartamentoService;
import br.com.golive.utils.JSFUtils;

@Data
@ManagedBean
@ViewScoped
@Label(name = "label.cadastroDepartamento")
public class DepartamentoBean extends CadastroGenericBean<DepartamentoModel> {

	private static final long serialVersionUID = 8520424471796591515L;

	@Inject
	private Logger logger;

	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id")
	private NumberFilter filtroIdDepartamento;

	@Inject
	@FilterInjected
	@Filter(name = "DepartamentoProduto", label = "label.departamentos")
	private StringFilter filtroDepartamento;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao")
	private DateFilter filtroDataInclusaoDepartamento;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao")
	private DateFilter filtroDataAletracaoDepartamento;

	@EJB
	private DepartamentoService departamentoService;

	@Override
	@PostConstruct
	public void init() {
		super.init(departamentoService.listarPorFiltro(), getConfiguracaoesByClasses(DepartamentoModel.class));
	}

	@Override
	public void incluir() {
		super.incluir();
		registro = new DepartamentoModel();
	}

	public void confirmarExclusao() {
		try {
			departamentoService.excluir(registro);
			JSFUtils.infoMessage(getLabels().getField("title.msg.inserido.sucesso"), getLabels().getField("msg.registro.excluido"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		super.init(departamentoService.listarPorFiltro(), getConfiguracaoesByClasses(DepartamentoModel.class));
	}

	@Override
	public void salvar() {
		if (registro.hasId()) {
			departamentoService.alterar(registro);
		} else {
			departamentoService.salvar(registro);
		}

		conteudo = departamentoService.listarPorFiltro();
		super.salvar();
	}

	@Override
	protected Logger getLogger() {
		return logger;
	}

	public List<AuditoriaModel> getAuditoriaLogs() {
		return departamentoService.getAuditoriaLogs(registro);
	}

	@Override
	public String getUsuarioLog() {
		return departamentoService.getUsuarioLog(registro);
	}

	@Override
	public void editarRegistro() {
		super.editarRegistro();
	}

}