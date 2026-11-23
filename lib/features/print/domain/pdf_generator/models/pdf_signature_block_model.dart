import 'package:pdf/pdf.dart';
import '../utils/pdf_unit_utils.dart';

/// Field-name mapping for `type: "signature_block"`.
///
/// Ships with Flexurio standard defaults while allowing any project to remap
/// API keys without modifying Flutter code.
class PdfSignatureFieldsModel {
  final String meaning;
  final String name;
  final String idNumber;
  final String role;
  final String timestamp;
  final String image;
  final String qr;

  const PdfSignatureFieldsModel({
    this.meaning = 'meaning',
    this.name = 'signer_name',
    this.idNumber = 'signer_nip',
    this.role = 'signer_role',
    this.timestamp = 'signed_at',
    this.image = 'signature_image_url',
    this.qr = 'verification_url',
  });

  factory PdfSignatureFieldsModel.fromJson(dynamic json) {
    if (json is! Map) return const PdfSignatureFieldsModel();
    return PdfSignatureFieldsModel(
      meaning: json['meaning']?.toString() ?? 'meaning',
      name: json['name']?.toString() ?? 'signer_name',
      idNumber: json['id_number']?.toString() ?? 'signer_nip',
      role: json['role']?.toString() ?? 'signer_role',
      timestamp: json['timestamp']?.toString() ?? 'signed_at',
      image: json['image']?.toString() ?? 'signature_image_url',
      qr: json['qr']?.toString() ?? 'verification_url',
    );
  }
}

/// Customizable static labels for `type: "signature_block"`.
class PdfSignatureLabelsModel {
  final String idPrefix;
  final String electronicNote;
  final String pendingNote;

  const PdfSignatureLabelsModel({
    this.idPrefix = 'NIP: ',
    this.electronicNote = 'Ditandatangani secara elektronik',
    this.pendingNote = 'Menunggu persetujuan',
  });

  factory PdfSignatureLabelsModel.fromJson(dynamic json) {
    if (json is! Map) return const PdfSignatureLabelsModel();
    return PdfSignatureLabelsModel(
      idPrefix: json.containsKey('id_prefix')
          ? (json['id_prefix']?.toString() ?? '')
          : 'NIP: ',
      electronicNote: json.containsKey('electronic_note')
          ? (json['electronic_note']?.toString() ?? '')
          : 'Ditandatangani secara elektronik',
      pendingNote: json.containsKey('pending_note')
          ? (json['pending_note']?.toString() ?? '')
          : 'Menunggu persetujuan',
    );
  }
}

/// Predefined signature slot (useful for DRAF documents that must still display
/// unsigned approval boxes).
class PdfSignatureSlotModel {
  final String key;
  final String meaning;

  const PdfSignatureSlotModel({
    required this.key,
    required this.meaning,
  });

  static PdfSignatureSlotModel? fromJson(dynamic json) {
    if (json is! Map) return null;
    final key = json['key']?.toString() ?? '';
    final meaning = json['meaning']?.toString() ?? key;
    if (key.isEmpty && meaning.isEmpty) return null;
    return PdfSignatureSlotModel(key: key, meaning: meaning);
  }
}

/// Visual styling options for `type: "signature_block"`.
class PdfSignatureStyleModel {
  final PdfColor borderColor;
  final double borderWidth;
  final double paddingPt;
  final double spaceHeightPt;
  final double qrSizePt;
  final double imageHeightPt;

  const PdfSignatureStyleModel({
    this.borderColor = PdfColors.grey400,
    this.borderWidth = 0.5,
    this.paddingPt = 8.0,
    this.spaceHeightPt = 24.0,
    this.qrSizePt = 34.0,
    this.imageHeightPt = 36.0,
  });

