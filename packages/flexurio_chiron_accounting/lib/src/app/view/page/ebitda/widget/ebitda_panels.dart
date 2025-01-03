import 'package:flexurio_chiron_accounting/src/app/bloc/ebitda_query/ebitda_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/ebitda_recap_query/ebitda_recap_bloc.dart';
import 'package:appointment/src/app/bloc/value/bloc/value_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/ebitda/widget/ebitda_expansion_tile_marketing_area.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:scroll_to_id/scroll_to_id.dart';

class EbitdaPanels extends StatefulWidget {
  const EbitdaPanels({
    required this.ebitdaRecapQueryBloc,
    super.key,
  });

  final EbitdaRecapQueryBloc ebitdaRecapQueryBloc;
  @override
  State<EbitdaPanels> createState() => _EbitdaPanelsState();
}

class _EbitdaPanelsState extends State<EbitdaPanels> {
  final _scrollController = ScrollController();
  final _scrollControllerGroup = LinkedScrollControllerGroup();
  final ScrollController _letters = ScrollController();

  late ScrollToId _scrollToId;

  @override
  void initState() {
    super.initState();
    _scrollToId = ScrollToId(scrollController: _scrollController);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ValueBloc<String>, String>(
      listener: (context, state) {
        _scrollToId.animateTo(
          state,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
      child: BlocBuilder<EbitdaQueryBloc, EbitdaQueryState>(
        builder: (context, state) {
          _scrollToId = ScrollToId(scrollController: _scrollController);
          return state.maybeWhen(
            loaded: (ebitdaPerArea, period) {
              final marketingAreas = ebitdaPerArea.keys.toList();
              final marketingAreaValues = ebitdaPerArea.values.toList();

              if (marketingAreas.isEmpty) {
                return const Center(child: Text('No Data'));
              }

              return InteractiveScrollViewer(
                scrollToId: _scrollToId,
                children: List.generate(
                  marketingAreas.length,
                  (index) {
                    final area = marketingAreas[index];
                    return ScrollContent(
                      id: area,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: FCard(
                          padding: const EdgeInsets.all(18),
                          child: EbitdaExpansionTileMarketingArea(
                            title: marketingAreas[index],
                            data: marketingAreaValues[index],
                            controller: _scrollControllerGroup,
                            controllerItem: _letters,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            orElse: () => const Center(child: CupertinoActivityIndicator()),
          );
        },
      ),
    );
  }
}
