import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_query/material_request_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RequestFormPage extends StatefulWidget {
  const RequestFormPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PurchaseRequestQueryBloc()),
      ],
      child: const RequestFormPage._(),
    );
  }

  @override
  State<RequestFormPage> createState() => _RequestFormPageState();
}

class _RequestFormPageState extends State<RequestFormPage> {
  @override
  void initState() {
    super.initState();
    context.read<PurchaseRequestQueryBloc>().add(
          PurchaseRequestQueryEvent.fetch(
            status: PurchaseRequestStatus.input,
            isRequestForm: true,
            isOrder: true,
            departments: UserRepositoryApp.instance.departments,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.requestForm),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const RequestFormDataTable(),
        ),
      ],
    );
  }
}
