import 'package:flexurio_chiron_ticket/src/app/bloc/ticket/ticket_bloc.dart';
import 'package:appointment/src/app/view/widget/select_field_chip_old.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class TicketCreatePage extends StatefulWidget {
  const TicketCreatePage._({required this.department});

  final String department;

  static Widget prepare({required String department}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TicketBloc()),
      ],
      child: TicketCreatePage._(department: department),
    );
  }

  static Route<bool?> route({required String department}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: TicketCreatePage.prepare(department: department),
    );
  }

  @override
  State<TicketCreatePage> createState() => _TicketCreatePageState();
}

class _TicketCreatePageState extends State<TicketCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categoryController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<TicketBloc>().add(
            TicketEvent.create(
              _titleController.text,
              _descriptionController.text,
              _categoryController.text,
              widget.department,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TicketBloc, TicketState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (_) {
            Navigator.pop(context, true);
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          formKey: _formKey,
          action: DataAction.create,
          entity: Entity.ticket,
          actions: [
            BlocBuilder<TicketBloc, TicketState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  onPressed: _submit,
                  action: DataAction.create,
                );
              },
            ),
          ],
          children: [
            FTextFormField(
              labelText: 'Title',
              controller: _titleController,
              validator: requiredValidator.call,
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'Description',
              controller: _descriptionController,
              validator: requiredValidator.call,
              maxLines: 4,
            ),
            const Gap(24),
            SelectChipFieldOld(
              label: 'Category',
              controller: _categoryController,
              validator: requiredValidator.call,
              options: const [
                'Error',
                'New Feature',
                'Revision Feature',
                'Edit Data',
                'Design',
              ],
            ),
          ],
        ),
      ),
    );
  }
}
