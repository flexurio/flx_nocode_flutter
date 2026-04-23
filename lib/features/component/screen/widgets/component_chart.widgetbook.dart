import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/component_chart.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'component_donut_chart.dart';
import 'component_pie_chart.dart';
import 'component_bar_chart.dart';

@UseCase(name: 'Donut Chart', type: ComponentDonutChart)
Widget donutChartUseCase(BuildContext context) {
  const jsonRaw = '''
  {
    "id": "donut_1",
    "type": "donut_chart",
    "title": "Stock Distribution",
    "reference_id": "chart_data",
    "label_key": "category",
    "value_key": "amount"
  }
  ''';

  final map = json.decode(jsonRaw) as Map<String, dynamic>;
  final component = ComponentDonutChart.fromMap(map);

  final contextData = {
    "chart_data": [
      {"category": "Electronics", "amount": 40},
      {"category": "Clothing", "amount": 30},
      {"category": "Groceries", "amount": 20},
      {"category": "Books", "amount": 10}
    ]
  };

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: component.toWidget(data: contextData),
    ),
  );
}

@UseCase(name: 'Pie Chart', type: ComponentPieChart)
Widget pieChartUseCase(BuildContext context) {
  const jsonRaw = '''
  {
    "id": "pie_1",
    "type": "pie_chart",
    "title": "Market Share",
    "reference_id": "market_data",
    "label_key": "brand",
    "value_key": "share"
  }
  ''';

  final map = json.decode(jsonRaw) as Map<String, dynamic>;
  final component = ComponentPieChart.fromMap(map);

  final contextData = {
    "market_data": [
      {"brand": "Apple", "share": 45},
      {"brand": "Samsung", "share": 25},
      {"brand": "Google", "share": 15},
      {"brand": "Others", "share": 15}
    ]
  };

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: component.toWidget(data: contextData),
    ),
  );
}

@UseCase(name: 'Bar Chart', type: ComponentBarChart)
Widget barChartUseCase(BuildContext context) {
  const jsonRaw = '''
  {
    "id": "bar_1",
    "type": "bar_chart",
    "title": "Monthly Revenue",
    "reference_id": "revenue_data",
    "label_key": "month",
    "value_key": "revenue"
  }
  ''';

  final map = json.decode(jsonRaw) as Map<String, dynamic>;
  final component = ComponentBarChart.fromMap(map);

  final contextData = {
    "revenue_data": [
      {"month": "Jan", "revenue": 1200},
      {"month": "Feb", "revenue": 1900},
      {"month": "Mar", "revenue": 1500},
      {"month": "Apr", "revenue": 2100},
      {"month": "May", "revenue": 1800}
    ]
  };

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: component.toWidget(data: contextData),
    ),
  );
}

@UseCase(name: 'Chart Mocks', type: ComponentChart)
Widget chartMocksUseCase(BuildContext context) {
  final donut = ComponentDonutChart.empty('donut_mock');
  final pie = ComponentPieChart.empty('pie_mock');
  final bar = ComponentBarChart.empty('bar_mock');

  return SingleChildScrollView(
    padding: const EdgeInsets.all(16.0),
    child: Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        Column(
          children: [
            const Text("Donut Mock"),
            donut.toMockWidget(),
          ],
        ),
        Column(
          children: [
            const Text("Pie Mock"),
            pie.toMockWidget(),
          ],
        ),
        Column(
          children: [
            const Text("Bar Mock"),
            bar.toMockWidget(),
          ],
        ),
      ],
    ),
  );
}
