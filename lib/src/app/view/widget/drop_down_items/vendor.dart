import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchVendor extends StatelessWidget
    implements DropDownObject<Vendor> {
  const FDropDownSearchVendor({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final Vendor? initialValue;

  @override
  final void Function(Vendor?) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(Vendor?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<VendorQueryBloc, VendorQueryState>(
      builder: (context, state) {
        return FDropDownSearch<Vendor>(
          enabled: enabled,
          labelText: label ?? Entity.vendor.title,
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
            loaded: (vendor) => vendor.data,
          ),
          itemAsString: (vendor) => vendor.name,
        );
      },
    );
  }

  @override
  // TODO: implement small
  bool get small => throw UnimplementedError();
}
