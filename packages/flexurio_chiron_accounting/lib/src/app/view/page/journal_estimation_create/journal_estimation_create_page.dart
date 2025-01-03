import 'package:flexurio_chiron_accounting/src/app/bloc/jornal_estimation_query_bloc/journal_estimation_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/journal_estimation/journal_estimation_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/journal_estimation.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/journal_estimation.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class JournalEstimationCreatePage extends StatefulWidget {
  const JournalEstimationCreatePage({super.key, this.journalEstimation});

  final JournalEstimation? journalEstimation;

  static Route<bool?> route({JournalEstimation? journalEstimation}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => JournalEstimationBloc(),
          ),
          BlocProvider(
            create: (context) => JournalEstimationQueryBloc()
              ..add(JournalEstimationQueryEvent.fetch()),
          ),
        ],
        child: JournalEstimationCreatePage(
          journalEstimation: journalEstimation,
        ),
      ),
    );
  }

  @override
  State<JournalEstimationCreatePage> createState() =>
      _JournalEstimationCreatePageState();
}

class _JournalEstimationCreatePageState
    extends State<JournalEstimationCreatePage> {
  final _action = DataAction.create;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _codeController = TextEditingController();
  JournalEstimationType? _type;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<JournalEstimationBloc>().add(
            JournalEstimationEvent.create(
              id: _codeController.text,
              name: _nameController.text,
              type: _type!.id,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.journalEstimation;
    return BlocListener<JournalEstimationBloc, JournalEstimationState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          success: () {
            Toast(context).dataChanged(_action, entity);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          formKey: _formKey,
          action: _action,
          entity: entity,
          actions: [
            BlocBuilder<JournalEstimationBloc, JournalEstimationState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  action: _action,
                  onPressed: _submit,
                  isInProgress: state.maybeWhen(
                    orElse: () => false,
                    loading: () => true,
                  ),
                );
              },
            ),
          ],
          children: [
            if (_action.isCreate)
              Column(
                children: [
                  FTextFormField(
                    labelText: 'Code',
                    controller: _codeController,
                    validator: requiredValidator.call,
                  ),
                  const Gap(24),
                  FTextFormField(
                    labelText: 'Name',
                    controller: _nameController,
                    validator: requiredValidator.call,
                  ),
                  const Gap(24),
                  FDropDownSearchJournalEstimationType(
                    onChanged: (type) {
                      _type = type;
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
