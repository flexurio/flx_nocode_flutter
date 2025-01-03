import 'package:flexurio_chiron_accounting/src/app/bloc/ebitda/ebitda_bloc.dart';
import 'package:appointment/src/app/util/picker_file.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EbitdaUploadPage extends StatefulWidget {
  const EbitdaUploadPage._();
  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EbitdaBloc(),
        ),
      ],
      child: const EbitdaUploadPage._(),
    );
  }

  @override
  State<EbitdaUploadPage> createState() => _EbitdaUploadPageState();
}

class _EbitdaUploadPageState extends State<EbitdaUploadPage> {
  final _formKey = GlobalKey<FormState>();
  final _coaGroupController = TextEditingController();
  final _periodController = TextEditingController();
  late DateTime _periodNow;
  late String _url;
  PlatformFile? _attachment;
  final actions = <Widget>[];

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final coaGroupSelect = _coaGroupController.text;
      if (coaGroupSelect != '') {
        if (coaGroupSelect == 'COGS Manual') {
          _url = 'cogs/manual';
        } else if (coaGroupSelect == 'Incentive') {
          _url = 'incentive/report';
        } else if (coaGroupSelect == 'Salary Marketing') {
          _url = 'salary/report';
        }
        context.read<EbitdaBloc>().add(
              EbitdaBlocEvent.upload(
                url: _url,
                period: int.parse(_periodController.text),
                attachment: _attachment,
              ),
            );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _periodNow = DateTime(now.year);
    _periodController.text = DateFormat('yyyyMM').format(_periodNow);
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.upload;
    final entity = Entity.ebitda;
    return BlocListener<EbitdaBloc, EbitdaState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(action, entity);
            Navigator.pop(context, true);
          },
          orElse: () {},
        );
      },
      child: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          SingleFormPanel(
            actions: [
              Button(
                permission: null,
                isSecondary: true,
                onPressed: () => Navigator.pop(context),
                action: DataAction.cancel,
              ),
              const SizedBox(width: 12),
              Button(
                permission: null,
                onPressed: () => _submit(context),
                action: DataAction.upload,
              ),
            ],
            action: action,
            entity: entity,
            visibleBackButton: false,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Column(
                      children: [
                        FDropDownSearch<String>(
                          initialValue: '',
                          labelText: 'COA Group',
                          items: const [
                            'COGS Manual',
                            'Incentive',
                            'Salary Marketing',
                          ],
                          onChanged: (coaGroup) {
                            if (coaGroup != null) {
                              _coaGroupController.text = coaGroup;
                            }
                          },
                          itemAsString: (coaGroup) => coaGroup,
                          validator: requiredObjectValidator.call,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    FieldMonthPicker(
                      initialSelectedDate: _periodNow,
                      controller: _periodController,
                      labelText: 'Period',
                      maxDate: DateTime.now(),
                      validator: requiredObjectValidator.call,
                      onChanged: (value) => {
                        _periodNow = value,
                        _periodController.text =
                            DateFormat('yyyyMM').format(value),
                      },
                    ),
                    const SizedBox(height: 20),
                    ChooseFile(
                      onChange: (file) => _attachment = file.first,
                      type: const ['csv'],
                      onPickFile: pickFile,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
