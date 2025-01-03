import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_type_query/transaction_type_query_bloc.dart';

class MaterialReturnCreatePage extends StatefulWidget {
  const MaterialReturnCreatePage._({required this.isExternal});

  final bool isExternal;

  static Route<bool?> route({required bool isExternal}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MaterialReturnBloc()),
          BlocProvider(create: (context) => MaterialReturnDetailQueryBloc()),
          BlocProvider(create: (context) => MaterialGroupQueryBloc()),
          BlocProvider(create: (context) => TransactionTypeQueryBloc()),
          BlocProvider(create: (context) => DepartmentQueryBloc()),
        ],
        child: MaterialReturnCreatePage._(
          isExternal: isExternal,
        ),
      ),
    );
  }

  @override
  State<MaterialReturnCreatePage> createState() =>
      _MaterialReturnCreatePageState();
}

class _MaterialReturnCreatePageState extends State<MaterialReturnCreatePage> {
  MaterialReturnType? materialReturnType;

  var _page = 0;
  void _nextPage() => setState(() => ++_page);
  void _previousPage() => setState(() => --_page);

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    final entity = Entity.materialReturn;

    return BlocListener<MaterialReturnBloc, MaterialReturnState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (error) => Toast(context).fail(error),
          success: () {
            Toast(context).dataChanged(action, entity);
            Navigator.pop(context, true);
          },
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          action: action,
          entity: entity,
          size: SingleFormPanelSize.large,
          children: [
            MultiForm(
              page: _page,
              titles: [
                'type'.tr(),
                'group'.tr(),
                'material'.tr(),
                'review'.tr(),
              ],
              children: [
                MaterialReturnCreateTypeForm(
                  onNext: () {
                    setState(() {
                      if (materialReturnType!.title ==
                          MaterialReturnType.returnX.title) {
                        context.read<MaterialGroupQueryBloc>()
                          ..add(MaterialGroupQueryEvent.fetch(
                            pageOptions: PageOptions.emptyNoLimit(),
                          ));
                        context.read<TransactionTypeQueryBloc>()
                          ..add(
                            TransactionTypeQueryEvent.fetch(
                              flag: 'Modul',
                              value: 'MaterialInKembali',
                              name: '',
                              pageOptions: PageOptions.emptyNoLimit(),
                            ),
                          );
                      }
                      if (materialReturnType!.title !=
                          MaterialReturnType.returnX.title) {
                        context.read<MaterialGroupQueryBloc>()
                          ..add(MaterialGroupQueryEvent.fetch(
                            pageOptions: PageOptions.emptyNoLimit(),
                          ));
                        context.read<TransactionTypeQueryBloc>()
                          ..add(
                            TransactionTypeQueryEvent.fetch(
                              flag: 'Adjustment Material',
                              value: 'Add',
                              name: '',
                              type: 'MATERIAL RETURN',
                              pageOptions: PageOptions.emptyNoLimit(),
                            ),
                          );
                      }
                      context.read<DepartmentQueryBloc>()
                        ..add(
                          DepartmentQueryEvent.fetch(
                            pageOptions: PageOptions.emptyNoLimit(),
                          ),
                        );
                    });
                    return _nextPage();
                  },
                  materialReturnType: materialReturnType,
                  onDropDownChanged: (type) {
                    materialReturnType = type;
                  },
                ),
                MaterialReturnCreateProductForm(
                  materialReturnType: materialReturnType,
                  onPrevious: _previousPage,
                  onNext: () {
                    return _nextPage();
                  },
                ),
                MaterialReturnCreateMaterialForm(
                  materialReturnType: materialReturnType,
                  onPrevious: _previousPage,
                  onNext: _nextPage,
                  action: action,
                  isExternal: widget.isExternal,
                ),
                MaterialReturnCreateReviewForm(
                  materialReturnType: materialReturnType,
                  onPrevious: _previousPage,
                  action: action,
                  isExternal: widget.isExternal,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
