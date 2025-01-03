// // ignore_for_file: library_private_types_in_public_api
// ignore_for_file: strict_raw_type, library_private_types_in_public_api

import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:screen_identifier/screen_identifier.dart';

class DTHeadX<T> {
  const DTHeadX({
    required this.label,
    this.sortNum,
    this.sortString,
    this.numeric = false,
  });
  final bool numeric;
  final Widget label;
  final String Function(T)? sortString;
  final num Function(T)? sortNum;

  DataColumn toDataColumn({required void Function(int, bool)? onSort}) {
    return DataColumn(
      onSort: onSort,
      label: label,
      numeric: numeric,
    );
  }
}

class DTSource<T> extends DataTableSource {
  DTSource({
    required this.data,
    required this.columns,
  });
  final List<T> data;
  final List<DTColumnX<T>> columns;

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(
      cells: [for (final column in columns) column.body(data[index])],
    );
  }
}

class DTColumnX<T> {
  DTColumnX({
    required this.head,
    required this.body,
    this.widthFlex = 6,
    this.text,
    this.onTap,
  });
  final DTHeadX<T> head;
  final double widthFlex;

  final DataCell Function(T) body;
  final Widget? text;
  final void Function(T, int)? onTap;
}

class DataTableSet3<T> extends StatefulWidget {
  const DataTableSet3({
    required this.title,
    required this.columns,
    required this.actionRight,
    required this.onRefresh,
    required this.status,
    required this.data,
    required this.search,
    super.key,
    this.actionLeft = const [],
    this.freezeFirstColumn = false,
    this.freezeLastColumn = false,
    this.pagination = false,
  });

  final void Function() onRefresh;
  final String title;
  final List<DTColumnX<T>> columns;
  final List<Widget> Function(Widget refreshButton) actionRight;
  final List<String?> Function(T)? search;
  final List<Widget> actionLeft;
  final Status status;
  final List<T> data;
  final bool freezeFirstColumn;
  final bool freezeLastColumn;
  final bool pagination;

  @override
  _DataTableSet3State<T> createState() => _DataTableSet3State<T>();
}

class _DataTableSet3State<T> extends State<DataTableSet3<T>> {
  int currentPage = 1;
  int rowsPerPage = 10;
  int? sortColumnIndex;
  bool sortAscending = true;
  String searchQuery = '';
  late List<T> _data;
  int? _sortColumnIndex;
  bool _sortAscending = true;

  @override
  void initState() {
    super.initState();
    _data = widget.data;
  }

  void _sort(
    int columnIndex,
    bool ascending,
  ) {
    _sortAscending = ascending;
    _sortColumnIndex = columnIndex;

    final sortStringFunction = widget.columns[columnIndex].head.sortString;
    final sortNumFunction = widget.columns[columnIndex].head.sortNum;

    if (sortStringFunction != null) {
      _data = sortString(widget.data, sortStringFunction, ascending);
    }

    if (sortNumFunction != null) {
      _data = sortNum(widget.data, sortNumFunction, ascending);
    }

    setState(() {});
  }

  void _searchBoxOnChange(String value) {
    setState(() {
      searchQuery = value.toLowerCase();
      _filterData();
    });
  }

