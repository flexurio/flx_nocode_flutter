import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:printing/printing.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import '../../domain/json_pdf_generator.dart';

class MockDio extends Mock implements Dio {}

@widgetbook.UseCase(
  name: 'Daftar Inisial Personel (Complex Table)',
  type: PdfPreview,
  path: '[Print]',
)
Widget buildPersonnelListUseCase(BuildContext context) {
  return const _PersonnelListApiDemo();
}

class _PersonnelListApiDemo extends StatefulWidget {
  const _PersonnelListApiDemo({Key? key}) : super(key: key);

  @override
  State<_PersonnelListApiDemo> createState() => _PersonnelListApiDemoState();
}

class _PersonnelListApiDemoState extends State<_PersonnelListApiDemo> {
  Map<String, dynamic>? _config;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final dio = MockDio();
    
    // Setup Mock
    when(() => dio.get('/api/personnel')).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(path: '/api/personnel'),
        statusCode: 200,
        data: [
          { "no": "1.", "nama": "Sri Anjariyah", "inisial": "SAH", "paraf": "", "ttd": "1." },
          { "no": "2.", "nama": "Karina Dwi Lestari", "inisial": "KDL", "paraf": "", "ttd": "       2." },
          { "no": "3.", "nama": "Bestia Arkiani", "inisial": "BAI", "paraf": "", "ttd": "3." },
          { "no": "4.", "nama": "Helmy Akbar", "inisial": "HAR", "paraf": "", "ttd": "       4." },
          { "no": "5.", "nama": "Usha Nandeni", "inisial": "UNI", "paraf": "", "ttd": "5." },
          { "no": "6.", "nama": "Asep Tatang Sudrajat", "inisial": "ATS", "paraf": "", "ttd": "       6." },
          { "no": "7.", "nama": "Syahruddin", "inisial": "SRN", "paraf": "", "ttd": "7." },
          { "no": "8.", "nama": "Dede Mulyadi", "inisial": "DMI", "paraf": "", "ttd": "       8." },
          { "no": "9.", "nama": "Rheza Firmansyah", "inisial": "RFH", "paraf": "", "ttd": "9." },
          { "no": "10.", "nama": "Rahmat Hidayat", "inisial": "RDT", "paraf": "", "ttd": "       10." }
        ],
      ),
    );

    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Fetch from API
      final response = await dio.get('/api/personnel');
      final users = response.data as List<dynamic>;

      const jsonString = '''
      {
        "id": "print_personnel_list",
        "name": "Daftar Inisial Personel",
        "layout_type": "canvas",
        "unit": "mm",
        "page_size": "A4",
        "orientation": "portrait",
        "header": [
          {
            "type": "table",
            "x": 10, "y": 10,
            "width": 190,
            "show_header": false,
            "columns": [
              { "header": "", "key": "logo", "flex": 2 },
              { "header": "", "key": "title", "flex": 6 },
              { "header": "", "key": "dates", "flex": 3 }
            ],
            "data": [
              {
                "logo": {
                  "type": "container",
                  "padding": 2,
                  "child": {
                    "type": "image",
                    "url": "https://picsum.photos/100",
                    "width": 30, "height": 30,
                    "fit": "contain"
                  }
                },
                "title": {
                  "type": "column",
                  "cross_axis_alignment": "center",
                  "children": [
                    { "type": "container", "height": 12 },
                    { "type": "text", "value": "DAFTAR INISIAL PERSONEL", "font_size": 18, "is_bold": true },
                    { "type": "container", "height": 8 },
                    { "type": "text", "value": "Quality Assurance", "font_size": 10 }
                  ]
                },
                "dates": {
                  "type": "column",
                  "children": [
                    { "type": "text", "value": "Effective Date :", "font_size": 8 },
                    { "type": "container", "height": 15 },
                    { "type": "text", "value": "Review Date :", "font_size": 8 }
                  ]
                }
              }
            ]
          }
        ],
        "pages": [
          {
            "background_color": "#FFFFFF",
            "components": [
              {
                "type": "table",
                "x": 10, "y": 50,
                "width": 190,
                "columns": [
                  { "header": "No.", "key": "no", "flex": 1 },
                  { "header": "Nama Personel", "key": "nama", "flex": 5 },
                  { "header": "Inisial", "key": "inisial", "flex": 2 },
                  { "header": "Paraf", "key": "paraf", "flex": 3 },
                  { "header": "Tanda Tangan", "key": "ttd", "flex": 4 }
                ],
                "data": []
              }
            ]
          }
        ]
      }
      ''';

      final config = jsonDecode(jsonString) as Map<String, dynamic>;
      
      // Inject API data into JSON config
      config['pages'][0]['components'][0]['data'] = users;

      setState(() {
        _config = config;
      });
    } catch (e) {
      // Handle error gracefully
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_config == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Loading API Data...')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Inisial Personel (API)')),
      body: PdfPreview(
        build: (format) => JsonPdfGenerator.generate(_config!),
        allowPrinting: true,
        allowSharing: true,
        canChangeOrientation: false,
        canChangePageFormat: false,
      ),
    );
  }
}
