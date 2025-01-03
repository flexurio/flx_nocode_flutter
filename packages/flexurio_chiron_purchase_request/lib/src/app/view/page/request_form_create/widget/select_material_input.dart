import 'dart:async';

import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail/request_form_detail_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail_temporary/request_form_detail_temporary_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/request_form_detail.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectMaterialItem extends StatefulWidget {
  const SelectMaterialItem._({
    required this.materialRequestDetail,
    required this.queryBloc,
    required this.materialGroup,
  });

  final RequestFormDetail materialRequestDetail;
  final RequestFormDetailTemporaryBloc queryBloc;
  final MaterialGroup materialGroup;

  static Widget prepare({
    required RequestFormDetail materialRequestDetail,
    required RequestFormDetailTemporaryBloc queryBloc,
    required MaterialGroup materialGroup,
  }) {
    return MultiBlocProvider(
      providers: [
        if (materialRequestDetail.materialType == null) 
          BlocProvider(
            create: (context) => MaterialQueryBloc()..add(
              MaterialQueryEvent.fetch(
                materialGroup: materialGroup,
                pageOptions: PageOptions.emptyNoLimit()
              ),
            ),
          ) 
        else 
          BlocProvider(
            create: (context) => MaterialQueryBloc()..add(
              MaterialQueryEvent.fetch(
                materialGroup: materialGroup,
                materialType: materialRequestDetail.materialType,
                pageOptions: PageOptions.emptyNoLimit()
              ),
            ),
          ),
        BlocProvider(
          create: (context) => RequestFormDetailBloc(),
        ),
      ],
      child: SelectMaterialItem._(
        materialRequestDetail: materialRequestDetail,
        queryBloc: queryBloc,
        materialGroup: materialGroup,
      ),
    );
  }

  @override
  State<SelectMaterialItem> createState() => _SelectMaterialItemState();
}

class _SelectMaterialItemState extends State<SelectMaterialItem> {
  @override
  Widget build(BuildContext context) {
    final matarial = widget.materialRequestDetail.material;
    if (matarial != null) {
      return Text(widget.materialRequestDetail.material!.name);
    } else {     
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: 200,
        child: FDropDownSearchMaterial(
          onChanged: (material) {
            if (material != null) {
              setState(() {
                widget.queryBloc.add(
                  RequestFormDetailTemporaryEvent.update(
                    requestFormDetails: widget.materialRequestDetail,
                    material: material,
                  ),
                );
                context.read<RequestFormDetailBloc>().add(
                  RequestFormDetailEvent.update(
                    requestFormDetail: widget.materialRequestDetail,
                    material: material,
                  ),
                );  
                Timer(const Duration(seconds: 5), () {
                  widget.queryBloc.add(
                    const RequestFormDetailTemporaryEvent.fetch(),
                  );
                });
              });
            }
          },
        ),
      );
    }
  }
}
