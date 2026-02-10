import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/field/domain/extensions/entity_field_extensions.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class InlineFilter extends StatefulWidget {
  const InlineFilter({
    super.key,
    required this.field,
    this.initialValue,
    required this.onChanged,
    this.config = const {},
  });

  final EntityField field;
  final String? initialValue;
  final ValueChanged<String?> onChanged;
  final Map<String, dynamic> config;

  @override
  State<InlineFilter> createState() => _InlineFilterState();
}

class _InlineFilterState extends State<InlineFilter> {
  final _controller = TextEditingController();
  Timer? _debounce;
  PickerDateRange? _selectedDateRange;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _parseInitialValue();
  }

  @override
  void didUpdateWidget(covariant InlineFilter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue ||
        widget.config['mode'] != oldWidget.config['mode']) {
      _parseInitialValue();
    }
  }

  void _parseInitialValue() {
    if (widget.initialValue == null) {
      _selectedDateRange = null;
      _selectedDate = null;
      _controller.clear();
      return;
    }

    final val = widget.initialValue!;
    _controller.text = val;

    if (widget.field.isDateTime || widget.field.type == 'date') {
      try {
        final mode = widget.config['mode'] ?? 'date_range';

        if (val.startsWith('__range__')) {
          final rangeContent = val.replaceFirst('__range__', '');
          final parts = rangeContent.split('|');
          if (parts.length == 2) {
            final start = DateTime.tryParse(parts[0].split(' ')[0]);
            final end = DateTime.tryParse(parts[1].split(' ')[0]);
            if (mode == 'date_range') {
              _selectedDateRange = PickerDateRange(start, end);
            } else {
              _selectedDate = start;
            }
          }
        } else {
          // Legacy or fallback format
          if (mode == 'date_range') {
            if (val.contains(':')) {
              final split = val.split(':');
              _selectedDateRange = PickerDateRange(
                DateTime.tryParse(split[0]),
                DateTime.tryParse(split[1]),
              );
            } else {
              final date = DateTime.tryParse(val);
              _selectedDateRange = PickerDateRange(date, date);
            }
          } else if (mode == 'year_month') {
            _selectedDate = DateTime.tryParse('$val-01');
          } else if (mode == 'year') {
            _selectedDate = DateTime(int.tryParse(val) ?? DateTime.now().year);
          } else {
            _selectedDate = DateTime.tryParse(val);
          }
        }
      } catch (_) {
        _selectedDate = null;
        _selectedDateRange = null;
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.onChanged(query.isEmpty ? null : query);
    });
  }

  void _onDateRangeChanged(PickerDateRange range) {
    setState(() {
      _selectedDateRange = range;
    });

    if (range.startDate == null) {
      widget.onChanged(null);
      return;
    }

    final start = DateFormat('yyyy-MM-dd').format(range.startDate!);
    final end = range.endDate != null
        ? DateFormat('yyyy-MM-dd').format(range.endDate!)
        : start;

    widget.onChanged('__range__$start 00:00:00|$end 23:59:59');
  }

  void _onDateChanged(DateTime? date, String format) {
    setState(() {
      _selectedDate = date;
    });
    if (date == null) {
      widget.onChanged(null);
    } else {
      try {
        final val = DateFormat(format).format(date);
        if (format == 'yyyy-MM-dd') {
          widget.onChanged('__range__$val 00:00:00|$val 23:59:59');
        } else {
          widget.onChanged(val);
        }
      } catch (e) {
        widget.onChanged(date.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: theme.dividerColor),
      borderRadius: BorderRadius.circular(8),
    );

    // Handle Date Type
    if (widget.field.isDateTime || widget.field.type == 'date') {
      final mode = widget.config['mode'] ?? 'date_range';

      if (mode == 'date_range') {
        return DropDownSmallDateRange(
          labelText: widget.field.label,
          onChanged: _onDateRangeChanged,
          initialValue: _selectedDateRange,
        );
      } else if (mode == 'year_month') {
        return DropDownSmallYearMonth(
          labelText: widget.field.label,
          initialValue: _selectedDate,
          onChanged: (date) => _onDateChanged(date, 'yyyy-MM'),
        );
      } else if (mode == 'year') {
        return DropDownSmallYearPicker(
          labelText: widget.field.label,
          initialValue: _selectedDate?.year,
          onChanged: (year) => _onDateChanged(DateTime(year), 'yyyy'),
        );
      } else {
        // Single date
        return DropDownSmallDate(
          labelText: widget.field.label,
          initialValue: _selectedDate,
          onChanged: (date) => _onDateChanged(date, 'yyyy-MM-dd'),
        );
      }
    }

    // Default Text Input
    return SizedBox(
      height: 40,
      width: 200,
      child: TextField(
        controller: _controller,
        onChanged: _onSearchChanged,
        style: theme.textTheme.bodyMedium,
        decoration: InputDecoration(
          hintText: widget.field.label,
          hintStyle: theme.textTheme.bodyMedium?.copyWith(
            color: theme.hintColor,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 0,
          ),
          border: border,
          enabledBorder: border,
          focusedBorder: border.copyWith(
            borderSide: BorderSide(color: theme.primaryColor),
          ),
          prefixIcon: Icon(
            widget.field.icon,
            size: 18,
            color: theme.hintColor,
          ),
          filled: true,
          fillColor: theme.cardColor,
        ),
      ),
    );
  }
}
