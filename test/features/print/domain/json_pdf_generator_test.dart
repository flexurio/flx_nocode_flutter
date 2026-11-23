import 'dart:convert';
import 'package:flx_nocode_flutter/features/print/domain/json_pdf_generator.dart';
import 'package:flx_nocode_flutter/features/print/domain/pdf_generator/utils/pdf_data_utils.dart';
import 'package:flx_nocode_flutter/features/print/domain/pdf_generator/utils/pdf_interpolation_utils.dart';
import 'package:flx_nocode_flutter/features/print/domain/pdf_generator/utils/pdf_visibility_utils.dart';
import 'package:flx_nocode_flutter/shared/services/http_request_executor.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_nocode_flutter/src/app/model/user.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeHttpRequestExecutor extends HttpRequestExecutor {
  final Map<String, HttpRequestResult> responses;

  _FakeHttpRequestExecutor(this.responses);

  @override
  Future<HttpRequestResult> execute(HttpRequestConfig config) async {
    for (final entry in responses.entries) {
      if (config.url.contains(entry.key)) {
        return entry.value;
      }
    }
    return HttpRequestResult.failure(
      statusCode: 404,
      message: 'Not found: ${config.url}',
    );
  }
}

void main() {
  setUpAll(() {
    Configuration.instance = Configuration.empty().copyWith(
      backendHost: 'https://api.example',
    );
    UserRepositoryAppNocode.instance = UserRepositoryAppNocode();
    UserRepositoryAppNocode.instance.userApp =
        UserAppNocode(id: 1, name: 'Test User', role: 'admin');
    UserRepositoryAppNocode.instance.token = 'test_token';
  });

  group('PdfVisibilityUtils', () {
    test('evaluates Rule with flat key, data.* path, and item.* path', () {
      final draftContext = <String, dynamic>{
        'data': {'official_no': ''},
        'item': {'verification_url': 'https://verify.example/1'},
      };

      expect(
        PdfVisibilityUtils.isVisible(
          {
            'all': [
              {'field': 'official_no', 'op': 'is_empty'}
            ]
          },
          draftContext,
        ),
        isTrue,
      );

      expect(
        PdfVisibilityUtils.isVisible(
          {
            'all': [
              {'field': 'data.official_no', 'op': 'is_empty'}
            ]
          },
          draftContext,
        ),
        isTrue,
      );

      expect(
        PdfVisibilityUtils.isVisible(
          {
            'all': [
              {'field': 'item.verification_url', 'op': 'is_not_empty'}
            ]
          },
          draftContext,
        ),
        isTrue,
      );

      final approvedContext = <String, dynamic>{
        'data': {'official_no': 'CAPA-2026-001'},
      };
      expect(
        PdfVisibilityUtils.isVisible(
          {
            'all': [
              {'field': 'official_no', 'op': 'is_empty'}
            ]
          },
          approvedContext,
        ),
        isFalse,
      );
    });
  });

  group('PdfDataUtils.fetchDataSources', () {
    test('stores multiple endpoints under isolated sources.<key> namespaces',
        () async {
      final executor = _FakeHttpRequestExecutor({
        '/actions': HttpRequestResult.success(
          statusCode: 200,
          data: {
            'status': 'ok',
            'data': [
              {'id': 1, 'description': 'Perbaiki SOP'},
              {'id': 2, 'description': 'Training operator'},
            ],
          },
        ),
        '/signatures': HttpRequestResult.success(
          statusCode: 200,
          data: {
            'result': {
              'items': [
                {
                  'meaning': 'Disiapkan oleh',
                  'signer_name': 'Budi Santoso',
                  'signer_nip': '10023',
                  'signed_at': '2026-11-20T09:15:00Z',
                },
              ],
            },
          },
        ),
      });

      final json = <String, dynamic>{
        'data_sources': {
          'actions': {
            'http_data': {
              'method': 'GET',
              'url': 'https://api.example/capa/42/actions',
            },
            'data_path': 'data',
          },
          'signatures': {
            'http_data': {
              'method': 'GET',
              'url': 'https://api.example/documents/42/signatures',
            },
            'data_path': 'result.items',
          },
          'optional_failed': {
            'http_data': {
              'method': 'GET',
              'url': 'https://api.example/missing',
            },
            'on_error': 'empty',
          },
        },
      };

      final context = <String, dynamic>{
        'data': {'id': 42},
      };

      await PdfDataUtils.fetchDataSources(json, context, executor: executor);

      final sources = context['sources'] as Map<String, dynamic>;
      expect((sources['actions'] as List).length, 2);
      expect((sources['signatures'] as List).length, 1);
      expect(sources['optional_failed'], isEmpty);
      // Root `data` must NOT be clobbered by data_sources
      expect((context['data'] as Map)['id'], 42);
    });

    test('rethrows when on_error is fail', () async {
      final executor = _FakeHttpRequestExecutor({});
      final json = <String, dynamic>{
        'data_sources': {
          'critical': {
            'http_data': {
              'method': 'GET',
              'url': 'https://api.example/fail',
            },
            'on_error': 'fail',
          },
        },
      };

      await expectLater(
        () => PdfDataUtils.fetchDataSources(json, {}, executor: executor),
        throwsException,
      );
    });
  });

  group('PdfInterpolationUtils', () {
    test('preserves dynamic table.body, grid.item_template, and visible_if',
        () {
      final json = <String, dynamic>{
        'content': [
          {
            'type': 'table',
            'data': '{{sources.actions}}',
            'body': [
              {'content': '{{item.description}}'},
              {'content': '{{data.status}}'},
            ],
          },
          {
            'type': 'grid',
            'data': '{{sources.signatures}}',
            'item_template': {
              'type': 'text',
              'value': '{{item.signer_name}}',
              'visible_if': {
                'all': [
                  {'field': 'item.signer_name', 'op': 'is_not_empty'}
                ]
              },
            },
          },
        ],
      };

      final context = <String, dynamic>{
        'data': {'status': 'ROOT_STATUS'},
        'sources': {
          'actions': [
            {'description': 'A1', 'status': 'OPEN'},
          ],
          'signatures': [
            {'signer_name': 'Siti'},
          ],
        },
      };

      final result =
          PdfInterpolationUtils.interpolateJson(json, context) as Map;
      final content = result['content'] as List;

      final table = content[0] as Map;
      expect(table['data'], isA<List>());
      // Body template must remain untouched so root status does not leak
      expect((table['body'] as List)[1]['content'], '{{data.status}}');

      final grid = content[1] as Map;
      expect(grid['data'], isA<List>());
      expect((grid['item_template'] as Map)['value'], '{{item.signer_name}}');
      expect((grid['item_template'] as Map)['visible_if'], isA<Map>());
    });

    test('interpolates _page.number/_page.total and page/pages aliases', () {
      final footer = [
        {
          'type': 'text',
          'value': 'Hal {{_page.number}} dari {{_page.total}} ({{page}}/{{pages}})',
        },
      ];
      final resolved = PdfInterpolationUtils.interpolatePageContext(
        footer,
        pageNumber: 2,
        pagesCount: 5,
      ) as List;
      expect((resolved.first as Map)['value'], 'Hal 2 dari 5 (2/5)');
    });
  });

  group('JsonPdfGenerator end-to-end', () {
    test(
        'generates multi-page CPOB document with watermark, child table, signature_block, and page numbers',
        () async {
      final actions = List.generate(
        35,
        (i) => {
          'action_type': i.isEven ? 'Corrective' : 'Preventive',
          'description': 'Tindakan CAPA ke-${i + 1} untuk verifikasi multi halaman',
          'pic_name': 'PIC ${i + 1}',
          'due_date': '2026-12-01',
        },
      );

      final executor = _FakeHttpRequestExecutor({
        '/actions': HttpRequestResult.success(
          statusCode: 200,
          data: {'data': actions},
        ),
        '/signatures': HttpRequestResult.success(
          statusCode: 200,
          data: {
            'data': [
              {
                'meaning_code': 'PREPARED',
                'meaning': 'Disiapkan oleh',
                'signer_name': 'Dr. Andi Wijaya',
                'signer_nip': '19880101',
                'signer_role': 'QA Officer',
                'signed_at': '2026-11-20T08:30:00Z',
                'verification_url': 'https://verify.vneu.id/sig/1',
              },
              {
                'meaning_code': 'REVIEWED',
                'meaning': 'Diperiksa oleh',
                'signer_name': 'Siti Rahma, S.Farm., Apt.',
                'signer_nip': '19850512',
                'signed_at': '2026-11-20T10:00:00Z',
              },
            ],
          },
        ),
      });

      final layoutJson = <String, dynamic>{
        'id': 'capa_document_print',
        'name': 'Cetak Dokumen CAPA',
        'layout_type': 'document',
        'unit': 'mm',
        'page_size': 'A4',
        'margins': {'top': 15, 'right': 15, 'bottom': 15, 'left': 15},
        'data_sources': {
          'actions': {
            'http_data': {
              'method': 'GET',
              'url': 'https://api.example/capa/1/actions',
            },
            'data_path': 'data',
          },
          'signatures': {
            'http_data': {
              'method': 'GET',
              'url': 'https://api.example/documents/1/signatures',
            },
            'data_path': 'data',
          },
        },
        'watermark': {
          'value': 'DRAF – NOMOR BELUM TERBIT',
          'font_size': 32,
          'color': '#999999',
          'opacity': 0.12,
          'rotation': -30,
          'layer': 'background',
          'repeat': 'single',
          'visible_if': {
            'all': [
              {'field': 'official_no', 'op': 'is_empty'}
            ]
          },
        },
        'header': [
          {
            'type': 'row',
            'main_axis_alignment': 'space_between',
            'children': [
              {'type': 'text', 'value': 'DOKUMEN CAPA', 'font_size': 10, 'is_bold': true},
              {'type': 'text', 'value': 'Hal {{_page.number}} dari {{_page.total}}', 'font_size': 8},
            ],
          },
        ],
        'content': [
          {
            'type': 'table',
            'data': '{{sources.actions}}',
            'empty_text': 'Belum ada tindakan CAPA.',
            'header_background_color': '#F0F4F8',
            'header_text_color': '#111111',
            'header': [
              {'content': 'No', 'flex': 0.6, 'align': 'center'},
              {'content': 'Jenis', 'flex': 1.4},
              {'content': 'Uraian', 'flex': 4},
              {'content': 'PIC', 'flex': 2},
            ],
            'body': [
              {'content': '{{no}}', 'flex': 0.6, 'align': 'center'},
              {'content': '{{item.action_type}}', 'flex': 1.4},
              {'content': '{{item.description}}', 'flex': 4},
              {'content': '{{item.pic_name}}', 'flex': 2},
            ],
          },
          {
            'type': 'signature_block',
            'data': '{{sources.signatures}}',
            'columns': 3,
            'gap': 4,
            'keep_together': true,
            'date_format': 'dd MMM yyyy HH:mm',
            'slots': [
              {'key': 'PREPARED', 'meaning': 'Disiapkan oleh'},
              {'key': 'REVIEWED', 'meaning': 'Diperiksa oleh'},
              {'key': 'APPROVED', 'meaning': 'Disetujui oleh'},
            ],
            'slot_match_field': 'meaning_code',
            'margin': {'top': 8},
          },
        ],
        'footer': [
          {
            'type': 'text',
            'value': 'Halaman {{_page.number}} / {{_page.total}}',
            'font_size': 8,
            'align': 'right',
          },
        ],
      };

      final bytes = await JsonPdfGenerator.generate(
        layoutJson,
        data: {
          'data': {'id': 1, 'official_no': ''},
        },
        executor: executor,
      );

      expect(bytes, isNotEmpty);
      expect(utf8.decode(bytes.take(5).toList()), '%PDF-');
    });

    test('renders empty_text cleanly for empty child table, grid, and signature_block',
        () async {
      final layoutJson = <String, dynamic>{
        'id': 'empty_states_print',
        'name': 'Empty States',
        'layout_type': 'document',
        'unit': 'mm',
        'page_size': 'A4',
        'watermark': {
          'value': 'DRAF',
          'repeat': 'tiled',
          'layer': 'foreground',
          'visible_if': {
            'all': [
              {'field': 'official_no', 'op': 'is_empty'}
            ]
          },
        },
        'content': [
          {
            'type': 'table',
            'data': '{{sources.actions}}',
            'empty_text': 'Belum ada tindakan.',
            'header': [
              {'content': 'No', 'flex': 1},
              {'content': 'Uraian', 'flex': 4},
            ],
            'body': [
              {'content': '{{no}}', 'flex': 1},
              {'content': '{{item.description}}', 'flex': 4},
            ],
          },
          {
            'type': 'grid',
            'data': '{{sources.attachments}}',
            'columns': 2,
            'empty_text': 'Tidak ada lampiran.',
            'item_template': {
              'type': 'text',
              'value': '{{item.caption}}',
            },
          },
          {
            'type': 'signature_block',
            'data': '{{sources.signatures}}',
            'empty_text': 'Belum ada tanda tangan elektronik.',
          },
        ],
      };

      final bytes = await JsonPdfGenerator.generate(
        layoutJson,
        data: {
          'official_no': 'CAPA-001', // watermark should be hidden
          'sources': {
            'actions': <dynamic>[],
            'attachments': <dynamic>[],
            'signatures': <dynamic>[],
          },
        },
      );

      expect(bytes, isNotEmpty);
      expect(utf8.decode(bytes.take(5).toList()), '%PDF-');
    });

    test('renders generic grid component with item_template and visible_if',
        () async {
      final layoutJson = <String, dynamic>{
        'id': 'grid_print',
        'name': 'Grid Print',
        'layout_type': 'document',
        'unit': 'mm',
        'page_size': 'A4',
        'content': [
          {
            'type': 'grid',
            'data': '{{sources.cards}}',
            'columns': 2,
            'gap': 4,
            'keep_together': false,
            'item_template': {
              'type': 'container',
              'border_color': '#CCCCCC',
              'border_width': 0.5,
              'padding': 3,
              'child': {
                'type': 'column',
                'children': [
                  {'type': 'text', 'value': '{{no}}. {{item.title}}', 'is_bold': true},
                  {
                    'type': 'qrcode',
                    'value': '{{item.qr}}',
                    'size': 12,
                    'visible_if': {
                      'all': [
                        {'field': 'item.qr', 'op': 'is_not_empty'}
                      ]
                    },
                  },
                ],
              },
            },
          },
        ],
      };

      final bytes = await JsonPdfGenerator.generate(
        layoutJson,
        data: {
          'sources': {
            'cards': [
              {'title': 'Card 1', 'qr': 'https://example.com/1'},
              {'title': 'Card 2', 'qr': ''},
              {'title': 'Card 3', 'qr': 'https://example.com/3'},
            ],
          },
        },
      );

      expect(bytes, isNotEmpty);
      expect(utf8.decode(bytes.take(5).toList()), '%PDF-');
    });

    test(
        'renders signature_block with custom fields mapping (no QR) and text soft_wrap/max_lines',
        () async {
      final layoutJson = <String, dynamic>{
        'id': 'custom_signature_print',
        'name': 'Custom Signature & SoftWrap',
        'layout_type': 'document',
        'unit': 'mm',
        'page_size': 'A4',
        'content': [
          {
            'type': 'table',
            'data': '{{sources.items}}',
            'header': [
              {'content': 'No', 'flex': 1},
              {'content': 'Tanggal', 'flex': 2},
            ],
            'body': [
              {'content': '{{no}}', 'flex': 1},
              {
                'content': {
                  'type': 'text',
                  'value': '{{item.target_date}}',
                  'font_size': 9,
                  'soft_wrap': false,
                  'max_lines': 1,
                },
                'flex': 2,
              },
            ],
          },
          {
            'type': 'signature_block',
            'data': '{{sources.approvals}}',
            'columns': 2,
            'fields': {
              'meaning': 'stage_label',
              'name': 'approver_name',
              'id_number': 'employee_nik',
              'role': 'job_title',
              'timestamp': 'approved_at',
            },
            'labels': {
              'id_prefix': 'NIK: ',
              'electronic_note': 'Approved electronically',
            },
            'date_format': 'dd MMM yyyy HH:mm',
          },
        ],
      };

      final bytes = await JsonPdfGenerator.generate(
        layoutJson,
        data: {
          'sources': {
            'items': [
              {'target_date': '2026-12-10'},
            ],
            'approvals': [
              {
                'stage_label': 'Prepared By',
                'approver_name': 'Rina Kusuma',
                'employee_nik': 'EMP-778',
                'job_title': 'QA Specialist',
                'approved_at': '2026-11-22T07:45:00Z',
              },
            ],
          },
        },
      );

      expect(bytes, isNotEmpty);
      expect(utf8.decode(bytes.take(5).toList()), '%PDF-');
    });

    test('renders Canvas mode with watermark and runtime page variables',
        () async {
      final layoutJson = <String, dynamic>{
        'id': 'canvas_watermark_print',
        'name': 'Canvas Watermark',
        'layout_type': 'canvas',
        'unit': 'mm',
        'page_size': 'A4',
        'watermark': {
          'value': 'DRAF',
          'opacity': 0.15,
          'rotation': -30,
          'layer': 'foreground',
          'visible_if': {
            'all': [
              {'field': 'official_no', 'op': 'is_empty'}
            ]
          },
        },
        'footer': [
          {
            'type': 'text',
            'value': 'Page {{_page.number}} of {{_page.total}}',
            'x': 150,
            'y': 280,
            'font_size': 8,
          },
        ],
        'pages': [
          {
            'components': [
              {'type': 'text', 'value': 'Page 1 Content', 'x': 20, 'y': 20},
            ],
          },
          {
            'components': [
              {'type': 'text', 'value': 'Page 2 Content', 'x': 20, 'y': 20},
            ],
          },
        ],
      };

      final bytes = await JsonPdfGenerator.generate(
        layoutJson,
        data: {'official_no': ''},
      );

      expect(bytes, isNotEmpty);
      expect(utf8.decode(bytes.take(5).toList()), '%PDF-');
    });
  });
}
