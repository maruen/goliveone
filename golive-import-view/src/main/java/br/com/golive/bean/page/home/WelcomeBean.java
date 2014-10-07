package br.com.golive.bean.page.home;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import br.com.golive.bean.page.manager.GenericBean;
import br.com.golive.navigation.component.WelcomeMenuItem;
import br.com.golive.utils.ColorMenuPipe;

@ManagedBean
@ViewScoped
public class WelcomeBean extends GenericBean {

	private static final long serialVersionUID = -1838883991924028375L;

	private List<WelcomeMenuItem> menu;

	private Long indexColor;

	@PostConstruct
	public void init() {
		indexColorReset();
		menu = new ArrayList<WelcomeMenuItem>();
		menu.add(new WelcomeMenuItem(0L, true, "label.cadastro", "link.cadastro", "cadastroLink"));
		menu.add(new WelcomeMenuItem(1L, false, "label.compras", "link.compras", "comprasLink"));
		menu.add(new WelcomeMenuItem(2L, false, "label.vendas", "link.vendas", "faturamento"));
		menu.add(new WelcomeMenuItem(3L, false, "label.faturamento", "link.faturamento", "faturamentoLink"));
		menu.add(new WelcomeMenuItem(4L, false, "label.financeiro", "link.financeiro", "financeiroLink"));
		menu.add(new WelcomeMenuItem(5L, false, "label.estoque", "link.estoque", "estoqueLink"));
		menu.add(new WelcomeMenuItem(6L, false, "label.expedicao", "link.expedicao", "expedicaoLink"));
		menu.add(new WelcomeMenuItem(7L, false, "label.fiscal", "link.fiscal", "fiscalLink"));
		menu.add(new WelcomeMenuItem(8L, false, "label.parametrizacao.sistema", "link.parametrizacao.sistema", "parametrizacaoSistemaLink"));
	}


	public String getHexaColorPipe() {
		if (indexColor.equals(5L)) {
			indexColorReset();
		}
		for (final ColorMenuPipe color : ColorMenuPipe.values()) {
			if (color.getId().equals(indexColor)) {
				indexColor++;
				return color.getHexa();
			}
		}
		return "#FFFFFF";
	}

	public void indexColorReset() {
		indexColor = 0L;
	}

	public List<WelcomeMenuItem> getMenu() {
		return menu;
	}

	public void setMenu(final List<WelcomeMenuItem> menu) {
		this.menu = menu;
	}

}
