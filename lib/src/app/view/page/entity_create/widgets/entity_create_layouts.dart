import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EntityCreateEmbeddedLayout extends StatelessWidget {
  const EntityCreateEmbeddedLayout({
    super.key,
    required this.formKey,
    required this.form,
    required this.submitButton,
  });

  final GlobalKey<FormState> formKey;
  final Widget form;
  final Widget submitButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                form,
                const Gap(24),
                Row(
                  children: [Expanded(child: submitButton)],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EntityCreatePanelLayout extends StatelessWidget {
  const EntityCreatePanelLayout({
    super.key,
    required this.embedded,
    required this.theme,
    required this.formKey,
    required this.form,
    required this.submitButton,
    required this.coreEntity,
    required this.title,
    required this.action,
  });

  final bool embedded;
  final ThemeData theme;
  final GlobalKey<FormState> formKey;
  final Widget form;
  final Widget submitButton;
  final Entity coreEntity;
  final String title;
  final DataAction action;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: embedded ? _buildAppBar(context) : null,
      backgroundColor: embedded ? theme.cardColor : Colors.transparent,
      body: SingleFormPanel(
        hideHeader: embedded,
        formKey: formKey,
        action: action,
        suffixText: title,
        entity: coreEntity,
        actions: [submitButton],
        children: [form],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: theme.scaffoldBackgroundColor,
    );
  }
}
