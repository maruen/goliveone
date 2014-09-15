package temp;

import java.io.Serializable;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;

import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.BarChartModel;
import org.primefaces.model.chart.CategoryAxis;
import org.primefaces.model.chart.ChartSeries;
import org.primefaces.model.chart.HorizontalBarChartModel;
import org.primefaces.model.chart.LineChartModel;

@ManagedBean
public class ChartView implements Serializable {

	private static final long serialVersionUID = 3804688209049687646L;

	private LineChartModel lineModel2;

	private BarChartModel barModel;
	private HorizontalBarChartModel horizontalBarModel;

	@PostConstruct
	public void init() {
		createLineModels();
		createBarModels();

	}

	public BarChartModel getBarModel() {
		return barModel;
	}

	public HorizontalBarChartModel getHorizontalBarModel() {
		return horizontalBarModel;
	}

	private BarChartModel initBarModel() {
		final BarChartModel model = new BarChartModel();

		final ChartSeries boys = new ChartSeries();
		boys.setLabel("Boys");
		boys.set("2004", 120);
		boys.set("2005", 100);
		boys.set("2006", 44);
		boys.set("2007", 150);
		boys.set("2008", 25);

		final ChartSeries girls = new ChartSeries();
		girls.setLabel("Girls");
		girls.set("2004", 52);
		girls.set("2005", 60);
		girls.set("2006", 110);
		girls.set("2007", 135);
		girls.set("2008", 120);

		model.addSeries(boys);
		model.addSeries(girls);

		return model;
	}

	private void createBarModels() {
		createBarModel();
		createHorizontalBarModel();
	}

	private void createBarModel() {
		barModel = initBarModel();

		barModel.setTitle("Bar Chart");
		barModel.setLegendPosition("ne");

		final Axis xAxis = barModel.getAxis(AxisType.X);
		xAxis.setLabel("Gender");

		final Axis yAxis = barModel.getAxis(AxisType.Y);
		yAxis.setLabel("Births");
		yAxis.setMin(0);
		yAxis.setMax(200);
	}

	private void createHorizontalBarModel() {
		horizontalBarModel = new HorizontalBarChartModel();

		final ChartSeries boys = new ChartSeries();
		boys.setLabel("Boys");
		boys.set("2004", 50);
		boys.set("2005", 96);
		boys.set("2006", 44);
		boys.set("2007", 55);
		boys.set("2008", 25);

		final ChartSeries girls = new ChartSeries();
		girls.setLabel("Girls");
		girls.set("2004", 52);
		girls.set("2005", 60);
		girls.set("2006", 82);
		girls.set("2007", 35);
		girls.set("2008", 120);

		horizontalBarModel.addSeries(boys);
		horizontalBarModel.addSeries(girls);

		horizontalBarModel.setTitle("Horizontal and Stacked");
		horizontalBarModel.setLegendPosition("e");
		horizontalBarModel.setStacked(true);

		final Axis xAxis = horizontalBarModel.getAxis(AxisType.X);
		xAxis.setLabel("Births");
		xAxis.setMin(0);
		xAxis.setMax(200);

		final Axis yAxis = horizontalBarModel.getAxis(AxisType.Y);
		yAxis.setLabel("Gender");
	}

	public LineChartModel getLineModel2() {
		return lineModel2;
	}

	private void createLineModels() {

		lineModel2 = initCategoryModel();
		lineModel2.setTitle("Category Chart");
		lineModel2.setLegendPosition("e");
		lineModel2.setShowPointLabels(true);
		lineModel2.getAxes().put(AxisType.X, new CategoryAxis("Years"));
		final Axis yAxis = lineModel2.getAxis(AxisType.Y);
		yAxis.setLabel("Births");
		yAxis.setMin(0);
		yAxis.setMax(200);
	}

	private LineChartModel initCategoryModel() {
		final LineChartModel model = new LineChartModel();

		final ChartSeries boys = new ChartSeries();
		boys.setLabel("Boys");
		boys.set("2004", 120);
		boys.set("2005", 100);
		boys.set("2006", 44);
		boys.set("2007", 150);
		boys.set("2008", 25);

		final ChartSeries girls = new ChartSeries();
		girls.setLabel("Girls");
		girls.set("2004", 52);
		girls.set("2005", 60);
		girls.set("2006", 110);
		girls.set("2007", 90);
		girls.set("2008", 120);

		model.addSeries(boys);
		model.addSeries(girls);

		return model;
	}

}