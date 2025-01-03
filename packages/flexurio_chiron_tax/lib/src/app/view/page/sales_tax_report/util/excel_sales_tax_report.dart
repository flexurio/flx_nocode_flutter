import 'package:flexurio_chiron_tax/flexurio_chiron_tax.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

final header1 = [
  'FK',
  'KD_JENIS_TRANSAKSI',
  'FG_PENGGANTI',
  'NOMOR_FAKTUR',
  'MASA_PAJAK',
  'TAHUN_PAJAK',
  'TANGGAL_FAKTUR',
  'NPWP',
  'NAMA',
  'ALAMAT_LENGKAP',
  'JUMLAH_DPP',
  'JUMLAH_PPN',
  'JUMLAH_PPNBM',
  'ID_KETERANGAN_TAMBAHAN',
  'FG_UANG_MUKA',
  'UANG_MUKA_DPP',
  'UANG_MUKA_PPN',
  'UANG_MUKA_PPNBM',
  'REFERENSI',
  'KODE_DOKUMEN_PENDUKUNG',
];
final header2 = [
  'LT',
  'NPWP',
  'NAMA',
  'JALAN',
  'BLOK',
  'NOMOR',
  'RT',
  'RW',
  'KECAMATAN',
  'KELURAHAN',
  'KABUPATEN',
  'PROPINSI',
  'KODE_POS',
  'NOMOR_TELEPON',
];
final header3 = [
  'OF',
  'KODE_OBJEK',
  'NAMA',
  'HARGA_SATUAN',
  'JUMLAH_BARANG',
  'HARGA_TOTAL',
  'DISKON',
  'DPP',
  'PPN',
  'TARIF_PPNBM',
  'PPNBM',
];
final header4 = [
  'FK',
  '01',
  '0',
];

