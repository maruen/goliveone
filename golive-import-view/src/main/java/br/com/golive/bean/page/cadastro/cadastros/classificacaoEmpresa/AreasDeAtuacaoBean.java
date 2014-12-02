package br.com.golive.bean.page.cadastro.cadastros.classificacaoEmpresa;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroBeanRules;
import br.com.golive.entity.areaDeAtuacao.model.AreaDeAtuacaoModel;

@Label(name = "label.cadastroDeAreaDeAtuacao")
@ManagedBean
@ViewScoped
public class AreasDeAtuacaoBean extends CadastroBeanRules<AreaDeAtuacaoModel> {

	@Override
	public void init() {
		// TODO Auto-generated method stub

	}

	@Override
	protected Logger getLogger() {
		// TODO Auto-generated method stub
		return null;
	}

}
