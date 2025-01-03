import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_chiron_vendor/src/app/bloc/supplier_query/supplier_query_bloc.dart';
import 'package:flexurio_chiron_vendor/src/app/model/supplier.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchSupplier extends StatelessWidget
    implements DropDownObject<Supplier> {
  const FDropDownSearchSupplier({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final Supplier? initialValue;

  @override
  final void Function(Supplier?) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(Supplier?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<SupplierQueryBloc, SupplierQueryState>(
      builder: (context, state) {
        return FDropDownSearch<Supplier>(
          enabled: enabled,
          labelText: label ?? Entity.supplier.title,
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: (_) => Status.progress,
            orElse: () => Status.loaded,
          ),
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (supplier) => supplier.data,
          ),
          itemAsString: (supplier) => supplier.name,
        );
      },
    );
  }
}

class FDropDownSearchSmallSupplier extends StatelessWidget
    implements DropDownObject<Supplier> {
  const FDropDownSearchSmallSupplier({
    required this.onChanged,
    required this.width,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final Supplier? initialValue;

  @override
  final void Function(Supplier?) onChanged;

  @override
  final String? label;

  @override
  final bool isRequired;

  @override
  final bool enabled;

  final double width;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupplierQueryBloc, SupplierQueryState>(
      builder: (context, state) {
        return FDropDownSearchSmall<Supplier>(
          width: width,
          labelText: label ?? Entity.supplier.title,
          onChanged: onChanged,
          iconField: Icons.business_rounded,
          initialValue: initialValue,
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (supplier) => supplier.data,
          ),
          itemAsString: (supplier) => supplier.name,
        );
      },
    );
  }
}