List<int> excelSalesTaxReport(List<SalesTaxReport> data) {
  final workbook = Workbook();
  final sheet = workbook.worksheets[0];
  var row = 1;

  final groupByInvoice = groupBy(data, (element) => element.taxInvoiceNumber);

  for (final key in groupByInvoice.keys) {
    for (var i = 0; i < header1.length; i++) {
      sheet.getRangeByIndex(row, i + 1)
        ..setValue(header1[i])
        ..cellStyle.backColorRgb = Colors.yellowAccent;
    }
    row++;

    for (var i = 0; i < header2.length; i++) {
      sheet.getRangeByIndex(row, i + 1)
        ..setValue(header2[i])
        ..cellStyle.backColorRgb = Colors.yellowAccent;
    }
    for (var i = 0; i < header1.length - header2.length; i++) {
      sheet
          .getRangeByIndex(row, header2.length + 1 + i)
          .cellStyle
          .backColorRgb = Colors.yellowAccent;
    }
    row++;

    for (var i = 0; i < header3.length; i++) {
      sheet.getRangeByIndex(row, i + 1)
        ..setValue(header3[i])
        ..cellStyle.backColorRgb = Colors.yellowAccent;
    }
    for (var i = 0; i < header1.length - header3.length; i++) {
      sheet
          .getRangeByIndex(row, header3.length + 1 + i)
          .cellStyle
          .backColorRgb = Colors.yellowAccent;
    }
    row++;

    for (var i = 0; i < header4.length; i++) {
      sheet.getRangeByIndex(row, i + 1)
        ..setValue(header4[i])
        ..cellStyle.backColorRgb = Colors.yellowAccent;
    }

    final invoices = groupByInvoice[key]!;

    sheet.getRangeByIndex(row, 4)
      ..setValue(invoices.first.taxInvoiceNumber)
      ..cellStyle.backColorRgb = Colors.pinkAccent.shade100;
    sheet.getRangeByIndex(row, 5)
      ..setValue(invoices.first.period.substring(4, 6))
      ..cellStyle.backColorRgb = Colors.pinkAccent.shade100;
    sheet.getRangeByIndex(row, 6)
      ..setValue(invoices.first.period.substring(0, 4))
      ..cellStyle.backColorRgb = Colors.pinkAccent.shade100;
    sheet.getRangeByIndex(row, 7)
      ..setValue(invoices.first.transactionDate.ddMMyyyySlash)
      ..cellStyle.backColorRgb = Colors.pinkAccent.shade100;
    sheet.getRangeByIndex(row, 8)
      ..setValue(invoices.first.customerNpwpNumber)
      ..cellStyle.backColorRgb = Colors.pinkAccent.shade100;
    sheet.getRangeByIndex(row, 9)
      ..setValue(invoices.first.customerName)
      ..cellStyle.backColorRgb = Colors.pinkAccent.shade100;
    sheet.getRangeByIndex(row, 10)
      ..setValue(invoices.first.customerAddress)
      ..cellStyle.backColorRgb = Colors.pinkAccent.shade100;
    sheet.getRangeByIndex(row, 11)
      ..setValue(invoices.first.subTotalAfterAdditionalDiscount)
      ..cellStyle.backColorRgb = Colors.pinkAccent.shade100;
    sheet.getRangeByIndex(row, 12)
      ..setValue(invoices.first.ppnValue)
      ..cellStyle.backColorRgb = Colors.pinkAccent.shade100;
    sheet.getRangeByIndex(row, 13)
      ..setValue('0')
      ..cellStyle.backColorRgb = Colors.yellowAccent;
    sheet.getRangeByIndex(row, 14).cellStyle.backColorRgb = Colors.lightBlue;
    sheet.getRangeByIndex(row, 15)
      ..setValue('0')
      ..cellStyle.backColorRgb = Colors.yellowAccent;
    sheet.getRangeByIndex(row, 16)
      ..setValue('0')
      ..cellStyle.backColorRgb = Colors.yellowAccent;
    sheet.getRangeByIndex(row, 17)
      ..setValue('0')
      ..cellStyle.backColorRgb = Colors.yellowAccent;
    sheet.getRangeByIndex(row, 18)
      ..setValue('0')
      ..cellStyle.backColorRgb = Colors.yellowAccent;
    sheet.getRangeByIndex(row, 19)
      ..setValue(invoices.first.transactionNo)
      ..cellStyle.backColorRgb = Colors.pinkAccent.shade100;
    sheet.getRangeByIndex(row, 20).cellStyle.backColorRgb = Colors.lightBlue;
    row++;

    for (final invoice in invoices) {
      sheet.getRangeByIndex(row, 1)
        ..setValue('OF')
        ..cellStyle.backColorRgb = Colors.lightGreen;
      sheet.getRangeByIndex(row, 2)
        ..setValue(invoice.productID)
        ..cellStyle.backColorRgb = Colors.pinkAccent.shade100;
      sheet.getRangeByIndex(row, 3)
        ..setValue(invoice.productName)
        ..cellStyle.backColorRgb = Colors.pinkAccent.shade100;
      sheet.getRangeByIndex(row, 4)
        ..setValue(invoice.price)
        ..cellStyle.backColorRgb = Colors.pinkAccent.shade100;
      sheet.getRangeByIndex(row, 5)
        ..setValue(invoice.quantity)
        ..cellStyle.backColorRgb = Colors.pinkAccent.shade100;
      sheet.getRangeByIndex(row, 6)
        ..setValue(invoice.subTotal)
        ..cellStyle.backColorRgb = Colors.pinkAccent.shade100;
      sheet.getRangeByIndex(row, 7)
        ..setValue(invoice.valueDiscount)
        ..cellStyle.backColorRgb = Colors.pinkAccent.shade100;
      sheet.getRangeByIndex(row, 8)
        ..setValue(invoice.subTotalAfterAdditionalDiscount)
        ..cellStyle.backColorRgb = Colors.pinkAccent.shade100;
      sheet.getRangeByIndex(row, 9)
        ..setValue(invoice.grandTotal)
        ..cellStyle.backColorRgb = Colors.pinkAccent.shade100;
      sheet.getRangeByIndex(row, 10)
        ..setValue('0')
        ..cellStyle.backColorRgb = Colors.pinkAccent.shade100;
      sheet.getRangeByIndex(row, 11)
        ..setValue('0')
        ..cellStyle.backColorRgb = Colors.pinkAccent.shade100;
      row++;
    }
  }

  for (var i = 0; i < header1.length; i++) {
    sheet.autoFitColumn(i + 1);
  }

  //

  // sheet
  //     .getRangeByIndex(1, 1, 1, vendorHeaders.length)
  //     .setBuiltInStyle(BuiltInStyles.heading1);

  // for (var i = 0; i < vendorHeaders.length; i++) {
  //   sheet.getRangeByIndex(1, i + 1).setValue(vendorHeaders[i]);
  // }

  // for (var i = 0; i < vendorHeaders.length; i++) {
  //   sheet
  //     ..autoFitColumn(1 + i)
  //     ..autoFitRow(1);
  // }

  // for (var i = 0; i < data.length; i++) {
  //   final vendor = data[i];
  //   sheet.getRangeByIndex(i + 2, 1).setValue(vendor.id);
  //   sheet.getRangeByIndex(i + 2, 2).setValue(vendor.name);
  //   sheet.getRangeByIndex(i + 2, 3).setValue(vendor.address);
  //   sheet.getRangeByIndex(i + 2, 4).setValue(vendor.city);
  //   sheet.getRangeByIndex(i + 2, 5).setValue(vendor.country);
  //   sheet.getRangeByIndex(i + 2, 6).setValue(vendor.postalCode);
  //   sheet.getRangeByIndex(i + 2, 7).setValue(vendor.phone);
  //   sheet.getRangeByIndex(i + 2, 8).setValue(vendor.fax);
  //   sheet.getRangeByIndex(i + 2, 9).setValue(vendor.pic);
  //   sheet.getRangeByIndex(i + 2, 10).setValue(vendor.email);
  //   sheet.getRangeByIndex(i + 2, 11).setValue(vendor.npwp);
  // }

  // for (var i = 0; i < vendorHeaders.length; i++) {
  //   sheet
  //     ..autoFitColumn(1 + i)
  //     ..autoFitRow(1);
  // }

  final bytes = workbook.saveSync();

  return bytes;
}
