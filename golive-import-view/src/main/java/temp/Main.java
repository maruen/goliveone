package temp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRXlsExporter;




public class Main {

	public static void main(String[] args) {
		String sourceFileName = "/home/desenv/AmbienteDesenvolvimento/Workspace/golive-import/golive-import-view/src/main/resources/br/com/golive/jasper/areaDeAtuacao.jasper";
        String printFileName = null;
        ArrayList dataList = new ArrayList<String>();
        JRBeanCollectionDataSource beanColDataSource = new JRBeanCollectionDataSource(dataList);

        Map parameters = new HashMap();
        try {
           printFileName = JasperFillManager.fillReportToFile(sourceFileName, parameters, beanColDataSource);
           if (printFileName != null) {
              /**
               * 1- export to PDF
               */
              JasperExportManager.exportReportToPdfFile(printFileName,
                    "/home/desenv/sample_report.pdf");

              JRXlsExporter exporter = new JRXlsExporter();

              exporter.setParameter(JRExporterParameter.INPUT_FILE_NAME,
                    printFileName);
              exporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME,
                    "/home/desenv/sample_report.xls");

              exporter.exportReport();
           }
		} catch (JRException e) {
           e.printStackTrace();
        }
	}
}
