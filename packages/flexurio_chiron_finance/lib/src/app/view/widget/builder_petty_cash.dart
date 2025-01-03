import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuilderPettyCash extends StatelessWidget {
  const BuilderPettyCash({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final Widget Function(PettyCash? pettyCash) builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PettyCashQueryBloc, PettyCashQueryState>(
        builder: (context, state) {
      return builder(state.maybeWhen(
        loaded: (pettyCash) {
          if (pettyCash.data.isEmpty) {
            return null;
          } else {
            return pettyCash.data.first;
          }
        },
        orElse: () => null,
      ));
    });
  }
}
