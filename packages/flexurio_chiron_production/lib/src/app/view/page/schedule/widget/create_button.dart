import 'package:flexurio_chiron_production/src/app/bloc/schedule_query/schedule_query_bloc.dart';
import 'package:flexurio_chiron_production/src/app/model/permission.dart';
import 'package:flexurio_chiron_production/src/app/view/page/schedule/widget/schedule_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleCreateButton extends StatelessWidget {
  const ScheduleCreateButton({
    required this.isExternal, super.key,
  });
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: PermissionProduction.scheduleCreate(isExternal: isExternal),
      action: DataAction.create,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool?>(
            builder: (context) => ScheduleCreatePage.prepare(
              isExternal: isExternal,
            ),
          ),
        ).then((value) {
          if (value ?? false) {
            context
                .read<ScheduleQueryBloc>()
                .add(const ScheduleQueryEvent.fetch());
          }
        });
      },
    );
  }
}
