import 'dart:ui';

import 'package:flexurio_chiron_accounting/src/app/bloc/ebitda/ebitda_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/ebitda_query/ebitda_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/ebitda_recap_query/ebitda_recap_bloc.dart';
import 'package:appointment/src/app/bloc/value/bloc/value_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/ebitda/widget/ebitda_button_upload.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/ebitda/widget/ebitda_panels.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/ebitda/widget/filter_form.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/ebitda/widget/print_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/ebitda/widget/recap_table.dart';

import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:screen_identifier/screen_identifier.dart';

class EbitdaPage extends StatelessWidget {
  const EbitdaPage._();

  static Widget prepare() {
    final now = DateFormat('yyyyMM').format(DateTime.now());
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              EbitdaQueryBloc()..add(EbitdaQueryEvent.fetch(now, '')),
        ),
        BlocProvider(
          create: (context) =>
              EbitdaRecapQueryBloc()..add(EbitdaRecapQueryEvent.fetch(now, '')),
        ),
        BlocProvider(create: (context) => ValueBloc<String>('')),
        BlocProvider(
          create: (context) => EbitdaBloc(),
        ),
      ],
      child: const EbitdaPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ebitdaQueryBloc = context.read<EbitdaQueryBloc>();
    final ebitdaRecapQueryBloc = context.read<EbitdaRecapQueryBloc>();
    final valueBloc = context.read<ValueBloc<String>>();
    final ebitdaPanels = Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: EbitdaPanels(ebitdaRecapQueryBloc: ebitdaRecapQueryBloc),
    );
    return ScreenIdentifierBuilder(
      builder: (context, screenIdentifier) {
        return screenIdentifier.conditions(
          xxxl: ContentWithRightPanel(
            rightPanel: Column(
              children: [
                const Gap(24),
                FilterForm(
                  ebitdaQueryBloc: ebitdaQueryBloc,
                  ebitdaRecapQueryBloc: ebitdaRecapQueryBloc,
                ),
                const Divider(),
                const Gap(24),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                        PointerDeviceKind.trackpad,
                      },
                    ),
                    child: Scrollbar(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: 500,
                                  child: ScrollConfiguration(
                                    behavior: ScrollConfiguration.of(context)
                                        .copyWith(
                                      scrollbars: false,
                                    ),
                                    child: ListView(
                                      children: List.generate(1, (row) {
                                        return EbitdaRecapTable(
                                          ebitdaRecapQueryBloc:
                                              ebitdaRecapQueryBloc,
                                          valueBloc: valueBloc,
                                          closeWhenTapped: false,
                                        );
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                //
                const Gap(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        EbitdaUploadButton(
                          ebitdaQueryBloc: context.read<EbitdaQueryBloc>(),
                          ebitdaRecapQueryBloc:
                              context.read<EbitdaRecapQueryBloc>(),
                        ),
                      ],
                    ),
                    const Gap(5),
                    const Column(
                      children: [
                        PrintButton(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            child: ebitdaPanels,
          ),
          xxl: ContentWithRightPanel(
            rightPanel: Column(
              children: [
                const Gap(12),
                FilterForm(
                  ebitdaQueryBloc: ebitdaQueryBloc,
                  ebitdaRecapQueryBloc: ebitdaRecapQueryBloc,
                ),
                const Divider(),
                const Gap(24),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                        PointerDeviceKind.trackpad,
                      },
                    ),
                    child: Scrollbar(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: 500,
                                  child: ScrollConfiguration(
                                    behavior: ScrollConfiguration.of(context)
                                        .copyWith(
                                      scrollbars: false,
                                    ),
                                    child: ListView(
                                      children: List.generate(1, (row) {
                                        return EbitdaRecapTable(
                                          ebitdaRecapQueryBloc:
                                              ebitdaRecapQueryBloc,
                                          valueBloc: valueBloc,
                                          closeWhenTapped: false,
                                        );
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                //
                const Gap(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        EbitdaUploadButton(
                          ebitdaQueryBloc: context.read<EbitdaQueryBloc>(),
                          ebitdaRecapQueryBloc:
                              context.read<EbitdaRecapQueryBloc>(),
                        ),
                      ],
                    ),
                    const Gap(5),
                    const Column(
                      children: [
                        PrintButton(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            child: ebitdaPanels,
          ),
          xl: ContentWithRightPanel(
            rightPanel: Column(
              children: [
                const Gap(12),
                FilterForm(
                  ebitdaQueryBloc: ebitdaQueryBloc,
                  ebitdaRecapQueryBloc: ebitdaRecapQueryBloc,
                ),
                const Divider(),
                const Gap(24),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                        PointerDeviceKind.trackpad,
                      },
                    ),
                    child: Scrollbar(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: 500,
                                  child: ScrollConfiguration(
                                    behavior: ScrollConfiguration.of(context)
                                        .copyWith(
                                      scrollbars: false,
                                    ),
                                    child: ListView(
                                      children: List.generate(1, (row) {
                                        return EbitdaRecapTable(
                                          ebitdaRecapQueryBloc:
                                              ebitdaRecapQueryBloc,
                                          valueBloc: valueBloc,
                                          closeWhenTapped: false,
                                        );
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                //
                const Gap(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        EbitdaUploadButton(
                          ebitdaQueryBloc: context.read<EbitdaQueryBloc>(),
                          ebitdaRecapQueryBloc:
                              context.read<EbitdaRecapQueryBloc>(),
                        ),
                      ],
                    ),
                    const Gap(5),
                    const Column(
                      children: [
                        PrintButton(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            child: ebitdaPanels,
          ),
          lg: ContentWithRightPanel(
            rightPanel: Column(
              children: [
                const Gap(12),
                FilterForm(
                  ebitdaQueryBloc: ebitdaQueryBloc,
                  ebitdaRecapQueryBloc: ebitdaRecapQueryBloc,
                ),
                const Divider(),
                const Gap(24),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                        PointerDeviceKind.trackpad,
                      },
                    ),
                    child: Scrollbar(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: 500,
                                  child: ScrollConfiguration(
                                    behavior: ScrollConfiguration.of(context)
                                        .copyWith(
                                      scrollbars: false,
                                    ),
                                    child: ListView(
                                      children: List.generate(1, (row) {
                                        return EbitdaRecapTable(
                                          ebitdaRecapQueryBloc:
                                              ebitdaRecapQueryBloc,
                                          valueBloc: valueBloc,
                                          closeWhenTapped: false,
                                        );
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                //
                const Gap(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        EbitdaUploadButton(
                          ebitdaQueryBloc: context.read<EbitdaQueryBloc>(),
                          ebitdaRecapQueryBloc:
                              context.read<EbitdaRecapQueryBloc>(),
                        ),
                      ],
                    ),
                    const Gap(5),
                    const Column(
                      children: [
                        PrintButton(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            child: ebitdaPanels,
          ),
          md: Scaffold(
            body: ebitdaPanels,
            floatingActionButton: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildFabViewRecap(context, ebitdaRecapQueryBloc, valueBloc),
                const Gap(12),
                const PrintButton(isFab: true),
                const Gap(12),
                EbitdaUploadButton(
                  ebitdaQueryBloc: context.read<EbitdaQueryBloc>(),
                  ebitdaRecapQueryBloc: context.read<EbitdaRecapQueryBloc>(),
                  isFab: true,
                ),
                const Gap(12),
                _buildFabFilter(
                  context,
                  ebitdaQueryBloc,
                  ebitdaRecapQueryBloc,
                ),
              ],
            ),
          ),
          sm: Scaffold(
            body: ebitdaPanels,
            floatingActionButton: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildFabViewRecap(context, ebitdaRecapQueryBloc, valueBloc),
                const Gap(12),
                const PrintButton(isFab: true),
                const Gap(12),
                EbitdaUploadButton(
                  ebitdaQueryBloc: context.read<EbitdaQueryBloc>(),
                  ebitdaRecapQueryBloc: context.read<EbitdaRecapQueryBloc>(),
                  isFab: true,
                ),
                const Gap(12),
                _buildFabFilter(
                  context,
                  ebitdaQueryBloc,
                  ebitdaRecapQueryBloc,
                ),
              ],
            ),
          ),
          xs: Scaffold(
            body: ebitdaPanels,
            floatingActionButton: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildFabViewRecap(context, ebitdaRecapQueryBloc, valueBloc),
                const Gap(12),
                const PrintButton(isFab: true),
                const Gap(12),
                EbitdaUploadButton(
                  ebitdaQueryBloc: context.read<EbitdaQueryBloc>(),
                  ebitdaRecapQueryBloc: context.read<EbitdaRecapQueryBloc>(),
                  isFab: true,
                ),
                const Gap(12),
                _buildFabFilter(
                  context,
                  ebitdaQueryBloc,
                  ebitdaRecapQueryBloc,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  BlocBuilder<EbitdaQueryBloc, EbitdaQueryState> _buildFabViewRecap(
    BuildContext context,
    EbitdaRecapQueryBloc ebitdaRecapQueryBloc,
    ValueBloc<String> valueBloc,
  ) {
    return BlocBuilder<EbitdaQueryBloc, EbitdaQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: SizedBox.new,
          loaded: (ebitdaPerArea, period) {
            return Visibility(
              visible: ebitdaPerArea.isNotEmpty,
              child: FabMini(
                action: DataAction.viewGroup,
                onPressed: () {
                  showModalBottomSheet<dynamic>(
                    context: context,
                    useRootNavigator: true,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) => ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      child: FractionallySizedBox(
                        heightFactor: 0.75,
                        child: EbitdaRecapTable(
                          ebitdaRecapQueryBloc: ebitdaRecapQueryBloc,
                          valueBloc: valueBloc,
                          closeWhenTapped: true,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildFabFilter(
    BuildContext context,
    EbitdaQueryBloc ebitdaQueryBloc,
    EbitdaRecapQueryBloc ebitdaRecapQueryBloc,
  ) {
    final theme = Theme.of(context);
    final secondaryColor = theme.colorScheme.secondary;
    final ebitdaQueryBloc = context.read<EbitdaQueryBloc>();
    final ebitdaRecapQueryBloc = context.read<EbitdaRecapQueryBloc>();
    return FloatingActionButton(
      backgroundColor: secondaryColor,
      child: const Icon(FontAwesomeIcons.filter),
      onPressed: () {
        showDialog<void>(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: FilterForm(
                closeWhenSubmitted: true,
                ebitdaQueryBloc: ebitdaQueryBloc,
                ebitdaRecapQueryBloc: ebitdaRecapQueryBloc,
              ),
            );
          },
        );
      },
    );
  }
}
