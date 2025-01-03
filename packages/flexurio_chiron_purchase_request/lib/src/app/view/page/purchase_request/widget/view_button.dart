import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_query/material_request_detail_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_query/material_request_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/material_request_detail.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/material_request_view/material_request_view_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class ViewButton extends StatefulWidget {
  const ViewButton({
    required this.materialRequest,
    super.key,
  });
  static Widget prepare({required MaterialRequest materialRequest}) {
    return BlocProvider<MaterialRequestDetailQueryBloc>(
      create: (context) => MaterialRequestDetailQueryBloc(),
      child: ViewButton(materialRequest: materialRequest),
    );
  }

  final MaterialRequest materialRequest;

  @override
  State<ViewButton> createState() => ViewButtonState();
}

class ViewButtonState extends State<ViewButton> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MaterialRequestDetailQueryBloc>();
    final department = UserRepositoryApp.instance.department;
    final isDepartmentProcurement = department?.id == 'PC';
    final theme = Theme.of(context);
    return MouseRegion(
      onEnter: (event) {
        bloc.add(
          MaterialRequestDetailQueryEvent.fetch(
            materialRequest: widget.materialRequest,
          ),
        );
      },
      child: JustTheTooltip(
        controller: JustTheController(),
        backgroundColor:
            theme.modeCondition(MyTheme.black02dp, MyTheme.black01dp),
        preferredDirection: AxisDirection.left,
        tailLength: 10,
        tailBaseWidth: 12,
        content: Padding(
          padding: const EdgeInsets.all(12),
          child: SizedBox(
            width: 260,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<MaterialRequestDetailQueryBloc,
                    MaterialRequestDetailQueryState>(
                  bloc: bloc,
                  builder: (context, state) {
                    final details = state.maybeWhen(
                      orElse: () => <PurchaseRequestDetail>[],
                      loaded: (materialRequest) => materialRequest,
                    );
                    final isError = state.maybeWhen(
                      orElse: () => false,
                      error: (_) => true,
                    );
                    final isLoading = state.maybeWhen(
                      orElse: () => false,
                      loading: () => true,
                    );
                    if (isError) {
                      return SomethingWrong();
                    }
                    if (isLoading) {
                      return CupertinoActivityIndicator();
                    }
                    return Column(
                      children: details.map((detail) {
                        return TileDataHorizontal(
                          valueWidth: 70,
                          label: detail.itemName,
                          child: Text(detail.quantity.toString()),
                          inverseColor: true,
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        child: IconButtonSmall(
          permission: null,
          tooltipMessage: '',
          action: DataAction.view,
          onPressed: () async {
            final queryBloc = context.read<PurchaseRequestQueryBloc>();
            final success = await Navigator.push(
              context,
              MaterialRequestViewPage.route(
                materialRequest: widget.materialRequest,
              ),
            );
            if (success ?? false) {
              queryBloc.add(
                PurchaseRequestQueryEvent.fetch(
                  departments: isDepartmentProcurement ? null : [],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
