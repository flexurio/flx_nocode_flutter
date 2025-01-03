import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PettyCashPage extends StatelessWidget {
  const PettyCashPage._({this.openData});

  final PettyCash? openData;

  static Widget prepare({
    PettyCash? openData,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PettyCashQueryBloc()
            ..add(
              const PettyCashQueryEvent.fetch(status: PettyCashStatus.input),
            ),
        ),
      ],
      child: PettyCashPage._(openData: openData),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (openData != null) {
        Navigator.push(
          context,
          PettyCashViewPage.route(openData!),
        );
      }
    });

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.pettyCash),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const PettyCashDataTable(),
        ),
      ],
    );
  }
}
