import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../domain/json_pdf_generator.dart';

@widgetbook.UseCase(
  name: 'CPOB CAPA Document (Watermark + Signature Block)',
  type: PdfPreview,
  path: '[Print]',
)
Widget buildCpobCapaPrintUseCase(BuildContext context) {
  return _buildCpobCapaPreview(
    context,
    title: 'CPOB CAPA Print Preview (FF-05)',
    defaultShowQr: true,
    showQrKnob: true,
  );
}

@widgetbook.UseCase(
  name: 'CPOB CAPA Document (Standard E-Signature)',
  type: PdfPreview,
  path: '[Print]',
)
Widget buildCpobCapaStandardEsignUseCase(BuildContext context) {
  return _buildCpobCapaPreview(
    context,
    title: 'CPOB CAPA Standard E-Signature (FF-05)',
    defaultShowQr: false,
    showQrKnob: false,
  );
}

Widget _buildCpobCapaPreview(
  BuildContext context, {
  required String title,
  required bool defaultShowQr,
  required bool showQrKnob,
}) {
  final isDraft = context.knobs.boolean(
    label: 'Draft (Show Watermark)',
    initialValue: true,
  );
  final tiledWatermark = context.knobs.boolean(
    label: 'Tiled Watermark',
    initialValue: false,
  );
  final actionCount = context.knobs.int.slider(
    label: 'CAPA Action Rows (0 = empty, 30 = multi-page)',
    initialValue: 12,
    min: 0,
    max: 35,
  );
  final useSlots = context.knobs.boolean(
    label: 'Use Fixed Approval Slots',
    initialValue: true,
  );
  final showQr = showQrKnob
      ? context.knobs.boolean(
          label: 'Include QR Verification',
          initialValue: defaultShowQr,
        )
      : defaultShowQr;

  final actions = List.generate(
    actionCount,
    (i) => {
      'action_type': i.isEven ? 'Corrective' : 'Preventive',
      'description':
          'Tindakan CAPA #${i + 1}: Kalibrasi ulang sensor suhu ruang steril dan verifikasi log harian.',
      'pic_name': i.isEven ? 'Dr. Andi Wijaya' : 'Siti Rahma, Apt.',
      'due_date': '2026-12-${((i % 28) + 1).toString().padLeft(2, '0')}',
    },
  );

  final signatures = [
    {
      'meaning_code': 'PREPARED',
      'meaning': 'Disiapkan oleh',
      'signer_name': 'Dr. Andi Wijaya',
      'signer_nip': '19880101',
      'signer_role': 'QA Officer',
      'signed_at': '2026-11-20T08:30:00Z',
      if (showQr) 'verification_url': 'https://verify.vneu.id/sig/capa-001-prep',
    },
    {
      'meaning_code': 'REVIEWED',
      'meaning': 'Diperiksa oleh',
      'signer_name': 'Siti Rahma, S.Farm., Apt.',
      'signer_nip': '19850512',
      'signer_role': 'QA Supervisor',
      'signed_at': '2026-11-20T10:15:00Z',
      if (showQr) 'verification_url': 'https://verify.vneu.id/sig/capa-001-rev',
    },
    if (!isDraft)
      {
        'meaning_code': 'APPROVED',
        'meaning': 'Disetujui oleh',
        'signer_name': 'Apt. Hendra Gunawan',
        'signer_nip': '19790308',
        'signer_role': 'QA Manager',
        'signed_at': '2026-11-21T14:00:00Z',
        if (showQr)
          'verification_url': 'https://verify.vneu.id/sig/capa-001-app',
      },
  ];

  final config = <String, dynamic>{
    'id': 'capa_document_print',
    'name': 'Cetak Dokumen CAPA',
    'layout_type': 'document',
    'unit': 'mm',
    'page_size': 'A4',
    'orientation': 'portrait',
    'margins': {'top': 15, 'right': 15, 'bottom': 15, 'left': 15},
    'watermark': {
      'value': 'DRAF - NOMOR BELUM TERBIT',
      'font_size': 32,
      'color': '#999999',
      'opacity': 0.14,
      'rotation': -30,
      'layer': 'background',
      'repeat': tiledWatermark ? 'tiled' : 'single',
      'visible_if': {
        'all': [
          {'field': 'official_no', 'op': 'is_empty'},
        ],
      },
    },
    'header': [
      {
        'type': 'table',
        'cell_padding': 2,
        'margin': {'bottom': 4},
        'body': [
          [
            {
              'flex': 4,
              'content': {
                'type': 'column',
                'children': [
                  {
                    'type': 'text',
                    'value': 'FORMULIR TINDAKAN PERBAIKAN & PENCEGAHAN (CAPA)',
                    'font_size': 10,
                    'is_bold': true,
                  },
                  {
                    'type': 'text',
                    'value': 'PT. Metiska Farma - Sistem Manajemen Mutu CPOB',
                    'font_size': 8,
                    'color': '#555555',
                  },
                ],
              },
            },
            {
              'flex': 2,
              'content': {
                'type': 'column',
                'children': [
                  {
                    'type': 'text',
                    'value': 'No: {{data.official_no_display}}',
                    'font_size': 8,
                    'is_bold': true,
                  },
                  {
                    'type': 'text',
                    'value': 'Hal: {{_page.number}} dari {{_page.total}}',
                    'font_size': 8,
                  },
                ],
              },
            },
          ],
        ],
      },
    ],
    'content': [
      {
        'type': 'text',
        'value': '1. Informasi Umum',
        'font_size': 10,
        'is_bold': true,
        'margin': {'top': 6, 'bottom': 2},
      },
      {
        'type': 'table',
        'cell_padding': 3,
        'body': [
          [
            {
              'flex': 2,
              'content': {
                'type': 'text',
                'value': 'Judul Penyimpangan',
                'font_size': 9,
                'is_bold': true,
              },
            },
            {
              'flex': 5,
              'content': {
                'type': 'text',
                'value': '{{data.title}}',
                'font_size': 9,
              },
            },
          ],
          [
            {
              'flex': 2,
              'content': {
                'type': 'text',
                'value': 'Status Dokumen',
                'font_size': 9,
                'is_bold': true,
              },
            },
            {
              'flex': 5,
              'content': {
                'type': 'text',
                'value': '{{data.status_label}}',
                'font_size': 9,
              },
            },
          ],
        ],
      },
      {
        'type': 'text',
        'value': '2. Daftar Tindakan CAPA',
        'font_size': 10,
        'is_bold': true,
        'margin': {'top': 8, 'bottom': 2},
      },
      {
        'type': 'table',
        'data': '{{sources.actions}}',
        'empty_text': 'Belum ada tindakan CAPA yang terdaftar.',
        'header_background_color': '#E8EEF5',
        'header_text_color': '#111111',
        'cell_padding': 3,
        'header': [
          {'content': {'type': 'text', 'value': 'No', 'font_size': 9, 'is_bold': true}, 'flex': 0.6, 'align': 'center'},
          {'content': {'type': 'text', 'value': 'Jenis', 'font_size': 9, 'is_bold': true}, 'flex': 1.4},
          {'content': {'type': 'text', 'value': 'Uraian Tindakan', 'font_size': 9, 'is_bold': true}, 'flex': 3.6},
          {'content': {'type': 'text', 'value': 'PIC', 'font_size': 9, 'is_bold': true}, 'flex': 1.9},
          {'content': {'type': 'text', 'value': 'Target', 'font_size': 9, 'is_bold': true}, 'flex': 1.7, 'align': 'center'},
        ],
        'body': [
          {'content': {'type': 'text', 'value': '{{no}}', 'font_size': 9}, 'flex': 0.6, 'align': 'center'},
          {'content': {'type': 'text', 'value': '{{item.action_type}}', 'font_size': 9}, 'flex': 1.4},
          {'content': {'type': 'text', 'value': '{{item.description}}', 'font_size': 9}, 'flex': 3.6},
          {'content': {'type': 'text', 'value': '{{item.pic_name}}', 'font_size': 9}, 'flex': 1.9},
          {'content': {'type': 'text', 'value': '{{item.due_date}}', 'font_size': 9, 'soft_wrap': false}, 'flex': 1.7, 'align': 'center'},
        ],
      },
      {
        'type': 'text',
        'value': '3. Persetujuan & Tanda Tangan Elektronik',
        'font_size': 10,
        'is_bold': true,
        'margin': {'top': 8, 'bottom': 3},
      },
      {
        'type': 'signature_block',
        'data': '{{sources.signatures}}',
        'columns': 3,
        'gap': 4,
        'keep_together': true,
        'date_format': 'dd MMM yyyy HH:mm',
        'empty_text': 'Belum ada tanda tangan elektronik.',
        if (useSlots)
          'slots': [
            {'key': 'PREPARED', 'meaning': 'Disiapkan oleh'},
            {'key': 'REVIEWED', 'meaning': 'Diperiksa oleh'},
            {'key': 'APPROVED', 'meaning': 'Disetujui oleh'},
          ],
        'slot_match_field': 'meaning_code',
      },
    ],
    'footer': [
      {
        'type': 'row',
        'main_axis_alignment': 'space_between',
        'children': [
          {
            'type': 'text',
            'value': 'Dokumen terkendali secara elektronik - Plant CPOB',
            'font_size': 7,
            'color': '#777777',
          },
          {
            'type': 'text',
            'value': 'Halaman {{_page.number}} / {{_page.total}}',
            'font_size': 7,
            'color': '#777777',
          },
        ],
      },
    ],
  };

  final data = <String, dynamic>{
    'data': {
      'official_no': isDraft ? '' : 'CAPA-2026-0042',
      'official_no_display': isDraft ? '(DRAF)' : 'CAPA-2026-0042',
      'title': 'Deviasi Suhu Ruang Steril Line 2 di Atas Batas Waspada',
      'status_label': isDraft ? 'Draf / Menunggu Persetujuan' : 'Disetujui & Terbit',
    },
    'sources': {
      'actions': actions,
      'signatures': signatures,
    },
  };

  final previewKey = ValueKey(
    'cpob_${isDraft}_${tiledWatermark}_${actionCount}_${useSlots}_$showQr',
  );

  return Scaffold(
    appBar: AppBar(title: Text(title)),
    body: PdfPreview(
      key: previewKey,
      build: (format) => JsonPdfGenerator.generate(config, data: data),
      allowPrinting: true,
      allowSharing: true,
      canChangeOrientation: false,
      canChangePageFormat: false,
    ),
  );
}
