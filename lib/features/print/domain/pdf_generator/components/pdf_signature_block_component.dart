import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../models/pdf_signature_block_model.dart';
import 'pdf_grid_component.dart';

/// Configurable signature block preset (`type: "signature_block"`).
///
/// Built on top of [PdfGridComponent.layoutCardRows] so grid layout and
/// pagination behavior stay 100% consistent with `type: "grid"`.
class PdfSignatureBlockComponent {
  /// Returns a list of widgets suitable for spreading into `pw.MultiPage.build`.
  static List<pw.Widget> buildWidgets(
    Map<String, dynamic> comp,
    String defaultUnit,
    Map<String, pw.ImageProvider> imageCache,
  ) {
    final model = PdfSignatureBlockModel.fromJson(comp, defaultUnit);

    if (model.slots.isEmpty && model.data.isEmpty) {
      return PdfGridComponent.buildEmptyState(model.emptyText);
    }

    final cards = <pw.Widget>[];

    if (model.slots.isNotEmpty) {
      for (final slot in model.slots) {
        final matched = _findMatchingRecord(model, slot);
        cards.add(
          _buildSignatureCard(
            model: model,
            record: matched,
            fallbackMeaning: slot.meaning,
            imageCache: imageCache,
          ),
        );
      }
    } else {
      for (final record in model.data) {
        cards.add(
          _buildSignatureCard(
            model: model,
            record: record,
            imageCache: imageCache,
          ),
        );
      }
    }

    return PdfGridComponent.layoutCardRows(
      cards,
      columns: model.columns,
      rowGapPt: model.rowGapPt,
      columnGapPt: model.columnGapPt,
      keepTogether: model.keepTogether,
    );
  }

  /// Single-widget wrapper for nested or Canvas usage.
  static pw.Widget build(
    Map<String, dynamic> comp,
    String defaultUnit,
    Map<String, pw.ImageProvider> imageCache,
  ) {
    final widgets = buildWidgets(comp, defaultUnit, imageCache);
    if (widgets.isEmpty) return pw.SizedBox();
    if (widgets.length == 1) return widgets.first;
    return pw.Column(
      mainAxisSize: pw.MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.stretch,
      children: widgets,
    );
  }

  static Map<String, dynamic>? _findMatchingRecord(
    PdfSignatureBlockModel model,
    PdfSignatureSlotModel slot,
  ) {
    final slotKeyLower = slot.key.trim().toLowerCase();
    final slotMeaningLower = slot.meaning.trim().toLowerCase();

    for (final record in model.data) {
      final matchVal = record[model.slotMatchField]?.toString().trim().toLowerCase();
      if (matchVal != null && matchVal.isNotEmpty && matchVal == slotKeyLower) {
        return record;
      }
      final meaningVal = record[model.fields.meaning]?.toString().trim().toLowerCase();
      if (meaningVal != null &&
          meaningVal.isNotEmpty &&
          (meaningVal == slotKeyLower || meaningVal == slotMeaningLower)) {
        return record;
      }
    }
    return null;
  }

