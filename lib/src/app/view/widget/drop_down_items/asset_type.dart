import 'package:flexurio_chiron_accounting/src/app/bloc/asset_type_query/asset_type_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_type.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchAssetType extends StatelessWidget
    implements DropDownObject<AssetType> {
  const FDropDownSearchAssetType({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final AssetType? initialValue;

  @override
  final void Function(AssetType?) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(AssetType?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<AssetTypeQueryBloc, AssetTypeQueryState>(
      builder: (context, state) {
        return FDropDownSearch<AssetType>(
          enabled: enabled,
          labelText: label ?? Entity.assetType.title,
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
            loaded: (assetType) => assetType.data,
          ),
          itemAsString: (assetType) => assetType.name,
        );
      },
    );
  }
}
