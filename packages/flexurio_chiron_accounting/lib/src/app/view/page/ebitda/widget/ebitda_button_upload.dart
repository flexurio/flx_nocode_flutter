import 'package:flexurio_chiron_accounting/src/app/bloc/ebitda_query/ebitda_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/ebitda_recap_query/ebitda_recap_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/ebitda/widget/ebitda_form_upload.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class EbitdaUploadButton extends StatelessWidget {
  const EbitdaUploadButton({
    required this.ebitdaQueryBloc,
    required this.ebitdaRecapQueryBloc,
    super.key,
    this.isFab = false,
  });

  final EbitdaQueryBloc ebitdaQueryBloc;
  final EbitdaRecapQueryBloc ebitdaRecapQueryBloc;
  final bool isFab;

  @override
  Widget build(BuildContext context) {
    if (isFab) {
      return FabMini(
        action: DataAction.upload,
        onPressed: () async {
          await showDialog<bool?>(
            context: context,
            builder: (context) {
              return EbitdaUploadPage.prepare();
            },
          ).then((value) {});
        },
      );
    } else {
      return Button(
        action: DataAction.upload,
        permission: Permission.ebitdaUpload,
        onPressed: () async {
          await showDialog<bool?>(
            context: context,
            builder: (context) {
              return EbitdaUploadPage.prepare();
            },
          ).then((value) {});
        },
      );
    }
  }
}
