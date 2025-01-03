import 'package:flexurio_chiron_accounting/src/app/bloc/ebitda_recap_query/ebitda_recap_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/ebitda.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/ebitda/widget/ebitda_expansion_tile_coa_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:screen_identifier/screen_identifier.dart';

class EbitdaExpansionTileMarketingArea extends StatelessWidget {
  EbitdaExpansionTileMarketingArea({
    required this.title,
    required this.data,
    required this.controller,
    required this.controllerItem,
    super.key,
  });

  final String title;
  final List<Ebitda> data;
  final LinkedScrollControllerGroup controller;
  ScrollController controllerItem;

  @override
  Widget build(BuildContext context) {
    const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 12);
    final theme = Theme.of(context);

    final ebitdaPerCoaGroup = groupBy(data, (ebitda) => ebitda.coaGroup);
    final ebitdaPerCoaGroupKeys = ebitdaPerCoaGroup.keys.toList();
    final ebitdaPerCoaGroupValues = ebitdaPerCoaGroup.values.toList();

    final totalSales = data.fold<double>(
      0,
      (sum, item) => sum + (item.isSales ? item.value : 0.0),
    );

    final totalSalesYTD = data.fold<double>(
      0,
      (sum, item) => sum + (item.isSales ? item.valueYTD : 0.0),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: paddingRow,
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ScreenIdentifierBuilder(
              builder: (context, screenIdentifier) {
                return screenIdentifier.conditions(
                  xxxl: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: paddingRow,
                          color: Colors.transparent,
                          child: Text(
                            'EBITDA AREA $title',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 420,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const SizedBox(
                                    width: 100,
                                    child: Text(
                                      'MTD',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 91, 97, 118),
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    width: 68,
                                    child: const Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 91, 97, 118),
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    width: 100,
                                    child: const Text(
                                      'YTD',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 91, 97, 118),
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    width: 76,
                                    child: const Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromARGB(255, 91, 97, 118),
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  xxl: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: paddingRow,
                          color: Colors.transparent,
                          child: Text(
                            'EBITDA AREA $title',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const SizedBox(
                                    width: 100,
                                    child: Text(
                                      'MTD',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 91, 97, 118),
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    width: 60,
                                    child: const Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 91, 97, 118),
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    width: 100,
                                    child: const Text(
                                      'YTD',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 91, 97, 118),
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    width: 76,
                                    child: const Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromARGB(255, 91, 97, 118),
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  xl: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: paddingRow,
                          color: Colors.transparent,
                          child: Text(
                            'EBITDA AREA $title',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        height: 45,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          controller: controller.addAndGet(),
                          key: UniqueKey(),
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const SizedBox(
                                        width: 100,
                                        child: Text(
                                          'MTD',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                              255,
                                              91,
                                              97,
                                              118,
                                            ),
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        width: 60,
                                        child: const Text(
                                          '',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                              255,
                                              91,
                                              97,
                                              118,
                                            ),
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        width: 100,
                                        child: const Text(
                                          'YTD',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                              255,
                                              91,
                                              97,
                                              118,
                                            ),
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        width: 76,
                                        child: const Text(
                                          '',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromARGB(
                                              255,
                                              91,
                                              97,
                                              118,
                                            ),
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  lg: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: paddingRow,
                          color: Colors.transparent,
                          child: Text(
                            'EBITDA AREA $title',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        height: 45,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          controller: controller.addAndGet(),
                          key: UniqueKey(),
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const SizedBox(
                                        width: 100,
                                        child: Text(
                                          'MTD',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                              255,
                                              91,
                                              97,
                                              118,
                                            ),
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        width: 60,
                                        child: const Text(
                                          '',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                              255,
                                              91,
                                              97,
                                              118,
                                            ),
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        width: 100,
                                        child: const Text(
                                          'YTD',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                              255,
                                              91,
                                              97,
                                              118,
                                            ),
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        width: 76,
                                        child: const Text(
                                          '',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromARGB(
                                              255,
                                              91,
                                              97,
                                              118,
                                            ),
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  md: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: paddingRow,
                          color: Colors.transparent,
                          child: Text(
                            'EBITDA AREA $title',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        height: 45,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          controller: controller.addAndGet(),
                          key: UniqueKey(),
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const SizedBox(
                                        width: 100,
                                        child: Text(
                                          'MTD',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                              255,
                                              91,
                                              97,
                                              118,
                                            ),
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        width: 60,
                                        child: const Text(
                                          '',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                              255,
                                              91,
                                              97,
                                              118,
                                            ),
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        width: 100,
                                        child: const Text(
                                          'YTD',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                              255,
                                              91,
                                              97,
                                              118,
                                            ),
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        width: 76,
                                        child: const Text(
                                          '',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromARGB(
                                              255,
                                              91,
                                              97,
                                              118,
                                            ),
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  sm: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: paddingRow,
                          color: Colors.transparent,
                          child: Text(
                            'EBITDA AREA $title',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        height: 45,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          controller: controller.addAndGet(),
                          key: UniqueKey(),
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const SizedBox(
                                        width: 100,
                                        child: Text(
                                          'MTD',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                              255,
                                              91,
                                              97,
                                              118,
                                            ),
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        width: 60,
                                        child: const Text(
                                          '',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                              255,
                                              91,
                                              97,
                                              118,
                                            ),
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        width: 100,
                                        child: const Text(
                                          'YTD',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                              255,
                                              91,
                                              97,
                                              118,
                                            ),
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        width: 76,
                                        child: const Text(
                                          '',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromARGB(
                                              255,
                                              91,
                                              97,
                                              118,
                                            ),
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  xs: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: paddingRow,
                          color: Colors.transparent,
                          child: Text(
                            'EBITDA AREA $title',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        height: 45,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          controller: controller.addAndGet(),
                          key: UniqueKey(),
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const SizedBox(
                                        width: 100,
                                        child: Text(
                                          'MTD',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                              255,
                                              91,
                                              97,
                                              118,
                                            ),
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        width: 60,
                                        child: const Text(
                                          '',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                              255,
                                              91,
                                              97,
                                              118,
                                            ),
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        width: 100,
                                        child: const Text(
                                          'YTD',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                              255,
                                              91,
                                              97,
                                              118,
                                            ),
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        width: 76,
                                        child: const Text(
                                          '',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromARGB(
                                              255,
                                              91,
                                              97,
                                              118,
                                            ),
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        Divider(height: 3, thickness: 3, color: theme.colorScheme.primary),
        ...List.generate(
          ebitdaPerCoaGroupKeys.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: EbitdaExpansionTileCoaGroup(
              titleMarketing: 'EBITDA AREA $title',
              controller: controller,
              controllerItem: controllerItem,
              title: ebitdaPerCoaGroupKeys[index],
              data: ebitdaPerCoaGroupValues[index],
              percentageSubTotal: (amount, title) {
                if (amount == 0.0) {
                  return '0.0%';
                } else if (title.startsWith('SALES')) {
                  return '100.0%';
                } else {
                  return '${(amount / totalSales * 100).toStringAsFixed(1)}%';
                }
              },
              percentageSubTotalYTD: (amount, title) {
                if (amount == 0.0) {
                  return '0.0%';
                } else if (title.startsWith('SALES')) {
                  return '100.0%';
                } else {
                  return '${(amount / totalSalesYTD * 100).toStringAsFixed(1)}%';
                }
              },
            ),
          ),
        ),
        BlocBuilder<EbitdaRecapQueryBloc, EbitdaRecapQueryState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (ebitdaRecaps) {
                final ebitdaRecap = ebitdaRecaps.where((ebitdaRecap) {
                  return ebitdaRecap.area == title;
                }).first;

                return _TotalEbitda(
                  title: title,
                  controller: controller,
                  totalEbitda: ebitdaRecap.amount.format(0),
                  ebitdaPercentage:
                      '${ebitdaRecap.amountPercent.toStringAsFixed(1)}%',
                  totalEbitdaYTD: ebitdaRecap.amountYTD.format(0),
                  ebitdaPercentageYTD:
                      '${ebitdaRecap.amountPercentYTD.toStringAsFixed(1)}%',
                );
              },
              orElse: CupertinoActivityIndicator.new,
            );
          },
        ),
      ],
    );
  }
}

class _TotalEbitda extends StatelessWidget {
  _TotalEbitda({
    required this.title,
    required this.totalEbitda,
    required this.ebitdaPercentage,
    required this.totalEbitdaYTD,
    required this.ebitdaPercentageYTD,
    required this.controller,
  });

  final String title;
  final String totalEbitda;
  final String ebitdaPercentage;
  final String totalEbitdaYTD;
  final String ebitdaPercentageYTD;
  LinkedScrollControllerGroup controller;

  @override
  Widget build(BuildContext context) {
    const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 12);
    final theme = Theme.of(context);
    return ScreenIdentifierBuilder(
      builder: (context, screenIdentifier) {
        return screenIdentifier.conditions(
          xxxl: Container(
            color: theme.colorScheme.primary.withOpacity(.7),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  // flex: 1,
                  child: Container(
                    padding: paddingRow,
                    // color: theme.colorScheme.primary.withOpacity(.3),
                    child: Text(
                      'EBITDA AREA $title',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  // color: theme.colorScheme.primary.withOpacity(.7),
                  width: 420,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              color: theme.colorScheme.primary.withOpacity(.85),
                              padding: const EdgeInsets.only(
                                top: 7.6,
                                bottom: 7.6,
                                // right: 21,
                              ),
                              margin: const EdgeInsets.only(left: 10),
                              width: 100,
                              child: Text(
                                totalEbitda,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            Container(
                              color: theme.colorScheme.primary.withOpacity(.85),
                              padding: const EdgeInsets.only(
                                top: 7.6,
                                bottom: 7.6,
                                left: 10,
                              ),
                              width: 60,
                              child: Text(
                                ebitdaPercentage,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              color: theme.colorScheme.primary,
                              padding: const EdgeInsets.only(
                                top: 7.6,
                                bottom: 7.6,
                                right: 10,
                              ),
                              width: 100,
                              child: Text(
                                totalEbitdaYTD,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            Container(
                              color: theme.colorScheme.primary,
                              padding: const EdgeInsets.only(
                                top: 7.6,
                                bottom: 7.6,
                                // left: 10,
                              ),
                              width: 60,
                              child: Text(
                                ebitdaPercentageYTD,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          xxl: Container(
            color: theme.colorScheme.primary.withOpacity(.7),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  // flex: 1,
                  child: Container(
                    padding: paddingRow,
                    // color: theme.colorScheme.primary.withOpacity(.15),
                    child: Text(
                      'EBITDA AREA $title',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  // color: theme.colorScheme.primary.withOpacity(.7),
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              color: theme.colorScheme.primary.withOpacity(.85),
                              padding: const EdgeInsets.only(
                                top: 7.6,
                                bottom: 7.6,
                                // right: 10,
                              ),
                              width: 100,
                              child: Text(
                                totalEbitda,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            Container(
                              color: theme.colorScheme.primary.withOpacity(.85),
                              padding: const EdgeInsets.only(
                                top: 7.6,
                                bottom: 7.6,
                                left: 10,
                              ),
                              width: 60,
                              child: Text(
                                ebitdaPercentage,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              color: theme.colorScheme.primary.withOpacity(.85),
                              width: 20,
                              padding: const EdgeInsets.only(
                                top: 7.6,
                                bottom: 7.6,
                                left: 10,
                              ),
                              child: const Text(
                                '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Container(
                              color: theme.colorScheme.primary,
                              padding: const EdgeInsets.only(
                                top: 7.6,
                                bottom: 7.6,
                                right: 10,
                              ),
                              width: 100,
                              child: Text(
                                totalEbitdaYTD,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            Container(
                              color: theme.colorScheme.primary,
                              padding: const EdgeInsets.only(
                                top: 7.6,
                                bottom: 7.6,
                              ),
                              width: 60,
                              child: Text(
                                ebitdaPercentageYTD,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          xl: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: paddingRow,
                    color: theme.colorScheme.primary.withOpacity(.7),
                    child: Text(
                      'EBITDA AREA $title',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 250,
                  height: 45,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    controller: controller.addAndGet(),
                    key: UniqueKey(),
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  color: theme.colorScheme.primary
                                      .withOpacity(.85),
                                  padding: const EdgeInsets.only(
                                    top: 7.6,
                                    bottom: 7.6,
                                    // right: 10,
                                  ),
                                  width: 100,
                                  child: Text(
                                    totalEbitda,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  color: theme.colorScheme.primary
                                      .withOpacity(.85),
                                  padding: const EdgeInsets.only(
                                    top: 7.6,
                                    bottom: 7.6,
                                    left: 10,
                                  ),
                                  width: 60,
                                  child: Text(
                                    ebitdaPercentage,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  color: theme.colorScheme.primary
                                      .withOpacity(.85),
                                  width: 20,
                                  padding: const EdgeInsets.only(
                                    top: 7.6,
                                    bottom: 7.6,
                                    left: 10,
                                  ),
                                  child: const Text(
                                    '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Container(
                                  color: theme.colorScheme.primary,
                                  padding: const EdgeInsets.only(
                                    top: 7.6,
                                    bottom: 7.6,
                                    right: 10,
                                  ),
                                  width: 100,
                                  child: Text(
                                    totalEbitdaYTD,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  color: theme.colorScheme.primary,
                                  padding: const EdgeInsets.only(
                                    top: 7.6,
                                    bottom: 7.6,
                                  ),
                                  width: 60,
                                  child: Text(
                                    ebitdaPercentageYTD,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          lg: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: paddingRow,
                    color: theme.colorScheme.primary.withOpacity(.7),
                    child: Text(
                      'EBITDA AREA $title',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 250,
                  height: 45,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    controller: controller.addAndGet(),
                    key: UniqueKey(),
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  color: theme.colorScheme.primary
                                      .withOpacity(.85),
                                  padding: const EdgeInsets.only(
                                    top: 7.6,
                                    bottom: 7.6,
                                    // right: 10,
                                  ),
                                  width: 100,
                                  child: Text(
                                    totalEbitda,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  color: theme.colorScheme.primary
                                      .withOpacity(.85),
                                  padding: const EdgeInsets.only(
                                    top: 7.6,
                                    bottom: 7.6,
                                    left: 10,
                                  ),
                                  width: 60,
                                  child: Text(
                                    ebitdaPercentage,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  color: theme.colorScheme.primary
                                      .withOpacity(.85),
                                  width: 20,
                                  padding: const EdgeInsets.only(
                                    top: 7.6,
                                    bottom: 7.6,
                                    left: 10,
                                  ),
                                  child: const Text(
                                    '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Container(
                                  color: theme.colorScheme.primary,
                                  padding: const EdgeInsets.only(
                                    top: 7.6,
                                    bottom: 7.6,
                                    right: 10,
                                  ),
                                  width: 100,
                                  child: Text(
                                    totalEbitdaYTD,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  color: theme.colorScheme.primary,
                                  padding: const EdgeInsets.only(
                                    top: 7.6,
                                    bottom: 7.6,
                                  ),
                                  width: 60,
                                  child: Text(
                                    ebitdaPercentageYTD,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          md: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: paddingRow,
                    color: theme.colorScheme.primary.withOpacity(.7),
                    child: Text(
                      'EBITDA AREA $title',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 250,
                  height: 45,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    controller: controller.addAndGet(),
                    key: UniqueKey(),
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  color: theme.colorScheme.primary
                                      .withOpacity(.85),
                                  padding: const EdgeInsets.only(
                                    top: 7.6,
                                    bottom: 7.6,
                                    // right: 10,
                                  ),
                                  width: 100,
                                  child: Text(
                                    totalEbitda,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  color: theme.colorScheme.primary
                                      .withOpacity(.85),
                                  padding: const EdgeInsets.only(
                                    top: 7.6,
                                    bottom: 7.6,
                                    left: 10,
                                  ),
                                  width: 60,
                                  child: Text(
                                    ebitdaPercentage,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  color: theme.colorScheme.primary
                                      .withOpacity(.85),
                                  width: 20,
                                  padding: const EdgeInsets.only(
                                    top: 7.6,
                                    bottom: 7.6,
                                    left: 10,
                                  ),
                                  child: const Text(
                                    '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Container(
                                  color: theme.colorScheme.primary,
                                  padding: const EdgeInsets.only(
                                    top: 7.6,
                                    bottom: 7.6,
                                    right: 10,
                                  ),
                                  width: 100,
                                  child: Text(
                                    totalEbitdaYTD,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  color: theme.colorScheme.primary,
                                  padding: const EdgeInsets.only(
                                    top: 7.6,
                                    bottom: 7.6,
                                  ),
                                  width: 60,
                                  child: Text(
                                    ebitdaPercentageYTD,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          sm: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: paddingRow,
                    color: theme.colorScheme.primary.withOpacity(.7),
                    child: Text(
                      'EBITDA AREA $title',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 250,
                  height: 45,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    controller: controller.addAndGet(),
                    key: UniqueKey(),
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  color: theme.colorScheme.primary
                                      .withOpacity(.85),
                                  padding: const EdgeInsets.only(
                                    top: 7.6,
                                    bottom: 7.6,
                                    // right: 10,
                                  ),
                                  width: 100,
                                  child: Text(
                                    totalEbitda,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  color: theme.colorScheme.primary
                                      .withOpacity(.85),
                                  padding: const EdgeInsets.only(
                                    top: 7.6,
                                    bottom: 7.6,
                                    left: 10,
                                  ),
                                  width: 60,
                                  child: Text(
                                    ebitdaPercentage,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  color: theme.colorScheme.primary
                                      .withOpacity(.85),
                                  width: 20,
                                  padding: const EdgeInsets.only(
                                    top: 7.6,
                                    bottom: 7.6,
                                    left: 10,
                                  ),
                                  child: const Text(
                                    '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Container(
                                  color: theme.colorScheme.primary,
                                  padding: const EdgeInsets.only(
                                    top: 7.6,
                                    bottom: 7.6,
                                    right: 10,
                                  ),
                                  width: 100,
                                  child: Text(
                                    totalEbitdaYTD,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  color: theme.colorScheme.primary,
                                  padding: const EdgeInsets.only(
                                    top: 7.6,
                                    bottom: 7.6,
                                  ),
                                  width: 60,
                                  child: Text(
                                    ebitdaPercentageYTD,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          xs: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: paddingRow,
                    color: theme.colorScheme.primary.withOpacity(.7),
                    child: Text(
                      'EBITDA AREA $title',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 250,
                  height: 45,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    controller: controller.addAndGet(),
                    key: UniqueKey(),
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  color: theme.colorScheme.primary
                                      .withOpacity(.85),
                                  padding: const EdgeInsets.only(
                                    top: 7.6,
                                    bottom: 7.6,
                                    // right: 10,
                                  ),
                                  width: 100,
                                  child: Text(
                                    totalEbitda,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  color: theme.colorScheme.primary
                                      .withOpacity(.85),
                                  padding: const EdgeInsets.only(
                                    top: 7.6,
                                    bottom: 7.6,
                                    left: 10,
                                  ),
                                  width: 60,
                                  child: Text(
                                    ebitdaPercentage,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  color: theme.colorScheme.primary
                                      .withOpacity(.85),
                                  width: 20,
                                  padding: const EdgeInsets.only(
                                    top: 7.6,
                                    bottom: 7.6,
                                    left: 10,
                                  ),
                                  child: const Text(
                                    '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Container(
                                  color: theme.colorScheme.primary,
                                  padding: const EdgeInsets.only(
                                    top: 7.6,
                                    bottom: 7.6,
                                    right: 10,
                                  ),
                                  width: 100,
                                  child: Text(
                                    totalEbitdaYTD,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  color: theme.colorScheme.primary,
                                  padding: const EdgeInsets.only(
                                    top: 7.6,
                                    bottom: 7.6,
                                  ),
                                  width: 60,
                                  child: Text(
                                    ebitdaPercentageYTD,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