  void _filterData() {
    _data = widget.data.where((element) {
      final searchStrings = widget.search!(element);
      return searchStrings
          .any((str) => str != null && str.toLowerCase().contains(searchQuery));
    }).toList();

    if (_sortColumnIndex != null) {
      _sort(_sortColumnIndex!, _sortAscending);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final paginatedData =
        _data.skip((currentPage - 1) * rowsPerPage).take(rowsPerPage).toList();

    return Column(
      children: [
        ScreenIdentifierBuilder(
          builder: (context, screenIdentifier) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(spacing: 12, children: widget.actionLeft),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Wrap(
                      spacing: 12,
                      crossAxisAlignment: WrapCrossAlignment.end,
                      children: widget.actionRight(
                        LightButtonSmall(
                          permission: null,
                          status: widget.status,
                          action: DataAction.refresh,
                          onPressed: widget.onRefresh,
                        ),
                      ),
                    ),
                    const Gap(12),
                    _buildSearchBox(screenIdentifier),
                  ],
                ),
              ],
            );
          },
        ),
        const Gap(24),
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: ColoredBox(
                  color: Colors.white,
                  child: Column(
                    children: [
                      YuhuTable<T>(
                        freezeFirstColumn: widget.freezeFirstColumn,
                        freezeLastColumn: widget.freezeLastColumn,
                        width: widget.columns.fold(
                          0,
                          (value, element) =>
                              (value ?? 0) + element.widthFlex * 25,
                        ),
                        data: paginatedData,
                        rowsPerPage: rowsPerPage,
                        initialSortColumnIndex: sortColumnIndex,
                        initialSortAscending: sortAscending,
                        onSort: (index, ascending) {
                          setState(() {
                            _sort(index, ascending);
                          });
                        },
                        columns: [
                          for (final column in widget.columns)
                            TableColumn<T>(
                              onTap: column.onTap,
                              sortString: column.head.sortString,
                              sortNum: column.head.sortNum,
                              alignment: column.head.numeric
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              width: column.widthFlex * 25,
                              label: column.head.label,
                              builder: (data, _) {
                                return DefaultTextStyle(
                                  style: theme.textTheme.bodyMedium!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  child: column.body(data).child,
                                );
                              },
                            ),
                        ],
                      ),
                      _buildPaginationNumber(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _changePage(int page) {
    setState(() {
      currentPage = page;
    });
  }

  Padding _buildPaginationNumber() {
    final totalPages = (_data.length / rowsPerPage).ceil();
    final startItem = ((currentPage - 1) * rowsPerPage) + 1;
    final endItem = currentPage * rowsPerPage > _data.length
        ? _data.length
        : currentPage * rowsPerPage;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('$startItem - $endItem of ${_data.length}'),
          const Gap(12),
          IconButton(
            onPressed: currentPage > 1
                ? () {
                    _changePage(1);
                  }
                : null,
            icon: const Icon(Icons.first_page, color: Colors.black54),
          ),
          IconButton(
            onPressed: currentPage > 1
                ? () {
                    _changePage(currentPage - 1);
                  }
                : null,
            icon: const Icon(Icons.chevron_left, color: Colors.black54),
          ),
          const Gap(6),
          IconButton(
            onPressed: currentPage < totalPages
                ? () {
                    _changePage(currentPage + 1);
                  }
                : null,
            icon: const Icon(Icons.chevron_right, color: Colors.black54),
          ),
          IconButton(
            onPressed: currentPage < totalPages
                ? () {
                    _changePage(totalPages);
                  }
                : null,
            icon: const Icon(Icons.last_page, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Visibility _buildSearchBox(ScreenIdentifier screenIdentifier) {
    return Visibility(
      visible: screenIdentifier.conditions(sm: false, md: true),
      child: SizedBox(
        width: 300,
        child: _SearchBox(
          onChanged: _searchBoxOnChange,
        ),
      ),
    );
  }
}

class _SearchBox extends StatelessWidget {
  const _SearchBox({
    this.onChanged,
  });
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 45,
      padding: const EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white54,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: TextField(
          onChanged: onChanged,
          style: const TextStyle(fontSize: 12),
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.search, size: 20),
            hintText: '${'type_here_to_search'.tr()}...',
            hintStyle: TextStyle(
              color: theme.textTheme.bodyMedium?.color?.withOpacity(.7),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class TableColumn<T> {
  TableColumn({
    required this.label,
    required this.builder,
    this.onTap,
    this.sortString,
    this.sortNum,
    this.alignment = Alignment.centerLeft,
    this.width,
  });

  final Widget label;
  final Alignment alignment;
  final double? width;
  final String Function(T)? sortString;
  final num Function(T)? sortNum;
  final Widget Function(T, int) builder;
  final void Function(T, int)? onTap;
}

class YuhuTable<T> extends StatefulWidget {
  const YuhuTable({
    required this.data,
    required this.columns,
    this.width,
    this.rowsPerPage,
    super.key,
    this.onSelectChanged,
    this.rowHeight = 48,
    this.status = Status.loaded,
    this.onSort,
    this.initialSortColumnIndex,
    this.initialSortAscending,
    this.freezeFirstColumn = false,
    this.freezeLastColumn = false,
  });

  final int? initialSortColumnIndex;
  final bool? initialSortAscending;
  final void Function(int, bool)? onSort;
  final double rowHeight;
  final Status status;
  final int? rowsPerPage;
  final List<T> data;
  final double? width;
  final void Function(List<T>)? onSelectChanged;
  final bool freezeFirstColumn;
  final bool freezeLastColumn;
  final List<TableColumn<T>> columns;

  @override
  State<YuhuTable<T>> createState() => _YuhuTableState<T>();
}

class _YuhuTableState<T> extends State<YuhuTable<T>> {
  int? _sortColumnIndex;
  bool _sortAscending = true;
  late List<TableColumn<T>> _dataColumn;
  TableColumn<T>? freezeFirstColumn;
  TableColumn<T>? freezeLastColumn;
  final List<T> _selected = [];

  @override
  void initState() {
    super.initState();
    _dataColumn = widget.columns;

    if (widget.freezeFirstColumn) {
      freezeFirstColumn = _dataColumn.first;
      _dataColumn.removeAt(0);
    }

    if (widget.freezeLastColumn) {
      freezeLastColumn = _dataColumn.last;
      _dataColumn.removeLast();
    }

    _sortColumnIndex = widget.initialSortColumnIndex;
    _sortAscending = widget.initialSortAscending ?? true;
  }

  _TableHeader<T> _buildTableHeader(int index, TableColumn<T> column) {
    return _TableHeader(
      column: column,
      onTap: () {
        if (widget.onSort != null) {
          widget.onSort!(
            index,
            _sortColumnIndex == index ? !_sortAscending : true,
          );
        }
        setState(() {
          if (_sortColumnIndex == index) {
            _sortAscending = !_sortAscending;
          } else {
            _sortColumnIndex = index;
            _sortAscending = true;
          }
        });
      },
      ascending: _sortAscending,
      isSort: _sortColumnIndex == index,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final borderSide = BorderSide(
      color: theme.brightness == Brightness.dark
          ? MyTheme.black06dp
          : Colors.grey.shade300,
    );

    final data = widget.data;
    final columnWidths = <int, TableColumnWidth>{};
    for (var i = 0; i < _dataColumn.length; i++) {
      final width = _dataColumn[i].width;
      if (width != null) {
        columnWidths[i] = FixedColumnWidth(width);
      }
    }

    final columns = List.generate(
      _dataColumn.length,
      (index) {
        final column = _dataColumn[index];
        return _buildTableHeader(
          widget.freezeFirstColumn ? index + 1 : index,
          column,
        );
      },
    );
    if (widget.onSelectChanged != null) {
      columnWidths[_dataColumn.length] = const FixedColumnWidth(80);
      columns.add(
        _TableHeader(
          column: TableColumn(
            builder: (p0, p1) {
              return Container();
            },
            label: const Text(''),
          ),
          onTap: () {},
          ascending: _sortAscending,
          isSort: false,
        ),
      );
    }

    final dataBody = List.generate(
      data.length,
      (row) {
        final columns = List.generate(
          _dataColumn.length,
          (column) {
            final cell = _TableData(
              borderSide: borderSide,
              height: widget.rowHeight,
              alignment: _dataColumn[column].alignment,
              child: _dataColumn[column].builder(data[row], row),
            );

            if (_dataColumn[column].onTap != null) {
              return GestureDetector(
                onTap: () {
                  _dataColumn[column].onTap!(data[row], row);
                },
                child: cell,
              );
            }

            return cell;
          },
        );

        if (widget.onSelectChanged != null) {
          final selected = _selected.contains(widget.data[row]);
          columns.add(
            _TableData(
              borderSide: borderSide,
              height: widget.rowHeight,
              alignment: Alignment.center,
              child: Checkbox(
                value: selected,
                onChanged: (value) {
                  if (value != null && value) {
                    _selected.add(data[row]);
                  } else {
                    _selected.remove(data[row]);
                  }

                  setState(() {});
                  widget.onSelectChanged?.call(_selected);
                },
              ),
            ),
          );
        }

        return TableRow(children: columns);
      },
    );

    if (widget.rowsPerPage != null && dataBody.length < widget.rowsPerPage!) {
      dataBody.addAll(
        List.generate(
          widget.rowsPerPage! - dataBody.length,
          (index) => TableRow(
            children: List.generate(
              _dataColumn.length,
              (column) => _TableData(
                borderSide: borderSide,
                height: widget.rowHeight,
                alignment: _dataColumn[column].alignment,
                child: Container(),
              ),
            ),
          ),
        ),
      );
    }

    final boxDecorationHeader = BoxDecoration(
      color: theme.brightness == Brightness.dark
          ? primaryColor.darken(.3)
          : primaryColor.lighten(.5),
    );

    final Widget table = Table(
      columnWidths: columnWidths,
      border: TableBorder(
        verticalInside:
            borderSide.copyWith(color: borderSide.color.withOpacity(.4)),
      ),
      children: [
        TableRow(
          decoration: boxDecorationHeader,
          children: columns,
        ),
        ...dataBody,
      ],
    );

    return Column(
      children: [
        Stack(
          children: [
            Row(
              children: [
                Gap(freezeFirstColumn?.width ?? 0),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final scrollController = ScrollController();
                      final maxWidth = constraints.maxWidth;
                      var width = widget.width ?? maxWidth;
                      if (width < maxWidth) {
                        width = maxWidth;
                      }
                      return Scrollbar(
                        controller: scrollController,
                        interactive: true,
                        thumbVisibility: true,
                        child: SingleChildScrollView(
                          controller: scrollController,
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(width: width, child: table),
                        ),
                      );
                    },
                  ),
                ),
                Gap(freezeLastColumn?.width ?? 0),
              ],
            ),
            if (widget.freezeFirstColumn)
              _buildFreezedColumn(
                boxDecorationHeader,
                data,
                freezeFirstColumn!,
                false,
                theme,
                borderSide,
              ),
            if (widget.freezeLastColumn)
              _buildFreezedColumn(
                boxDecorationHeader,
                data,
                freezeLastColumn!,
                true,
                theme,
                borderSide,
              ),
          ],
        ),
        if (widget.status == Status.progress)
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: CupertinoActivityIndicator(),
          ),
        if (widget.status == Status.error)
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Icon(Icons.error, color: Colors.red),
          ),
      ],
    );
  }

  Widget _buildFreezedColumn(
    BoxDecoration boxDecorationHeader,
    List<T> data,
    TableColumn<T> freezeColumn,
    bool isLast,
    ThemeData theme,
    BorderSide borderSide,
  ) {
    final dataBody = List.generate(
      data.length,
      (row) => TableRow(
        decoration: BoxDecoration(color: theme.cardColor),
        children: [
          _TableData(
            height: widget.rowHeight,
            alignment: freezeColumn.alignment,
            borderSide: borderSide,
            child: freezeColumn.builder(data[row], row),
          ),
        ],
      ),
    );
    if (widget.rowsPerPage != null && dataBody.length < widget.rowsPerPage!) {
      dataBody.addAll(
        List.generate(
          widget.rowsPerPage! - dataBody.length,
          (index) => TableRow(
            decoration: BoxDecoration(color: theme.cardColor),
            children: [
              _TableData(
                height: widget.rowHeight,
                alignment: freezeColumn.alignment,
                borderSide: borderSide,
                child: Container(),
              ),
            ],
          ),
        ),
      );
    }

    return Align(
      alignment: isLast ? Alignment.centerRight : Alignment.centerLeft,
      child: ClipRRect(
        child: Container(
          margin:
              EdgeInsets.only(right: isLast ? 0 : 30, left: isLast ? 30 : 0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: theme.modeCondition(Colors.black12, Colors.black54),
                blurRadius: 5,
                offset: Offset(isLast ? -3 : 3, -2),
              ),
            ],
          ),
          child: Table(
            columnWidths: {
              0: FixedColumnWidth(freezeColumn.width ?? 0),
            },
            children: [
              TableRow(
                decoration: boxDecorationHeader,
                children: [_buildTableHeader(0, freezeColumn)],
              ),
              ...dataBody,
            ],
          ),
        ),
      ),
    );
  }
}

class _TableHeader<T> extends StatelessWidget {
  const _TableHeader({
    required this.column,
    required this.isSort,
    required this.ascending,
    this.onTap,
  });

  final TableColumn<T> column;
  final void Function()? onTap;
  final bool isSort;
  final bool ascending;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Align(
          alignment: column.alignment,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              column.label,
              if (isSort)
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Icon(
                    ascending ? Icons.arrow_upward : Icons.arrow_downward,
                    size: 16,
                    color: primaryColor.withOpacity(.5),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TableData extends StatelessWidget {
  const _TableData({
    required this.child,
    required this.height,
    required this.alignment,
    required this.borderSide,
  });

  final Widget child;
  final double height;
  final Alignment alignment;
  final BorderSide borderSide;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border(
          bottom: borderSide,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Align(
        alignment: alignment,
        child: child,
      ),
    );
  }
}
