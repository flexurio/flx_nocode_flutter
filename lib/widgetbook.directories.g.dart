// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_chart.widgetbook.dart'
    as _flx_nocode_flutter_features_component_screen_widgets_component_chart_widgetbook;
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_dropdown.widgetbook.dart'
    as _flx_nocode_flutter_features_component_screen_widgets_component_dropdown_widgetbook;
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_table.widgetbook.dart'
    as _flx_nocode_flutter_features_component_screen_widgets_component_table_widgetbook;
import 'package:flx_nocode_flutter/features/data_table/screen/widgets/entity_data_table.widgetbook.dart'
    as _flx_nocode_flutter_features_data_table_screen_widgets_entity_data_table_widgetbook;
import 'package:flx_nocode_flutter/features/entity/screen/pages/enitity_view_page.widgetbook.dart'
    as _flx_nocode_flutter_features_entity_screen_pages_enitity_view_page_widgetbook;
import 'package:flx_nocode_flutter/features/layout_form/screen/widgets/layout_form.widgetbook.dart'
    as _flx_nocode_flutter_features_layout_form_screen_widgets_layout_form_widgetbook;
import 'package:flx_nocode_flutter/features/print/presentation/usecases/concert_ticket_print.widgetbook.dart'
    as _flx_nocode_flutter_features_print_presentation_usecases_concert_ticket_print_widgetbook;
import 'package:flx_nocode_flutter/features/print/presentation/usecases/invoice_table_print.widgetbook.dart'
    as _flx_nocode_flutter_features_print_presentation_usecases_invoice_table_print_widgetbook;
import 'package:flx_nocode_flutter/features/print/presentation/usecases/personnel_list_print.widgetbook.dart'
    as _flx_nocode_flutter_features_print_presentation_usecases_personnel_list_print_widgetbook;
import 'package:flx_nocode_flutter/features/print/presentation/usecases/product_catalog_print.widgetbook.dart'
    as _flx_nocode_flutter_features_print_presentation_usecases_product_catalog_print_widgetbook;
import 'package:flx_nocode_flutter/features/view/screen/widgets/view.widgetbook.dart'
    as _flx_nocode_flutter_features_view_screen_widgets_view_widgetbook;
import 'package:flx_nocode_flutter/src/app/view/widget/entity_home.widgetbook.dart'
    as _flx_nocode_flutter_src_app_view_widget_entity_home_widgetbook;
import 'package:flx_nocode_flutter/src/app/view/widget/no_code_navigate_push_menu.widgetbook.dart'
    as _flx_nocode_flutter_src_app_view_widget_no_code_navigate_push_menu_widgetbook;
