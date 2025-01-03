import 'package:flexurio_chiron_material_stock/src/app/bloc/material_retest/material_retest_bloc.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material_issue_detail.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class MaterialRetestsCreatePage extends StatefulWidget {
  const MaterialRetestsCreatePage._();

  static Route<bool?> route() {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MaterialRetestBloc()),
          BlocProvider(create: (context) => MaterialQueryBloc()),
          BlocProvider(
              create: (context) => MaterialStockQueryBloc(isExternal: false)),
          BlocProvider(
              create: (context) =>
                  MaterialIssueDetailQueryBloc(isExternal: false)),
          BlocProvider(
              create: (context) => MaterialIssueQueryBloc(isExternal: false)),
          BlocProvider(
            create: (context) => MaterialGroupQueryBloc()
              ..add(MaterialGroupQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              )),
          ),
        ],
        child: const MaterialRetestsCreatePage._(),
      ),
    );
  }

  @override
  State<MaterialRetestsCreatePage> createState() =>
      _MaterialRetestsCreatePageState();
}

class _MaterialRetestsCreatePageState extends State<MaterialRetestsCreatePage> {
  final _formKey = GlobalKey<FormState>();

  MaterialIssue? _materialIssue;
  MaterialIssueDetail? _materialIssueDetail;

  final _quantityRatesController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  final _requiredValidator =
      RequiredValidator(errorText: pleaseFillOutThisField.tr());

  DateTime? _startDate;
  DateTime? _endDate;
  MaterialGroup? _materialGroup;

  void _submit(DateTime expiredDate) {
    if (_formKey.currentState!.validate()) {
      final event = MaterialRetestEvent.create(
        material: _materialIssueDetail!.material,
        materialGroup: _materialGroup!,
        na: _materialIssueDetail!.na,
        expiredDate: expiredDate,
        quantityRetest: stringToInt(_quantityRatesController.text),
        materialIssue: _materialIssue!,
      );
      context.read<MaterialRetestBloc>().add(event);
    }
  }

  void _filterMaterialIssue() {
    if (_materialGroup != null && _startDate != null && _endDate != null) {
      context.read<MaterialIssueQueryBloc>().add(
            MaterialIssueQueryEvent.fetch(
              materialGroup: _materialGroup,
              transactionCode: 'AD',
              pageOptions: PageOptions.emptyNoLimit(),
              startDate: _startDate,
              endDate: _endDate,
            ),
          );
      _materialIssue = null;
      _materialIssue = null;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    return BlocListener<MaterialRetestBloc, MaterialRetestState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () => Navigator.pop(context, true),
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          formKey: _formKey,
          action: action,
          entity: Entity.materialRetest,
          actions: [
            BlocBuilder<MaterialStockQueryBloc, MaterialStockQueryState>(
              builder: (context, state) {
                final expiredDate = state.maybeWhen(
                  orElse: () => null,
                  loaded: (pageOptions) {
                    if (pageOptions.data.isNotEmpty) {
                      return pageOptions.data.first.expiredDate;
                    } else {
                      return null;
                    }
                  },
                );

                return BlocBuilder<MaterialRetestBloc, MaterialRetestState>(
                  builder: (context, state) {
                    return Button(
                      permission: null,
                      isInProgress: state.maybeWhen(
                        loading: () => true,
                        orElse: () => false,
                      ),
                      onPressed: expiredDate == null
                          ? null
                          : () => _submit(expiredDate),
                      action: action,
                    );
                  },
                );
              },
            ),
          ],
          children: [
            _buildMaterialGroup(),
            const Gap(24),
            RowFields(
              children: [
                FieldDatePicker(
                  labelText: 'start_date'.tr(),
                  controller: _startDateController,
                  onChanged: (value) {
                    _startDate = value;
                    _filterMaterialIssue();
                  },
                  validator: requiredObjectValidator.call,
                ),
                FieldDatePicker(
                  labelText: 'end_date'.tr(),
                  controller: _endDateController,
                  onChanged: (value) {
                    _endDate = value;
                    _filterMaterialIssue();
                  },
                  validator: requiredObjectValidator.call,
                ),
              ],
            ),
            const Gap(24),
            _buildMaterialIssue(),
            const Gap(24),
            _buildMaterialIssueDetail(),
            const Gap(24),
            FTextFormField(
              labelText: 'quantity_retest'.tr(),
              controller: _quantityRatesController,
              validator: _requiredValidator.call,
              maxLength: 30,
              inputFormatters: [ThousandsFormatter()],
            ),
            const Gap(24),
            BlocBuilder<MaterialStockQueryBloc, MaterialStockQueryState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loaded: (pageOptions) {
                    if (pageOptions.data.isEmpty) {
                      return _buildMaterialStockNotFound();
                    }
                    return BlockNote(
                      color: Colors.orange,
                      title: 'expired_date'.tr(),
                      subtitle: pageOptions.data.first.expiredDate.yMMMd,
                    );
                  },
                  loading: (_) => BlockNote(
                    color: Colors.orange,
                    title: 'loading'.tr(),
                    subtitle: '',
                  ),
                  orElse: _buildMaterialStockNotFound,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  BlockNote _buildMaterialStockNotFound() {
    return BlockNote(
      color: Colors.red,
      title: 'warning'.tr(),
      subtitle: 'material_stock_not_found'.tr(),
    );
  }

  Widget _buildMaterialIssue() {
    return BlocBuilder<MaterialIssueQueryBloc, MaterialIssueQueryState>(
      builder: (context, state) {
        return FDropDownSearch<MaterialIssue>(
          key: ValueKey(_materialGroup),
          validator: requiredObjectValidator.call,
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: (_) => Status.progress,
            orElse: () => Status.loaded,
          ),
          labelText: 'material_issue'.tr(),
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (material) => material.data,
          ),
          onChanged: (value) {
            _materialIssue = value;
            context.read<MaterialIssueDetailQueryBloc>().add(
                  MaterialIssueDetailQueryEvent.fetch(
                      materialIssue: _materialIssue),
                );
          },
          itemAsString: (material) => material.id,
        );
      },
    );
  }

  Widget _buildMaterialIssueDetail() {
    return FDropDownSearchMaterialIssueDetail(
      key: ValueKey(_materialIssue),
      onChanged: (value) {
        _materialIssueDetail = value;
        context.read<MaterialStockQueryBloc>().add(
              MaterialStockQueryEvent.fetch(na: _materialIssueDetail!.na),
            );
      },
    );
  }

  Widget _buildMaterialGroup() {
    return BlocBuilder<MaterialGroupQueryBloc, MaterialGroupQueryState>(
      builder: (context, state) {
        return FDropDownSearch<MaterialGroup>(
          validator: requiredObjectValidator.call,
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: (_) => Status.progress,
            orElse: () => Status.loaded,
          ),
          labelText: 'material_group'.tr(),
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (material) => material.data,
          ),
          onChanged: (value) {
            _materialGroup = value;
            _filterMaterialIssue();
          },
          itemAsString: (material) => material.id,
        );
      },
    );
  }
}
