import 'package:flexurio_chiron_accounting/src/app/bloc/budget_type/budget_type_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/budget_type.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/budget_type_department_type.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/budget_type_usage_type.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class BudgetTypeCreatePage extends StatefulWidget {
  const BudgetTypeCreatePage._({required this.parents, this.budgetType});
  final List<BudgetType> parents;
  final BudgetType? budgetType;

  static Widget prepare({
    required List<BudgetType> parents,
    BudgetType? budgetType,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BudgetTypeBloc()),
      ],
      child: BudgetTypeCreatePage._(
        parents: parents,
        budgetType: budgetType,
      ),
    );
  }

  @override
  State<BudgetTypeCreatePage> createState() => _BudgetTypeCreatePageState();
}

class _BudgetTypeCreatePageState extends State<BudgetTypeCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  BudgetTypeUsageType? _usageType;
  BudgetTypeDepartmentType? _departmentType;
  late int _level;
  late int _parent;

  @override
  void initState() {
    if (widget.budgetType != null) {
      _nameController.text = widget.budgetType!.name;
    } else {
      if (widget.parents.isEmpty) {
        _level = 1;
        _parent = 1;
      } else if (widget.parents.length == 1) {
        _level = 2;
        _parent = widget.parents.last.id;
      } else {
        _level = 3;
        _parent = widget.parents.last.id;
      }
    }
    super.initState();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (widget.budgetType != null) {
        context.read<BudgetTypeBloc>().add(
              BudgetTypeEvent.edit(
                id: widget.budgetType!.id,
                name: _nameController.text,
              ),
            );
      } else {
        context.read<BudgetTypeBloc>().add(
              BudgetTypeEvent.create(
                name: _nameController.text,
                level: _level,
                usageType: _usageType ?? BudgetTypeUsageType.unset,
                departmentType:
                    _departmentType ?? BudgetTypeDepartmentType.unset,
                parent: _parent,
              ),
            );
      }
    }
  }

  String getTitle() {
    final buffer = StringBuffer();
    for (final parent in widget.parents) {
      if (parent != widget.parents.last) {
        buffer.write('${parent.name} / ');
      } else {
        buffer.write(parent.name);
      }
    }
    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    final action =
        widget.budgetType != null ? DataAction.edit : DataAction.create;
    final entity = Entity.budgetType;
    return BlocListener<BudgetTypeBloc, BudgetTypeState>(
      listener: (_, state) {
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
          formKey: _formKey,
          action: action,
          entity: entity,
          actions: [
            BlocBuilder<BudgetTypeBloc, BudgetTypeState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  onPressed: _submit,
                  action: action,
                );
              },
            ),
          ],
          children: [
            Builder(
              builder: (context) {
                if (widget.parents.isNotEmpty) {
                  return Column(
                    children: [
                      Text(
                        getTitle(),
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 22),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            FTextFormField(
              labelText: 'Name',
              controller: _nameController,
              validator: requiredValidator.call,
              maxLength: 500,
              inputFormatters: _level == 3
                  ? [FilteringTextInputFormatter.allow(RegExp('[0-9]'))]
                  : null,
            ),
            Builder(
              builder: (context) {
                if (widget.parents.isNotEmpty) {
                  if (widget.parents.length >= 2 && widget.budgetType == null) {
                    return Column(
                      children: [
                        const Gap(12),
                        FDropDownSearchBudgetTypeUsageType(
                          onChanged: (value) {
                            if (value != null) {
                              _usageType = value;
                            }
                          },
                          initialValue: _usageType,
                        ),
                        const Gap(12),
                        FDropDownSearchBudgetTypeDepartmentType(
                          onChanged: (value) {
                            if (value != null) {
                              _departmentType = value;
                            }
                          },
                          initialValue: _departmentType,
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
