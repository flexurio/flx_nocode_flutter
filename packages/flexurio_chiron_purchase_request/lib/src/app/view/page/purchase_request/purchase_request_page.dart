import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_query/material_request_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/purchase_request/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PurchaseRequestPage extends StatefulWidget {
  const PurchaseRequestPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => PurchaseRequestQueryBloc())],
      child: const PurchaseRequestPage._(),
    );
  }

  @override
  State<PurchaseRequestPage> createState() => _PurchaseRequestPageState();
}

class _PurchaseRequestPageState extends State<PurchaseRequestPage> {
  @override
  void initState() {
    super.initState();

    final department = UserRepositoryApp.instance.department;
    final isDepartmentProcurement = department?.id == 'PC';

    context.read<PurchaseRequestQueryBloc>().add(
          PurchaseRequestQueryEvent.fetch(
            status: PurchaseRequestStatus.input,
            departments: isDepartmentProcurement
                ? null
                : UserRepositoryApp.instance.departments,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.purchaseRequest),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const PurchaseRequestDataTable(),
        ),
      ],
    );
  }
}
