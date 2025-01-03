import 'package:flexurio_chiron_accounting/src/app/bloc/budget_type_query/budget_type_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/budget_type.dart';
import 'package:appointment/src/app/util/generate_hierarchy.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/budget_type/widget/delete_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/budget_type/widget/edit_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/budget_type/widget/new_type_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BudgetTypeDataTable extends StatefulWidget {
  const BudgetTypeDataTable._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              BudgetTypeQueryBloc()..add(const BudgetTypeQueryEvent.fetch()),
        ),
      ],
      child: const BudgetTypeDataTable._(),
    );
  }

  @override
  State<BudgetTypeDataTable> createState() => _BudgetTypeDataTableState();
}

class _BudgetTypeDataTableState extends State<BudgetTypeDataTable> {
  final borderSide = BorderSide(color: Colors.grey.shade200);
  final scrollController = ScrollController();
  final budgetTypeGradeVisibility = <BudgetType>[];
  final parentIdLastIndex = <int>[];
  final entity = Entity.budgetType;
  ValueKey<String>? key;

  @override
  Widget build(BuildContext context) {
    const stickyLegendWidth = 420.0;
    const stickyLegendHeight = 50.0;
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final bloc = context.read<BudgetTypeQueryBloc>();
    Padding buildTableTitle(bool isError, bool isLoading) {
      return Padding(
        padding: const EdgeInsets.only(
          left: paddingHorizontalPage,
          bottom: 24,
        ),
        child: Row(
          children: [
            Text(
              entity.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 50,
              child: Center(
                child: isLoading
                    ? const CupertinoActivityIndicator()
                    : IconButton(
                        onPressed: () {
                          parentIdLastIndex.clear();
                          context
                              .read<BudgetTypeQueryBloc>()
                              .add(const BudgetTypeQueryEvent.fetch());
                        },
                        icon: const Icon(Icons.sync),
                        tooltip: 'refresh'.tr(),
                      ),
              ),
            ),
            Offstage(
              offstage: !isError,
              child: const Tooltip(
                message: errorSomethingWentWrong,
                child: Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget buildNameWidget(
      TreeItem<BudgetType> budgetType,
      bool visible,
      bool hasChildren,
      int indentation,
      bool isLastIndex,
    ) {
      final isParentLastIndex =
          parentIdLastIndex.contains(budgetType.item.parent);
      return Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          buildCell(
            indentation: paddingHorizontalPage * indentation,
            value: Row(
              children: [
                if (hasChildren)
                  InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    onTap: () {
                      if (visible) {
                        budgetTypeGradeVisibility.remove(budgetType.item);
                      } else {
                        budgetTypeGradeVisibility.add(budgetType.item);
                      }
                      setState(() {});
                    },
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: visible ? primaryColor : Colors.grey,
                      ),
                      child: Icon(
                        visible
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        color: Colors.white,
                      ),
                    ),
                  )
                else
                  const SizedBox.shrink(),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    budgetType.item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: visible ? primaryColor : null,
                      fontWeight: visible ? FontWeight.bold : null,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          buildPathLine(
            context,
            visible && budgetType.children.isNotEmpty,
            (paddingHorizontalPage * indentation) + 12,
            null,
            2,
            13,
          ),
          buildPathLine(
            context,
            budgetType.item.level == 2 ||
                (budgetType.item.level == 3 && !isParentLastIndex),
            paddingHorizontalPage + 12,
            isLastIndex && budgetType.item.level == 2 ? 25.0 : null,
            2,
            isLastIndex && budgetType.item.level == 2 ? 25 : 50,
          ),
          buildPathLine(
            context,
            budgetType.item.level == 2,
            paddingHorizontalPage + 12,
            25,
            12,
            2,
          ),
          buildPathLine(
            context,
            budgetType.item.level == 3,
            paddingHorizontalPage + 36,
            25,
            16,
            2,
          ),
          buildPathLine(
            context,
            budgetType.item.level == 3,
            (paddingHorizontalPage * (indentation - 1)) + 12,
            isLastIndex && budgetType.item.level == 3 ? 25.0 : null,
            2,
            isLastIndex && budgetType.item.level == 3 ? 25 : 50,
          ),
        ],
      );
    }

    Widget buildType({
      required ColorType type,
    }) {
      final isUnset = [
        BudgetTypeDepartmentType.empty,
        BudgetTypeDepartmentType.unset,
        BudgetTypeUsageType.empty,
        BudgetTypeUsageType.unset,
      ].contains(type);
      return Row(
        children: [
          if (isUnset) const Text('-') else ChipType(type),
        ],
      );
    }

    Widget buildAction({
      required BudgetType budgetType,
      required List<BudgetType> parents,
    }) {
      return Wrap(
        spacing: 5,
        children: [
          BudgetTypeEditButton(
            parents: parents,
            budgetType: budgetType,
          ),
          BudgetTypeDeleteButton.prepare(
            budgetType: budgetType,
            clearParentId: parentIdLastIndex.clear,
          ),
        ],
      );
    }

    Container buildColumnHeader(String title) {
      return Container(
        height: stickyLegendHeight,
        decoration: const BoxDecoration(
          border: Border(),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: paddingHorizontalPage,
          vertical: 12,
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      );
    }

    Widget buildCellValue(
      TreeItem<BudgetType> budgetTypeTree, {
      required List<TreeItem<BudgetType>> raw,
      required Widget? Function(
        TreeItem<BudgetType> budgetType,
        bool visible,
        bool hasChildren,
        int indentation,
        bool isLastIndex,
      ) buildNameValue,
      required Widget Function(TreeItem<BudgetType>, List<BudgetType>)
          buildValue,
      required List<BudgetType> parents,
      required bool isLastIndex,
      int indentation = 1,
      bool isHover = false,
    }) {
      final visible = budgetTypeGradeVisibility.contains(budgetTypeTree.item);
      final nameValue = buildNameValue(
        budgetTypeTree,
        visible,
        !(budgetTypeTree.item.level == 3),
        indentation,
        isLastIndex,
      );
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          nameValue ??
              buildCell(
                value: buildValue(budgetTypeTree, parents),
              ),
          if (visible)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(
                  budgetTypeTree.children.length,
                  (idx) {
                    final child = budgetTypeTree.children.toList()[idx];
                    final isLastIndex = raw.last.item == child.item;
                    if (child.item.level == 2 &&
                        isLastIndex &&
                        !parentIdLastIndex.contains(child.item.id)) {
                      parentIdLastIndex.add(child.item.id);
                    }
                    return buildCellValue(
                      child,
                      buildNameValue: buildNameValue,
                      buildValue: buildValue,
                      indentation: indentation + 1,
                      raw: child.children.toList(),
                      parents: parents + [child.item],
                      isLastIndex: isLastIndex,
                    );
                  },
                ),
                NewTypeButton(
                  key: ValueKey(parents.toString()),
                  onCreate: () {
                    parentIdLastIndex.clear();
                    bloc.add(const BudgetTypeQueryEvent.fetch());
                  },
                  parents: parents,
                  indentation: indentation + 1,
                  isLastIndex: isLastIndex,
                  isNameColumn: nameValue != null,
                  onHover: (value) {
                    if (value) {
                      key = ValueKey(parents.toString());
                      setState(() {});
                    } else {
                      key = null;
                      setState(() {});
                    }
                  },
                  hoverValue: key,
                ),
              ],
            ),
        ],
      );
    }

    Widget buildColumn(
      List<TreeItem<BudgetType>> budgetTypesTree,
      Widget? Function(TreeItem<BudgetType>, bool, bool, int, bool)
          buildNameValue,
      Widget Function(TreeItem<BudgetType>, List<BudgetType>) buildValue,
      String name,
      bool isError,
      bool isLoading,
    ) {
      return SizedBox(
        width: stickyLegendWidth,
        child: Column(
          children: [
            buildColumnHeader(name),
            ...List.generate(
              budgetTypesTree.length,
              (index) => buildCellValue(
                budgetTypesTree[index],
                buildValue: buildValue,
                buildNameValue: buildNameValue,
                parents: [budgetTypesTree[index].item],
                raw: budgetTypesTree[index].children.toList(),
                isLastIndex:
                    budgetTypesTree[index].item == budgetTypesTree.last.item,
              ),
            ),
            if (isError || isLoading)
              buildCell(value: const SizedBox.shrink())
            else
              NewTypeButton(
                key: ValueKey(<BudgetType>[].toString()),
                onCreate: () {
                  parentIdLastIndex.clear();
                  bloc.add(const BudgetTypeQueryEvent.fetch());
                },
                indentation: 1,
                parents: const [],
                isLastIndex: false,
                isNameColumn: name == 'Name',
                onHover: (value) {
                  if (value) {
                    key = ValueKey(<BudgetType>[].toString());
                    setState(() {});
                  } else {
                    key = null;
                    setState(() {});
                  }
                },
                hoverValue: key,
              ),
          ],
        ),
      );
    }

    Widget buildBudgetTypeColumns(
      List<TreeItem<BudgetType>> budgetTypesTree,
      bool isError,
      bool isLoading,
    ) {
      return Row(
        children: [
          buildColumn(
            budgetTypesTree,
            buildNameWidget,
            (p0, p1) => const SizedBox.shrink(),
            'Name',
            isError,
            isLoading,
          ),
          buildColumn(
            budgetTypesTree,
            (p0, p1, p2, p3, p4) => null,
            (tree, parents) => buildType(type: tree.item.usageType),
            'Usage Type',
            isError,
            isLoading,
          ),
          buildColumn(
            budgetTypesTree,
            (p0, p1, p2, p3, p4) => null,
            (tree, parents) => buildType(type: tree.item.departmentType),
            'Department Type',
            isError,
            isLoading,
          ),
          buildColumn(
            budgetTypesTree,
            (p0, p1, p2, p3, p4) => null,
            (tree, parents) => buildAction(
              budgetType: tree.item,
              parents: parents,
            ),
            'Action',
            isError,
            isLoading,
          ),
        ],
      );
    }

    return BlocBuilder<BudgetTypeQueryBloc, BudgetTypeQueryState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          orElse: () => false,
          loading: () => true,
        );
        final isError = state.maybeWhen(
          orElse: () => false,
          error: (m) => true,
        );
        final budgetTypes = state.maybeWhen(
          orElse: () => <BudgetType>[],
          loaded: (budgetType) =>
              budgetType.where((element) => element.id != 1).toList(),
        );
        final budgetTypesTree = generateTree<BudgetType, int>(
          budgetTypes,
          (bt) => bt.id,
          (bt) => bt.parent,
          rootId: 1,
        ).toList();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTableTitle(isError, isLoading),
            Scrollbar(
              controller: scrollController,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: borderSide,
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildBudgetTypeColumns(
                        budgetTypesTree,
                        isError,
                        isLoading,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget buildPathLine(
  BuildContext context,
  bool isVisible,
  double left,
  double? bottom,
  double width,
  double height,
) {
  final theme = Theme.of(context);
  final primaryColor = theme.colorScheme.primary;
  return Visibility(
    visible: isVisible,
    child: Positioned(
      left: left,
      bottom: bottom,
      child: Container(
        width: width,
        height: height,
        color: primaryColor,
      ),
    ),
  );
}

Container buildCell({
  required Widget value,
  bool borderTop = true,
  bool borderBottom = false,
  double? indentation,
  Color? color,
}) {
  const contentCellHeight = 50.0;
  final borderSide = BorderSide(color: Colors.grey.shade200);
  return Container(
    padding: EdgeInsets.only(
      left: indentation ?? paddingHorizontalPage,
      right: 12,
    ),
    alignment: Alignment.centerLeft,
    height: contentCellHeight,
    decoration: BoxDecoration(
      border: Border(
        top: borderTop ? borderSide : BorderSide.none,
      ),
      color: color,
    ),
    child: value,
  );
}
