import 'package:flexurio_chiron_vendor/src/app/bloc/material_supplier/material_supplier_bloc.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupplierMaterialToggle extends StatefulWidget {
  const SupplierMaterialToggle({
    required this.vendor,
    required this.leadTimeController,
    required this.onLeadTimeCreate,
    required this.onLeadTimeDelete,
    required this.visible,
    super.key,
  });

  final Vendor vendor;
  final TextEditingController? leadTimeController;
  final void Function(int leadTime)? onLeadTimeCreate;
  final void Function()? onLeadTimeDelete;
  final bool visible;

  @override
  State<SupplierMaterialToggle> createState() => _SupplierMaterialToggleState();
}

class _SupplierMaterialToggleState extends State<SupplierMaterialToggle> {
  late bool _selected;
  final defaultLeadTimeDays = 10;

  @override
  void initState() {
    super.initState();
    _selected = widget.leadTimeController != null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Visibility(
      visible: widget.visible,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.vendor.name,
                maxLines: 1,
              ),
            ),
            const SizedBox(width: 12),
            BlocBuilder<MaterialSupplierBloc, MaterialSupplierState>(
              builder: (context, state) {
                return Opacity(
                  opacity: state.maybeWhen(
                    loading: () => .5,
                    orElse: () => 1,
                  ),
                  child: AbsorbPointer(
                    absorbing: state.maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    ),
                    child: SizedBox(
                      height: 70,
                      child: Row(
                        children: [
                          CupertinoSwitch(
                            activeColor: theme.colorScheme.primary,
                            value: _selected,
                            onChanged: (value) {
                              setState(() {
                                _selected = value;
                              });
                              if (_selected) {
                                widget.onLeadTimeCreate
                                    ?.call(defaultLeadTimeDays);
                              } else {
                                widget.onLeadTimeDelete?.call();
                              }
                            },
                          ),
                          const SizedBox(width: 20),
                          SizedBox(
                            width: 108,
                            child: Visibility(
                              visible: _selected,
                              child: FTextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                hintText: '10',
                                controller: widget.leadTimeController,
                                // maxLength: 2,
                                suffixIcon: SizedBox(
                                  width: 62.5,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Day',
                                      style: TextStyle(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