  static pw.Widget _buildSignatureCard({
    required PdfSignatureBlockModel model,
    required Map<String, dynamic>? record,
    String? fallbackMeaning,
    required Map<String, pw.ImageProvider> imageCache,
  }) {
    final fields = model.fields;
    final style = model.style;
    final labels = model.labels;

    final meaning = _readField(record, fields.meaning) ?? fallbackMeaning ?? '';
    final name = _readField(record, fields.name);
    final idNumber = _readField(record, fields.idNumber);
    final role = _readField(record, fields.role);
    final rawTimestamp = _readField(record, fields.timestamp);
    final imageUrl = _readField(record, fields.image);
    final qrValue = _readField(record, fields.qr);

    final isSigned = record != null &&
        ((name != null && name.isNotEmpty) ||
            (rawTimestamp != null && rawTimestamp.isNotEmpty));

    final children = <pw.Widget>[];

    if (meaning.isNotEmpty) {
      children.add(
        pw.Text(
          meaning,
          style: pw.TextStyle(
            fontSize: 8,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.black,
          ),
        ),
      );
    }

    if (!isSigned) {
      children.add(
        pw.Padding(
          padding: const pw.EdgeInsets.symmetric(vertical: 4),
          child: pw.Container(
            height: style.qrSizePt,
            alignment: pw.Alignment.center,
            decoration: pw.BoxDecoration(
              color: PdfColors.grey100,
              border: pw.Border.all(color: PdfColors.grey300, width: 0.5),
            ),
            child: labels.pendingNote.isNotEmpty
                ? pw.Text(
                    labels.pendingNote,
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      fontSize: 7.5,
                      fontStyle: pw.FontStyle.italic,
                      color: PdfColors.grey600,
                    ),
                  )
                : pw.SizedBox(),
          ),
        ),
      );
      children.add(
        pw.Padding(
          padding: const pw.EdgeInsets.only(top: 6),
          child: pw.Container(
            decoration: const pw.BoxDecoration(
              border: pw.Border(
                bottom: pw.BorderSide(color: PdfColors.grey400, width: 0.5),
              ),
            ),
            child: pw.SizedBox(height: 8),
          ),
        ),
      );
    } else {
      // Visual middle slot: image > QR > electronic note / space
      final hasImage = imageUrl != null && imageCache.containsKey(imageUrl);
      final hasQr = qrValue != null && qrValue.isNotEmpty;

      if (hasImage) {
        children.add(
          pw.Padding(
            padding: const pw.EdgeInsets.symmetric(vertical: 4),
            child: pw.Image(
              imageCache[imageUrl]!,
              height: style.imageHeightPt,
              fit: pw.BoxFit.contain,
            ),
          ),
        );
      } else if (hasQr) {
        children.add(
          pw.Padding(
            padding: const pw.EdgeInsets.symmetric(vertical: 4),
            child: pw.BarcodeWidget(
              barcode: pw.Barcode.qrCode(),
              data: qrValue,
              width: style.qrSizePt,
              height: style.qrSizePt,
            ),
          ),
        );
      } else {
        if (labels.electronicNote.isNotEmpty) {
          children.add(
            pw.Padding(
              padding: const pw.EdgeInsets.only(top: 4, bottom: 6),
              child: pw.Text(
                labels.electronicNote,
                style: pw.TextStyle(
                  fontSize: 7,
                  fontStyle: pw.FontStyle.italic,
                  color: PdfColors.grey700,
                ),
              ),
            ),
          );
        } else {
          children.add(pw.SizedBox(height: style.spaceHeightPt));
        }
      }

      if (name != null && name.isNotEmpty) {
        children.add(
          pw.Text(
            name,
            style: pw.TextStyle(
              fontSize: 9,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.black,
            ),
          ),
        );
      }

      if (role != null && role.isNotEmpty) {
        children.add(
          pw.Text(
            role,
            style: const pw.TextStyle(
              fontSize: 8,
              color: PdfColors.grey800,
            ),
          ),
        );
      }

      if (idNumber != null && idNumber.isNotEmpty) {
        children.add(
          pw.Text(
            '${labels.idPrefix}$idNumber',
            style: const pw.TextStyle(
              fontSize: 8,
              color: PdfColors.grey800,
            ),
          ),
        );
      }

      if (rawTimestamp != null && rawTimestamp.isNotEmpty) {
        final formattedTime = _formatTimestamp(rawTimestamp, model.dateFormat);
        children.add(
          pw.Padding(
            padding: const pw.EdgeInsets.only(top: 2),
            child: pw.Text(
              formattedTime,
              style: const pw.TextStyle(
                fontSize: 7,
                color: PdfColors.grey700,
              ),
            ),
          ),
        );
      }
    }

    return pw.Container(
      padding: pw.EdgeInsets.all(style.paddingPt),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(
          color: style.borderColor,
          width: style.borderWidth,
        ),
      ),
      child: pw.Column(
        mainAxisSize: pw.MainAxisSize.min,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  static String? _readField(Map<String, dynamic>? record, String fieldName) {
    if (record == null || fieldName.isEmpty) return null;
    final val = record[fieldName];
    if (val == null) return null;
    final str = val.toString().trim();
    return str.isEmpty ? null : str;
  }

  static String _formatTimestamp(String raw, String? pattern) {
    if (pattern == null || pattern.trim().isEmpty) return raw;
    try {
      final parsed = DateTime.tryParse(raw);
      if (parsed == null) return raw;
      return DateFormat(pattern).format(parsed);
    } catch (_) {
      return raw;
    }
  }
}
