import 'package:xml/xml.dart';

class ResValidateInvoicePm {
  final String transactionTypeCode;
  final String replacementFlag;
  final String invoiceNumber;
  final String invoiceDate;
  final String sellerNpwp;
  final String sellerName;
  final String sellerAddress;
  final String buyerNpwp;
  final String buyerName;
  final String buyerAddress;
  final int totalDpp;
  final int totalPpn;
  final int totalPpnBm;
  final String approvalStatus;
  final String invoiceStatus;
  final String reference;
  final List<TransactionDetail> transactionDetails;

  ResValidateInvoicePm({
    required this.transactionTypeCode,
    required this.replacementFlag,
    required this.invoiceNumber,
    required this.invoiceDate,
    required this.sellerNpwp,
    required this.sellerName,
    required this.sellerAddress,
    required this.buyerNpwp,
    required this.buyerName,
    required this.buyerAddress,
    required this.totalDpp,
    required this.totalPpn,
    required this.totalPpnBm,
    required this.approvalStatus,
    required this.invoiceStatus,
    required this.reference,
    required this.transactionDetails,
  });

  factory ResValidateInvoicePm.fromXml(XmlElement xml) {
    return ResValidateInvoicePm(
      transactionTypeCode: xml.getElement('kdJenisTransaksi')?.innerText ?? '',
      replacementFlag: xml.getElement('fgPengganti')?.innerText ?? '',
      invoiceNumber: xml.getElement('nomorFaktur')?.innerText ?? '',
      invoiceDate: xml.getElement('tanggalFaktur')?.innerText ?? '',
      sellerNpwp: xml.getElement('npwpPenjual')?.innerText ?? '',
      sellerName: xml.getElement('namaPenjual')?.innerText ?? '',
      sellerAddress: xml.getElement('alamatPenjual')?.innerText ?? '',
      buyerNpwp: xml.getElement('npwpLawanTransaksi')?.innerText ?? '',
      buyerName: xml.getElement('namaLawanTransaksi')?.innerText ?? '',
      buyerAddress: xml.getElement('alamatLawanTransaksi')?.innerText ?? '',
      totalDpp: int.tryParse(xml.getElement('jumlahDpp')?.innerText ?? '0') ?? 0,
      totalPpn: int.tryParse(xml.getElement('jumlahPpn')?.innerText ?? '0') ?? 0,
      totalPpnBm: int.tryParse(xml.getElement('jumlahPpnBm')?.innerText ?? '0') ?? 0,
      approvalStatus: xml.getElement('statusApproval')?.innerText ?? '',
      invoiceStatus: xml.getElement('statusFaktur')?.innerText ?? '',
      reference: xml.getElement('referensi')?.innerText ?? '',
      transactionDetails: xml.findAllElements('detailTransaksi').map((detailXml) {
        return TransactionDetail.fromXml(detailXml);
      }).toList(),
    );
  }
}

class TransactionDetail {
  final String itemName;
  final int unitPrice;
  final int itemQuantity;
  final int totalPrice;
  final int discount;
  final int dpp;
  final int ppn;
  final int ppnbmRate;
  final int ppnbm;

  TransactionDetail({
    required this.itemName,
    required this.unitPrice,
    required this.itemQuantity,
    required this.totalPrice,
    required this.discount,
    required this.dpp,
    required this.ppn,
    required this.ppnbmRate,
    required this.ppnbm,
  });

  factory TransactionDetail.fromXml(XmlElement xml) {
    return TransactionDetail(
      itemName: xml.getElement('nama')?.innerText ?? '',
      unitPrice: int.tryParse(xml.getElement('hargaSatuan')?.innerText ?? '0') ?? 0,
      itemQuantity: int.tryParse(xml.getElement('jumlahBarang')?.innerText ?? '0') ?? 0,
      totalPrice: int.tryParse(xml.getElement('hargaTotal')?.innerText ?? '0') ?? 0,
      discount: int.tryParse(xml.getElement('diskon')?.innerText ?? '0') ?? 0,
      dpp: int.tryParse(xml.getElement('dpp')?.innerText ?? '0') ?? 0,
      ppn: int.tryParse(xml.getElement('ppn')?.innerText ?? '0') ?? 0,
      ppnbmRate: int.tryParse(xml.getElement('tarifPpnbm')?.innerText ?? '0') ?? 0,
      ppnbm: int.tryParse(xml.getElement('ppnbm')?.innerText ?? '0') ?? 0,
    );
  }
}
