package airtrip.airtrip.config;

import airtrip.airtrip.entity.Payment;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class PaymentExcelExporter {
    private XSSFWorkbook workbook;
    private XSSFSheet sheet;
    private List<Payment> listPayments;

    public PaymentExcelExporter(List<Payment> listPayments) {
        this.listPayments = listPayments;
        workbook = new XSSFWorkbook();
    }


    private void writeHeaderLine() {
        sheet = workbook.createSheet("Payments");

        Row row = sheet.createRow(0);

        CellStyle style = workbook.createCellStyle();
        XSSFFont font = workbook.createFont();
        font.setBold(true);
        font.setFontHeight(16);
        style.setFont(font);

        createCell(row, 0, "Mã giao dịch", style);
        createCell(row, 1, "Tổng thanh toán ", style);
        createCell(row, 2, "Thuế giao dịch", style);
        createCell(row, 3, "Thời gian thực hiện", style);
        createCell(row, 4, "Nội dung thanh toán", style);
        createCell(row, 5, "Country Code", style);
        createCell(row, 6, "Postal Code", style);
        createCell(row, 7, "Trạng thái", style);
        createCell(row, 8, "Mã đặt phòng", style);

    }

    private void createCell(Row row, int columnCount, Object value, CellStyle style) {
        sheet.autoSizeColumn(columnCount);
        Cell cell = row.createCell(columnCount);
        if (value instanceof Integer) {
            cell.setCellValue((Integer) value);
        } else if (value instanceof Boolean) {
            cell.setCellValue((Boolean) value);
        }else if (value instanceof Float) {
            cell.setCellValue((Float) value);
        }else if (value instanceof Long) {
            cell.setCellValue((Long) value);
        }else {
            cell.setCellValue((String) value);
        }
        cell.setCellStyle(style);
    }

    private void writeDataLines() {
        int rowCount = 1;

        CellStyle style = workbook.createCellStyle();
        XSSFFont font = workbook.createFont();
        font.setFontHeight(14);
        style.setFont(font);

        for (Payment pay : listPayments) {
            Row row = sheet.createRow(rowCount++);
            int columnCount = 0;

            createCell(row, columnCount++, pay.getPaymentId(), style);
            createCell(row, columnCount++, pay.getTotalPrice(), style);
            createCell(row, columnCount++, pay.getTransactionFee(), style);
            createCell(row, columnCount++, pay.getCreateTime().toString(), style);
            createCell(row, columnCount++, pay.getDescription(), style);
            createCell(row, columnCount++, pay.getCountryCode(), style);
            createCell(row, columnCount++, pay.getPostalCode().toString(), style);
            createCell(row, columnCount++, pay.getStatus(), style);
            createCell(row, columnCount++, pay.getBookRoom().getBookId(), style);

        }
    }

    public void export(HttpServletResponse response) throws IOException {
        writeHeaderLine();
        writeDataLines();

        ServletOutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();

        outputStream.close();

    }
}
