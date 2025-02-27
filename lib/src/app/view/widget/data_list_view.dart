import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class DataListView<T> extends StatefulWidget {
  const DataListView({
    super.key,
    required this.status,
    required this.pageOptions,
    required this.builder,
  });

  final Status status;
  final PageOptions<T> pageOptions;
  final Widget Function(T data) builder;

  @override
  State<DataListView<T>> createState() => _DataListViewState<T>();
}

class _DataListViewState<T> extends State<DataListView<T>> {
  @override
  Widget build(BuildContext context) {
    if (widget.status.isProgress) {
      return const Center(child: CircularProgressIndicator());
    } else if (widget.status.isError) {
      return Center(child: Text('Error: ${widget.status}'));
    } else {
      return Column(
        children: widget.pageOptions.data.map(widget.builder).toList(),
      );
    }
  }
}

class ListTileItem extends StatelessWidget {
  const ListTileItem(
      {super.key, required this.title, this.subtitle, this.trailing});

  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: title,
        subtitle: subtitle,
        trailing: trailing,
      ),
    );
  }
}
