package br.com.golive.bean.page.cadastro.cadastros.classificacaoEmpresas;

import java.util.ArrayList;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBean;
import br.com.golive.entity.areaDeAtuacao.model.AreaDeAtuacaoModel;
import br.com.golive.entity.perfilconfiguracao.model.ColunaPerfil;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.NumberFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;
import br.com.golive.service.AreaDeAtuacaoService;

@Label(name = "label.cadastroDeAreaDeAtuacao")
@ManagedBean
@ViewScoped
public class AreasDeAtuacaoBean extends CadastroGenericBean<AreaDeAtuacaoModel> {

	private static final long serialVersionUID = 6286581844381749904L;

	@Inject
	private Logger logger;

	@EJB
	private AreaDeAtuacaoService areaDeAtuacaoService;

	@Inject
	@FilterInjected
	@Filter(name = "Description", label = "label.areaDeAtuacao")
	private StringFilter filtroAtuacao;

	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id")
	protected NumberFilter filtroId;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao")
	private DateFilter filtroDataInclusao;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao")
	private DateFilter filtroDataAlteracao;

	@Override
	@PostConstruct
	public void init() {
		super.init(areaDeAtuacaoService.obterLista(), new ArrayList<ColunaPerfil>());
		logger.info("Inicializando = {}", this.getClass().getName());
	}

	@Override
	public void incluir() {
		super.incluir();
		registro = new AreaDeAtuacaoModel();
	}

	@Override
	public void salvar() {
		final boolean insert = false;
		if (registro != null) {
			if ((registro.getAreaDeAtuacao() != null) && (!registro.getAreaDeAtuacao().isEmpty())) {
				// areaDeAtuacaoService.salvar(registro);
			}
		}
		super.init(areaDeAtuacaoService.obterLista(), new ArrayList<ColunaPerfil>());
		super.salvar();
	}

	@Override
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(final Logger logger) {
		this.logger = logger;
	}

	public StringFilter getFiltroAtuacao() {
		return filtroAtuacao;
	}

	public void setFiltroAtuacao(final StringFilter filtroAtuacao) {
		this.filtroAtuacao = filtroAtuacao;
	}

	public NumberFilter getFiltroId() {
		return filtroId;
	}

	public void setFiltroId(final NumberFilter filtroId) {
		this.filtroId = filtroId;
	}

	public DateFilter getFiltroDataInclusao() {
		return filtroDataInclusao;
	}

	public void setFiltroDataInclusao(final DateFilter filtroDataInclusao) {
		this.filtroDataInclusao = filtroDataInclusao;
	}

	public DateFilter getFiltroDataAlteracao() {
		return filtroDataAlteracao;
	}

	public void setFiltroDataAlteracao(final DateFilter filtroDataAlteracao) {
		this.filtroDataAlteracao = filtroDataAlteracao;
	}
}
