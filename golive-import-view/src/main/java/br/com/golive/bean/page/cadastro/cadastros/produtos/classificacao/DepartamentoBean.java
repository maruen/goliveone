package br.com.golive.bean.page.cadastro.cadastros.produtos.classificacao;

import java.util.Calendar;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroBeanRules;
import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.service.DepartamentoService;
import br.com.golive.utils.Fluxo;
import br.com.golive.utils.GoliveOneProperties;

@ManagedBean
@ViewScoped
@Label(name = "label.cadastroDepartamento")
public class DepartamentoBean extends CadastroBeanRules<DepartamentoModel> {

	private static final long serialVersionUID = 8520424471796591515L;

	@Inject
	private Logger logger;

	@Inject
	@LabelSystemInjected
	private GoliveOneProperties labels;
	
	@EJB
	private DepartamentoService departamentoService;
	
	@Override
	@PostConstruct
	public void init() {
		logger.info("Inicializando = {}", this.getClass().getName());
		super.init(departamentoService.listarPorFiltro());
		fluxo = Fluxo.LISTAGEM;
	}
		
	@Override
	public void incluir() {
		super.incluir();
		this.registro = new DepartamentoModel();
		// registro.setNomeFormulario("label.cadastroDepartamento");
	}

	@Override
	public void excluir() {
		// registro.setUsuario(getUsuario());
		departamentoService.excluir(this.registro);
		super.excluir();
	}

	@Override
	public void salvar() {
		// registro.setUsuario(getUsuario());
		// registro.setNomeFormulario(this.getClass().getAnnotation(Label.class).name());
		
		if (registro.getId() != null) {
			registro.setDataAlteracao(Calendar.getInstance());
			departamentoService.alterar(registro);
		} else {
			registro.setDataInclusao(Calendar.getInstance());
			registro.setDataAlteracao(Calendar.getInstance());
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
		return departamentoService.getAuditoriaLogs();  
	}
	
	
}
