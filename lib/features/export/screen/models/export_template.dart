import 'export_section.dart';

class ExportTemplate {
  final String title;
  final List<ExportSection> sections;

  ExportTemplate({
    required this.title,
    required this.sections,
  });

  factory ExportTemplate.fromJson(Map<String, dynamic> json) {
    return ExportTemplate(
      title: json['title'] ?? '',
      sections: (json['sections'] as List<dynamic>)
          .map((e) => ExportSection.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'sections': sections.map((e) => e.toJson()).toList(),
      };
}
