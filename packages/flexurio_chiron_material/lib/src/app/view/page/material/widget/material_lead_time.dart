import 'package:flexurio_chiron_vendor/src/app/bloc/material_supplier/material_supplier_bloc.dart';
import 'package:flexurio_chiron_vendor/src/app/bloc/material_supplier_query/material_supplier_query_bloc.dart';
import 'package:flexurio_chiron_vendor/src/app/model/material_supplier_leadtime.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_material/src/app/view/page/material/widget/material_supplier_toggle.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialLeadTime extends StatefulWidget {
  const MaterialLeadTime._({required this.material});

  static Widget prepare({required model.Material material}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MaterialSupplierQueryBloc()
            ..add(
              MaterialSupplierQueryEvent.getByMaterialId(material: material),
            ),
        ),
        BlocProvider(create: (_) => MaterialSupplierBloc()),
      ],
      child: MaterialLeadTime._(material: material),
    );
  }

  final model.Material material;

  @override
  State<MaterialLeadTime> createState() => _MaterialLeadTimeState();
}

class _MaterialLeadTimeState extends State<MaterialLeadTime> {
  var _search = '';
  var _searching = false;
  final _focus = FocusNode();
  final _controller = TextEditingController();
  final vendorTextControllers = <TextEditingController>[];

  @override
  void initState() {
    super.initState();
    _focus.addListener(() {
      if (_focus.hasFocus) {
        setState(() {
          _searching = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<MaterialSupplierQueryBloc, MaterialSupplierQueryState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loaded: (vendors, leadtimes) {
                vendorTextControllers.clear();
                setState(() {
                  _searching = false;
                  for (var i = 0; i < leadtimes.length; i++) {
                    vendorTextControllers.add(
                      TextEditingController(
                        text: leadtimes[i].leadTime.toString(),
                      ),
                    );
                  }
                });
              },
            );
          },
        ),
        BlocListener<MaterialSupplierBloc, MaterialSupplierState>(
          listener: (context, state) {
            final materialSupplierQueryBloc =
                context.read<MaterialSupplierQueryBloc>();
            state.maybeWhen(
              success: (action) {
                if (action == DataAction.create) {
                  materialSupplierQueryBloc.add(
                    MaterialSupplierQueryEvent.getByMaterialId(
                      material: widget.material,
                    ),
                  );
                  Toast(context).dataChanged(action, Entity.leadTime);
                }
                if (action == DataAction.delete) {
                  materialSupplierQueryBloc.add(
                    MaterialSupplierQueryEvent.getByMaterialId(
                      material: widget.material,
                    ),
                  );
                  Toast(context).dataChanged(action, Entity.leadTime);
                }
                if (action == DataAction.update) {
                  materialSupplierQueryBloc.add(
                    MaterialSupplierQueryEvent.getByMaterialId(
                      material: widget.material,
                    ),
                  );
                  Toast(context).dataChanged(action, Entity.leadTime);
                }
              },
              error: (value) {
                materialSupplierQueryBloc.add(
                  MaterialSupplierQueryEvent.getByMaterialId(
                    material: widget.material,
                  ),
                );
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: BlocBuilder<MaterialSupplierQueryBloc, MaterialSupplierQueryState>(
        builder: (context, state) {
          final isLoading = state.maybeWhen(
            orElse: () => false,
            loading: () => true,
          );
          final leadTimes = state.maybeWhen(
            orElse: () => <MaterialSupplierLeadTime>[],
            loaded: (supplier, materialSupplier) => materialSupplier,
          );
          final vendors = state.maybeWhen(
            orElse: () => <Vendor>[],
            loaded: (supplier, materialSupplier) => supplier,
          );
          final vendorSearched = vendors
              .where(
                (item) => item.name.toLowerCase().contains(_search),
              )
              .toList();
          return AbsorbPointer(
            absorbing: state.maybeWhen(
              orElse: () => false,
              loading: () => true,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.material.name} Manufacturer LeadTime',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 24),
                FTextFormField(
                  focusNode: _focus,
                  hintText: 'Add Manufacturer by name',
                  suffixIcon: Visibility(
                    visible: _searching,
                    child: _ClearButton(() {
                      _controller.text = '';
                      _focus.unfocus();
                      setState(() {
                        _searching = false;
                      });
                    }),
                  ),
                  controller: _controller,
                  onChanged: (value) => setState(() => _search = value),
                ),
                const SizedBox(height: 24),
                Text(
                  '${_focus.hasFocus ? 'All ' : ''}Producers',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: isLoading
                      ? const Center(
                          child: CupertinoActivityIndicator(),
                        )
                      : ListView(
                          children: [
                            ...List.generate(
                              leadTimes.length,
                              (index) => SupplierMaterialToggle(
                                vendor: leadTimes[index].vendor,
                                visible: !_searching,
                                leadTimeController:
                                    vendorTextControllers[index],
                                onLeadTimeCreate: null,
                                onLeadTimeDelete: () {
                                  context.read<MaterialSupplierBloc>().add(
                                        MaterialSupplierEvent.delete(
                                          materialSupplierLeadTime:
                                              leadTimes[index],
                                        ),
                                      );
                                },
                              ),
                            ),
                            ...List.generate(
                              vendorSearched.length,
                              (index) => SupplierMaterialToggle(
                                vendor: vendorSearched[index],
                                visible: _searching,
                                leadTimeController: null,
                                onLeadTimeCreate: (leadTime) {
                                  context.read<MaterialSupplierBloc>().add(
                                        MaterialSupplierEvent.create(
                                          leadTimePurch: leadTime,
                                          materialId: widget.material.id,
                                          supplierId: vendorSearched[index].id,
                                        ),
                                      );
                                },
                                onLeadTimeDelete: null,
                              ),
                            ),
                          ],
                        ),
                ),
                const SizedBox(height: 15),
                BlocBuilder<MaterialSupplierQueryBloc,
                    MaterialSupplierQueryState>(
                  builder: (context, lState) {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 125,
                        child: BlocBuilder<MaterialSupplierBloc,
                            MaterialSupplierState>(
                          builder: (context, state) {
                            final isLoading = state.maybeWhen(
                              orElse: () => false,
                              loading: () => true,
                            );

                            final isVisible = lState.maybeWhen(
                              orElse: () => false,
                              loaded: (supplier, leadtimes) =>
                                  leadtimes.isNotEmpty,
                              loading: () => true,
                            );
                            return Visibility(
                              visible: isVisible,
                              child: Button(
                                isInProgress: isLoading,
                                action: DataAction.add,
                                permission: null,
                                onPressed: () {
                                  final leadTimePurchs = vendorTextControllers
                                      .map((c) => int.parse(c.text))
                                      .toList();
                                  final materialSupplierLeadTimes =
                                      lState.maybeWhen(
                                    orElse: () => <MaterialSupplierLeadTime>[],
                                    loaded: (supplier, leadTimes) => leadTimes,
                                  );
                                  context.read<MaterialSupplierBloc>().add(
                                        MaterialSupplierEvent.updateBatch(
                                          materialSupplierLeadTimes:
                                              materialSupplierLeadTimes,
                                          leadTimePurchs: leadTimePurchs,
                                          materialId: widget.material.id,
                                        ),
                                      );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ClearButton extends StatelessWidget {
  const _ClearButton(this.onPressed);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onTap: onPressed,
        child: CircleAvatar(
          foregroundColor: Colors.white,
          backgroundColor: theme.colorScheme.primary,
          radius: 12,
          child: const Icon(
            Icons.close,
            size: 16,
          ),
        ),
      ),
    );
  }
}