  factory PdfSignatureStyleModel.fromJson(dynamic json, String defaultUnit) {
    if (json is! Map) {
      return PdfSignatureStyleModel(
        paddingPt: PdfUnitUtils.convertToPt(3, defaultUnit == 'pt' ? 'mm' : defaultUnit),
        spaceHeightPt: PdfUnitUtils.convertToPt(12, defaultUnit == 'pt' ? 'mm' : defaultUnit),
        qrSizePt: PdfUnitUtils.convertToPt(12, defaultUnit == 'pt' ? 'mm' : defaultUnit),
        imageHeightPt: PdfUnitUtils.convertToPt(14, defaultUnit == 'pt' ? 'mm' : defaultUnit),
      );
    }

    PdfColor borderColor = PdfColors.grey400;
    final borderHex = json['border_color']?.toString();
    if (borderHex != null && borderHex.trim().isNotEmpty) {
      try {
        borderColor = PdfColor.fromHex(borderHex.trim());
      } catch (_) {}
    }

    final borderWidth = json['border_width'] is num
        ? (json['border_width'] as num).toDouble()
        : 0.5;
    final paddingPt = json['padding'] != null
        ? PdfUnitUtils.convertToPt(json['padding'], defaultUnit)
        : PdfUnitUtils.convertToPt(3, defaultUnit == 'pt' ? 'mm' : defaultUnit);
    final spaceHeightPt = json['space_height'] != null
        ? PdfUnitUtils.convertToPt(json['space_height'], defaultUnit)
        : PdfUnitUtils.convertToPt(12, defaultUnit == 'pt' ? 'mm' : defaultUnit);
    final qrSizePt = json['qr_size'] != null
        ? PdfUnitUtils.convertToPt(json['qr_size'], defaultUnit)
        : PdfUnitUtils.convertToPt(12, defaultUnit == 'pt' ? 'mm' : defaultUnit);
    final imageHeightPt = json['image_height'] != null
        ? PdfUnitUtils.convertToPt(json['image_height'], defaultUnit)
        : PdfUnitUtils.convertToPt(14, defaultUnit == 'pt' ? 'mm' : defaultUnit);

    return PdfSignatureStyleModel(
      borderColor: borderColor,
      borderWidth: borderWidth,
      paddingPt: paddingPt,
      spaceHeightPt: spaceHeightPt,
      qrSizePt: qrSizePt,
      imageHeightPt: imageHeightPt,
    );
  }
}

/// Parsed configuration for `type: "signature_block"`.
class PdfSignatureBlockModel {
  final List<Map<String, dynamic>> data;
  final int columns;
  final double rowGapPt;
  final double columnGapPt;
  final bool keepTogether;
  final String? emptyText;
  final String? dateFormat;
  final PdfSignatureFieldsModel fields;
  final PdfSignatureLabelsModel labels;
  final List<PdfSignatureSlotModel> slots;
  final String slotMatchField;
  final PdfSignatureStyleModel style;

  const PdfSignatureBlockModel({
    this.data = const [],
    this.columns = 3,
    this.rowGapPt = 8.0,
    this.columnGapPt = 8.0,
    this.keepTogether = true,
    this.emptyText,
    this.dateFormat,
    this.fields = const PdfSignatureFieldsModel(),
    this.labels = const PdfSignatureLabelsModel(),
    this.slots = const [],
    this.slotMatchField = 'meaning_code',
    this.style = const PdfSignatureStyleModel(),
  });

  factory PdfSignatureBlockModel.fromJson(
    Map<String, dynamic> json,
    String defaultUnit,
  ) {
    final rawData = json['data'];
    final dataList = <Map<String, dynamic>>[];
    if (rawData is List) {
      for (final item in rawData) {
        if (item is Map) {
          dataList.add(Map<String, dynamic>.from(item));
        }
      }
    }

    int columns = 3;
    final rawCols = json['columns'];
    if (rawCols is num && rawCols > 0) {
      columns = rawCols.toInt();
    } else if (rawCols is String) {
      final parsed = int.tryParse(rawCols);
      if (parsed != null && parsed > 0) columns = parsed;
    }

    final defaultGapUnit = defaultUnit == 'pt' ? 'mm' : defaultUnit;
    final baseGap = json['gap'] != null
        ? PdfUnitUtils.convertToPt(json['gap'], defaultUnit)
        : PdfUnitUtils.convertToPt(4, defaultGapUnit);
    final rowGapPt = json['row_gap'] != null
        ? PdfUnitUtils.convertToPt(json['row_gap'], defaultUnit)
        : baseGap;
    final columnGapPt = json['column_gap'] != null
        ? PdfUnitUtils.convertToPt(json['column_gap'], defaultUnit)
        : baseGap;

    final slots = <PdfSignatureSlotModel>[];
    if (json['slots'] is List) {
      for (final rawSlot in json['slots'] as List) {
        final parsed = PdfSignatureSlotModel.fromJson(rawSlot);
        if (parsed != null) slots.add(parsed);
      }
    }

    return PdfSignatureBlockModel(
      data: dataList,
      columns: columns,
      rowGapPt: rowGapPt,
      columnGapPt: columnGapPt,
      keepTogether: json['keep_together'] is bool
          ? json['keep_together'] as bool
          : true,
      emptyText: json['empty_text']?.toString(),
      dateFormat: json['date_format']?.toString(),
      fields: PdfSignatureFieldsModel.fromJson(json['fields']),
      labels: PdfSignatureLabelsModel.fromJson(json['labels']),
      slots: slots,
      slotMatchField: json['slot_match_field']?.toString() ?? 'meaning_code',
      style: PdfSignatureStyleModel.fromJson(json['style'], defaultUnit),
    );
  }
}
