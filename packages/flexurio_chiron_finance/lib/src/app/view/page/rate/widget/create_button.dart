import 'package:flexurio_chiron_finance/src/app/view/page/rate/widget/rate_create_page.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: PermissionFinance.rateCreate,
      action: DataAction.create,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool?>(
            builder: (context) => RateCreatePage.prepare(),
          ),
        ).then((value) {
          const action = DataAction.create;
          final entity = Entity.rate;
          if (value ?? false) {
            context.read<RateQueryBloc>().add(const RateQueryEvent.fetch());
            Toast(context).dataChanged(action, entity);
          }
        });
      },
    );
  }
}
