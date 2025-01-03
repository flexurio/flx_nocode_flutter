import 'package:flexurio_chiron_company/src/app/bloc/office/office_bloc.dart';
import 'package:flexurio_chiron_company/src/app/model/office.dart';
import 'package:flexurio_chiron_company/src/app/view/page/office/widget/office_users.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfficeUsersButton extends StatelessWidget {
  const OfficeUsersButton._({
    required this.office,
  });

  static Widget prepare({
    required Office office,
  }) {
    return BlocProvider(
      create: (context) => OfficeBloc(),
      child: OfficeUsersButton._(office: office),
    );
  }

  final Office office;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.officeEmployeeCreate,
      action: DataAction.showEmployee,
      onPressed: () async {
        await showDialog<void>(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radiusPopup),
              ),
              content: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 600,
                  maxWidth: 500,
                  minWidth: 500,
                ),
                child: OfficeUsers.prepare(office: office),
              ),
            );
          },
        );
      },
    );
  }
}