import 'package:widgetbook/widgetbook.dart' as _widgetbook;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookCategory(
    name: 'Print',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'PdfPreview',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Concert Ticket (Canvas Mode)',
            builder:
                _flx_nocode_flutter_features_print_presentation_usecases_concert_ticket_print_widgetbook
                    .buildConcertTicketUseCase,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Daftar Inisial Personel (Complex Table)',
            builder:
                _flx_nocode_flutter_features_print_presentation_usecases_personnel_list_print_widgetbook
                    .buildPersonnelListUseCase,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Invoice Table (Canvas Mode)',
            builder:
                _flx_nocode_flutter_features_print_presentation_usecases_invoice_table_print_widgetbook
                    .buildInvoiceTableUseCase,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Product Catalog (Table with Images)',
            builder:
                _flx_nocode_flutter_features_print_presentation_usecases_product_catalog_print_widgetbook
                    .buildProductCatalogTableUseCase,
          ),
        ],
      )
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'app',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'view',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'widget',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'MenuCustom',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default',
                    builder:
                        _flx_nocode_flutter_src_app_view_widget_entity_home_widgetbook
                            .buildMenuCustomUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Navigate Push Menu (Initial Value Test)',
                    builder:
                        _flx_nocode_flutter_src_app_view_widget_no_code_navigate_push_menu_widgetbook
                            .buildNavigatePushMenuUseCase,
                  ),
                ],
              )
            ],
          )
        ],
      )
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'features',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'component',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'models',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'ComponentBarChart',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Bar Chart',
                    builder:
                        _flx_nocode_flutter_features_component_screen_widgets_component_chart_widgetbook
                            .barChartUseCase,
                  )
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'ComponentChart',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Chart Mocks',
                    builder:
                        _flx_nocode_flutter_features_component_screen_widgets_component_chart_widgetbook
                            .chartMocksUseCase,
                  )
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'ComponentDonutChart',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Donut Chart',
                    builder:
                        _flx_nocode_flutter_features_component_screen_widgets_component_chart_widgetbook
                            .donutChartUseCase,
                  )
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'ComponentPieChart',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Pie Chart',
                    builder:
                        _flx_nocode_flutter_features_component_screen_widgets_component_chart_widgetbook
                            .pieChartUseCase,
                  )
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'ComponentTable',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Live Widget (Local Data)',
                    builder:
                        _flx_nocode_flutter_features_component_screen_widgets_component_table_widgetbook
                            .mockComponentTableLive,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Mock Design',
                    builder:
                        _flx_nocode_flutter_features_component_screen_widgets_component_table_widgetbook
                            .mockComponentTableDesign,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Reactive Form Integration',
                    builder:
                        _flx_nocode_flutter_features_component_screen_widgets_component_table_widgetbook
                            .mockComponentTableReactiveForm,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'With Dropdown Component',
                    builder:
                        _flx_nocode_flutter_features_component_screen_widgets_component_table_widgetbook
                            .mockComponentTableWithDropdown,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'With Row Actions',
                    builder:
                        _flx_nocode_flutter_features_component_screen_widgets_component_table_widgetbook
                            .mockComponentTableWithActions,
                  ),
                ],
              ),
            ],
          ),
          _widgetbook.WidgetbookFolder(
            name: 'screen',
            children: [
              _widgetbook.WidgetbookFolder(
                name: 'widgets',
                children: [
                  _widgetbook.WidgetbookComponent(
                    name: 'ComponentDropdownWidget',
                    useCases: [
                      _widgetbook.WidgetbookUseCase(
                        name: 'Fill Width',
                        builder:
                            _flx_nocode_flutter_features_component_screen_widgets_component_dropdown_widgetbook
                                .mockComponentDropdownFill,
                      ),
                      _widgetbook.WidgetbookUseCase(
                        name: 'Fixed Width',
                        builder:
                            _flx_nocode_flutter_features_component_screen_widgets_component_dropdown_widgetbook
                                .mockComponentDropdownFixed,
                      ),
                      _widgetbook.WidgetbookUseCase(
                        name: 'Hug Content',
                        builder:
                            _flx_nocode_flutter_features_component_screen_widgets_component_dropdown_widgetbook
                                .mockComponentDropdownHug,
                      ),
                      _widgetbook.WidgetbookUseCase(
                        name: 'Live Widget (Local Data)',
                        builder:
                            _flx_nocode_flutter_features_component_screen_widgets_component_dropdown_widgetbook
                                .mockComponentDropdownLive,
                      ),
                      _widgetbook.WidgetbookUseCase(
                        name: 'Mock Design (From JSON)',
                        builder:
                            _flx_nocode_flutter_features_component_screen_widgets_component_dropdown_widgetbook
                                .mockComponentDropdownDesign,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'data_table',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'screen',
            children: [
              _widgetbook.WidgetbookFolder(
                name: 'widgets',
                children: [
                  _widgetbook.WidgetbookComponent(
                    name: 'MenuDataTableCustom',
                    useCases: [
                      _widgetbook.WidgetbookUseCase(
                        name: 'From JSON (Users)',
                        builder:
                            _flx_nocode_flutter_features_data_table_screen_widgets_entity_data_table_widgetbook
                                .buildMenuDataTableCustomFromJsonUseCase,
                      )
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'entity',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'screen',
            children: [
              _widgetbook.WidgetbookFolder(
                name: 'pages',
                children: [
                  _widgetbook.WidgetbookComponent(
                    name: 'EntityViewPage',
                    useCases: [
                      _widgetbook.WidgetbookUseCase(
                        name: 'Default',
                        builder:
                            _flx_nocode_flutter_features_entity_screen_pages_enitity_view_page_widgetbook
                                .buildEntityViewPageUseCase,
                      )
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'view',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'models',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'DView',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Large Button',
                    builder:
                        _flx_nocode_flutter_features_view_screen_widgets_view_widgetbook
                            .buildDViewButtonLargeUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Loading',
                    builder:
                        _flx_nocode_flutter_features_view_screen_widgets_view_widgetbook
                            .buildDViewButtonLoadingUseCase,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'widgets',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'Column',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Interactive Table Form',
            builder:
                _flx_nocode_flutter_features_layout_form_screen_widgets_layout_form_widgetbook
                    .interactiveTableFormUseCase,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Multi-Step Wizard',
            builder:
                _flx_nocode_flutter_features_layout_form_screen_widgets_layout_form_widgetbook
                    .wizardLayoutFormUseCase,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Simple Form (From JSON)',
            builder:
                _flx_nocode_flutter_features_layout_form_screen_widgets_layout_form_widgetbook
                    .simpleLayoutFormUseCase,
          ),
        ],
      )
    ],
  ),
];
