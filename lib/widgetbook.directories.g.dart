// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_dropdown.widgetbook.dart'
    as _flx_nocode_flutter_features_component_screen_widgets_component_dropdown_widgetbook;
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_table.widgetbook.dart'
    as _flx_nocode_flutter_features_component_screen_widgets_component_table_widgetbook;
import 'package:flx_nocode_flutter/features/data_table/screen/widgets/entity_data_table.widgetbook.dart'
    as _flx_nocode_flutter_features_data_table_screen_widgets_entity_data_table_widgetbook;
import 'package:flx_nocode_flutter/features/entity/screen/pages/enitity_view_page.widgetbook.dart'
    as _flx_nocode_flutter_features_entity_screen_pages_enitity_view_page_widgetbook;
import 'package:flx_nocode_flutter/features/view/screen/widgets/view.widgetbook.dart'
    as _flx_nocode_flutter_features_view_screen_widgets_view_widgetbook;
import 'package:flx_nocode_flutter/src/app/view/widget/entity_home.widgetbook.dart'
    as _flx_nocode_flutter_src_app_view_widget_entity_home_widgetbook;
import 'package:flx_nocode_flutter/src/app/view/widget/no_code_navigate_push_menu.widgetbook.dart'
    as _flx_nocode_flutter_src_app_view_widget_no_code_navigate_push_menu_widgetbook;
import 'package:widgetbook/widgetbook.dart' as _widgetbook;

final directories = <_widgetbook.WidgetbookNode>[
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
              )
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
];
