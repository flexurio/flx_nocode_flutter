import 'package:flexurio_chiron_accounting/src/app/model/ebitda.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:screen_identifier/screen_identifier.dart';

class EbitdaExpansionTileCoaGroup extends StatefulWidget {
  EbitdaExpansionTileCoaGroup({
    required this.title,
    required this.data,
    required this.percentageSubTotal,
    required this.percentageSubTotalYTD,
    required this.controller,
    required this.controllerItem,
    required this.titleMarketing,
    super.key,
  });

  final String title;
  final List<Ebitda> data;
  final String Function(double, String) percentageSubTotal;
  final String Function(double, String) percentageSubTotalYTD;
  final LinkedScrollControllerGroup controller;
  ScrollController controllerItem;
  final String titleMarketing;

  @override
  State<EbitdaExpansionTileCoaGroup> createState() =>
      _EbitdaExpansionTileCoaGroupState();
}

class _EbitdaExpansionTileCoaGroupState
    extends State<EbitdaExpansionTileCoaGroup> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final dataSubtotal = widget.data.fold<double>(
      0,
      (sum, item) => sum + item.value,
    );

    final dataSubtotalYTD = widget.data.fold<double>(
      0,
      (sum, item) => sum + item.valueYTD,
    );

    final ShapeBorder border = Border.all(color: Colors.transparent, width: 0);

    @override
    void initState() {
      super.initState();
      widget.controllerItem = widget.controller.addAndGet();
    }

    @override
    void dispose() {
      widget.controllerItem.dispose();
      super.dispose();
    }

    const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 12);

    return Stack(
      children: [
        ExpansionTile(
          shape: border,
          collapsedShape: border,
          onExpansionChanged: (value) {
            setState(() => _isExpanded = value);
          },
          trailing: const SizedBox(),
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    size: 20,
                  ),
                  const Gap(5),
                  Expanded(
                    child: Tooltip(
                      message: widget.title,
                      child: Text(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sub Total',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 91, 97, 118),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
          tilePadding: const EdgeInsets.only(left: 8),
          childrenPadding: EdgeInsets.zero,
          children: List.generate(
            widget.data.length,
            (index) => Container(
              padding:
                  const EdgeInsets.only(left: 33, right: 12, top: 6, bottom: 6),
              // const EdgeInsets.only(left: 33, right: 12),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey[300]!),
                ),
              ),
              height: 60,
              child: ScreenIdentifierBuilder(
                builder: (context, screenIdentifier) {
                  return screenIdentifier.conditions(
                    md: Row(
                      children: [
                        _buildCoaNo(index),
                        _buildCoaName(index),
                      ],
                    ),
                    sm: Column(
                      children: [
                        Row(
                          children: [
                            _buildCoaNo(index),
                            _buildCoaName(index),
                          ],
                        ),
                        // const Gap(3),
                        // Row(
                        //   children: [
                        //     Expanded(child: _buildAmount(index)),
                        //     const Gap(12),
                        //     _buildPercentage(index),
                        //   ],
                        // ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        const Positioned(
          top: 29,
          left: 0,
          right: 0,
          child: Divider(thickness: 1),
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
                        'EBITDA AREA ${widget.titleMarketing}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 420,
                    margin: const EdgeInsets.only(top: 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 45,
                          margin: const EdgeInsets.only(top: 20, right: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                width: 100,
                                padding: const EdgeInsets.only(
                                  bottom: 6,
                                ),
                                child: Text(
                                  dataSubtotal.format(0),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 91, 97, 118),
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 6,
                                  ),
                                  child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: theme.colorScheme.secondary,
                                    ),
                                    child: Tooltip(
                                      message: '% total month to date',
                                      child: Text(
                                        widget.percentageSubTotal(
                                          dataSubtotal,
                                          widget.title,
                                        ),
                                        style: const TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                                child: Text(
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
                                margin: const EdgeInsets.only(right: 10),
                                width: 100,
                                padding: const EdgeInsets.only(
                                  bottom: 6,
                                ),
                                child: Text(
                                  dataSubtotalYTD.format(0),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 91, 97, 118),
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 6,
                                  ),
                                  child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: theme.colorScheme.secondary,
                                    ),
                                    child: Tooltip(
                                      message: '% total years to date',
                                      child: Text(
                                        widget.percentageSubTotalYTD(
                                          dataSubtotalYTD,
                                          widget.title,
                                        ),
                                        style: const TextStyle(
                                          fontSize: 8,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                                child: Text(
                                  '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: _isExpanded,
                          child: Column(
                            children: List.generate(
                              widget.data.length,
                              (index) => Container(
                                height: 60,
                                padding: const EdgeInsets.only(
                                  bottom: 15,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    _buildAmount(index),
                                    _buildPercentage(index),
                                    const Gap(2),
                                    _buildPercentageResult(index),
                                    _buildAmountYTD(index),
                                    _buildPercentageYTD(index),
                                    const Gap(2),
                                    _buildPercentageResultYTD(index),
                                  ],
                                ),
                              ),
                            ),
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
                        'EBITDA AREA ${widget.titleMarketing}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 400,
                    margin: const EdgeInsets.only(top: 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 45,
                          margin: const EdgeInsets.only(top: 20, right: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                width: 100,
                                padding: const EdgeInsets.only(
                                  bottom: 6,
                                ),
                                child: Text(
                                  dataSubtotal.format(0),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 91, 97, 118),
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 6,
                                  ),
                                  child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: theme.colorScheme.secondary,
                                    ),
                                    child: Tooltip(
                                      message: '% total month to date',
                                      child: Text(
                                        widget.percentageSubTotal(
                                          dataSubtotal,
                                          widget.title,
                                        ),
                                        style: const TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                                child: Text(
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
                                margin: const EdgeInsets.only(right: 10),
                                width: 100,
                                padding: const EdgeInsets.only(
                                  bottom: 6,
                                ),
                                child: Text(
                                  dataSubtotalYTD.format(0),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 91, 97, 118),
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 6,
                                  ),
                                  child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: theme.colorScheme.secondary,
                                    ),
                                    child: Tooltip(
                                      message: '% total years to date',
                                      child: Text(
                                        widget.percentageSubTotalYTD(
                                          dataSubtotalYTD,
                                          widget.title,
                                        ),
                                        style: const TextStyle(
                                          fontSize: 8,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                                child: Text(
                                  '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: _isExpanded,
                          child: Column(
                            children: List.generate(
                              widget.data.length,
                              (index) => Container(
                                height: 60,
                                padding: const EdgeInsets.only(
                                  bottom: 15,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    _buildAmount(index),
                                    _buildPercentage(index),
                                    const Gap(2),
                                    _buildPercentageResult(index),
                                    _buildAmountYTD(index),
                                    _buildPercentageYTD(index),
                                    const Gap(2),
                                    _buildPercentageResultYTD(index),
                                  ],
                                ),
                              ),
                            ),
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
                        'EBITDA AREA ${widget.titleMarketing}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height:
                        _isExpanded ? MediaQuery.of(context).size.height : 65,
                    width: 250,
                    margin: const EdgeInsets.only(top: 6),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      controller: widget.controller.addAndGet(),
                      key: UniqueKey(),
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 45,
                              margin: const EdgeInsets.only(top: 20, right: 4),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 100,
                                    padding: const EdgeInsets.only(
                                      bottom: 6,
                                    ),
                                    child: Text(
                                      dataSubtotal.format(0),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 91, 97, 118),
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 6,
                                      ),
                                      child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: theme.colorScheme.secondary,
                                        ),
                                        child: Tooltip(
                                          message: '% total month to date',
                                          child: Text(
                                            widget.percentageSubTotal(
                                              dataSubtotal,
                                              widget.title,
                                            ),
                                            style: const TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                    child: Text(
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
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 100,
                                    padding: const EdgeInsets.only(
                                      bottom: 6,
                                    ),
                                    child: Text(
                                      dataSubtotalYTD.format(0),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color.fromARGB(255, 91, 97, 118),
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 6,
                                      ),
                                      child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: theme.colorScheme.secondary,
                                        ),
                                        child: Tooltip(
                                          message: '% total years to date',
                                          child: Text(
                                            widget.percentageSubTotalYTD(
                                              dataSubtotalYTD,
                                              widget.title,
                                            ),
                                            style: const TextStyle(
                                              fontSize: 8,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                    child: Text(
                                      '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: _isExpanded,
                              child: Expanded(
                                child: Column(
                                  children: List.generate(
                                    widget.data.length,
                                    (index) => Container(
                                      height: 60,
                                      padding: const EdgeInsets.only(
                                        bottom: 15,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          _buildAmount(index),
                                          _buildPercentage(index),
                                          const Gap(2),
                                          _buildPercentageResult(index),
                                          _buildAmountYTD(index),
                                          _buildPercentageYTD(index),
                                          const Gap(2),
                                          _buildPercentageResultYTD(index),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
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
                        'EBITDA AREA ${widget.titleMarketing}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 250,
                    height:
                        _isExpanded ? MediaQuery.of(context).size.height : 65,
                    margin: const EdgeInsets.only(top: 6),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      controller: widget.controller.addAndGet(),
                      key: UniqueKey(),
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 45,
                              margin: const EdgeInsets.only(top: 20, right: 4),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 100,
                                    padding: const EdgeInsets.only(
                                      bottom: 6,
                                    ),
                                    child: Text(
                                      dataSubtotal.format(0),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 91, 97, 118),
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 6,
                                      ),
                                      child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: theme.colorScheme.secondary,
                                        ),
                                        child: Tooltip(
                                          message: '% total month to date',
                                          child: Text(
                                            widget.percentageSubTotal(
                                              dataSubtotal,
                                              widget.title,
                                            ),
                                            style: const TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                    child: Text(
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
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 100,
                                    padding: const EdgeInsets.only(
                                      bottom: 6,
                                    ),
                                    child: Text(
                                      dataSubtotalYTD.format(0),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color.fromARGB(255, 91, 97, 118),
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 6,
                                      ),
                                      child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: theme.colorScheme.secondary,
                                        ),
                                        child: Tooltip(
                                          message: '% total years to date',
                                          child: Text(
                                            widget.percentageSubTotalYTD(
                                              dataSubtotalYTD,
                                              widget.title,
                                            ),
                                            style: const TextStyle(
                                              fontSize: 8,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                    child: Text(
                                      '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: _isExpanded,
                              child: Expanded(
                                child: Column(
                                  children: List.generate(
                                    widget.data.length,
                                    (index) => Container(
                                      height: 60,
                                      padding: const EdgeInsets.only(
                                        bottom: 15,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          _buildAmount(index),
                                          _buildPercentage(index),
                                          const Gap(2),
                                          _buildPercentageResult(index),
                                          _buildAmountYTD(index),
                                          _buildPercentageYTD(index),
                                          const Gap(2),
                                          _buildPercentageResultYTD(index),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
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
                        'EBITDA AREA ${widget.titleMarketing}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 250,
                    height:
                        _isExpanded ? MediaQuery.of(context).size.height : 65,
                    margin: const EdgeInsets.only(top: 6),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      controller: widget.controller.addAndGet(),
                      key: UniqueKey(),
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 45,
                              margin: const EdgeInsets.only(top: 20, right: 4),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 100,
                                    padding: const EdgeInsets.only(
                                      bottom: 6,
                                    ),
                                    child: Text(
                                      dataSubtotal.format(0),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 91, 97, 118),
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 6,
                                      ),
                                      child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: theme.colorScheme.secondary,
                                        ),
                                        child: Tooltip(
                                          message: '% total month to date',
                                          child: Text(
                                            widget.percentageSubTotal(
                                              dataSubtotal,
                                              widget.title,
                                            ),
                                            style: const TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                    child: Text(
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
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 100,
                                    padding: const EdgeInsets.only(
                                      bottom: 6,
                                    ),
                                    child: Text(
                                      dataSubtotalYTD.format(0),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color.fromARGB(255, 91, 97, 118),
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 6,
                                      ),
                                      child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: theme.colorScheme.secondary,
                                        ),
                                        child: Tooltip(
                                          message: '% total years to date',
                                          child: Text(
                                            widget.percentageSubTotalYTD(
                                              dataSubtotalYTD,
                                              widget.title,
                                            ),
                                            style: const TextStyle(
                                              fontSize: 8,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                    child: Text(
                                      '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: _isExpanded,
                              child: Expanded(
                                child: Column(
                                  children: List.generate(
                                    widget.data.length,
                                    (index) => Container(
                                      height: 60,
                                      padding: const EdgeInsets.only(
                                        bottom: 15,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          _buildAmount(index),
                                          _buildPercentage(index),
                                          const Gap(2),
                                          _buildPercentageResult(index),
                                          _buildAmountYTD(index),
                                          _buildPercentageYTD(index),
                                          const Gap(2),
                                          _buildPercentageResultYTD(index),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
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
                        'EBITDA AREA ${widget.titleMarketing}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 250,
                    height:
                        _isExpanded ? MediaQuery.of(context).size.height : 65,
                    margin: const EdgeInsets.only(top: 6),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      controller: widget.controller.addAndGet(),
                      key: UniqueKey(),
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 45,
                              margin: const EdgeInsets.only(top: 20, right: 4),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 100,
                                    padding: const EdgeInsets.only(
                                      bottom: 6,
                                    ),
                                    child: Text(
                                      dataSubtotal.format(0),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 91, 97, 118),
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 6,
                                      ),
                                      child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: theme.colorScheme.secondary,
                                        ),
                                        child: Tooltip(
                                          message: '% total month to date',
                                          child: Text(
                                            widget.percentageSubTotal(
                                              dataSubtotal,
                                              widget.title,
                                            ),
                                            style: const TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                    child: Text(
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
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 100,
                                    padding: const EdgeInsets.only(
                                      bottom: 6,
                                    ),
                                    child: Text(
                                      dataSubtotalYTD.format(0),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color.fromARGB(255, 91, 97, 118),
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 6,
                                      ),
                                      child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: theme.colorScheme.secondary,
                                        ),
                                        child: Tooltip(
                                          message: '% total years to date',
                                          child: Text(
                                            widget.percentageSubTotalYTD(
                                              dataSubtotalYTD,
                                              widget.title,
                                            ),
                                            style: const TextStyle(
                                              fontSize: 8,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                    child: Text(
                                      '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: _isExpanded,
                              child: Expanded(
                                child: Column(
                                  children: List.generate(
                                    widget.data.length,
                                    (index) => Container(
                                      height: 60,
                                      padding: const EdgeInsets.only(
                                        bottom: 15,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          _buildAmount(index),
                                          _buildPercentage(index),
                                          const Gap(2),
                                          _buildPercentageResult(index),
                                          _buildAmountYTD(index),
                                          _buildPercentageYTD(index),
                                          const Gap(2),
                                          _buildPercentageResultYTD(index),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
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
                        'EBITDA AREA ${widget.titleMarketing}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 250,
                    height:
                        _isExpanded ? MediaQuery.of(context).size.height : 65,
                    margin: const EdgeInsets.only(top: 6),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      controller: widget.controller.addAndGet(),
                      key: UniqueKey(),
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 45,
                              margin: const EdgeInsets.only(top: 20, right: 4),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 100,
                                    padding: const EdgeInsets.only(
                                      bottom: 6,
                                    ),
                                    child: Text(
                                      dataSubtotal.format(0),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 91, 97, 118),
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 6,
                                      ),
                                      child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: theme.colorScheme.secondary,
                                        ),
                                        child: Tooltip(
                                          message: '% total month to date',
                                          child: Text(
                                            widget.percentageSubTotal(
                                              dataSubtotal,
                                              widget.title,
                                            ),
                                            style: const TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                    child: Text(
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
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 100,
                                    padding: const EdgeInsets.only(
                                      bottom: 6,
                                    ),
                                    child: Text(
                                      dataSubtotalYTD.format(0),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color.fromARGB(255, 91, 97, 118),
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 6,
                                      ),
                                      child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: theme.colorScheme.secondary,
                                        ),
                                        child: Tooltip(
                                          message: '% total years to date',
                                          child: Text(
                                            widget.percentageSubTotalYTD(
                                              dataSubtotalYTD,
                                              widget.title,
                                            ),
                                            style: const TextStyle(
                                              fontSize: 8,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                    child: Text(
                                      '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: _isExpanded,
                              child: Expanded(
                                child: Column(
                                  children: List.generate(
                                    widget.data.length,
                                    (index) => Container(
                                      height: 60,
                                      padding: const EdgeInsets.only(
                                        bottom: 15,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          _buildAmount(index),
                                          _buildPercentage(index),
                                          const Gap(2),
                                          _buildPercentageResult(index),
                                          _buildAmountYTD(index),
                                          _buildPercentageYTD(index),
                                          const Gap(2),
                                          _buildPercentageResultYTD(index),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
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
    );
  }

  Widget _buildCoaNo(int index) {
    return SizedBox(
      width: 70,
      child: Text(widget.data[index].coaNo),
    );
  }

  Widget _buildCoaName(int index) {
    return Expanded(
      child: Text(
        widget.data[index].coaName ==
                'MARKETING ADDITIONAL SALES DISCOUNT EXPENSE'
            ? 'MARKETING ADDITIONAL SALES DISCOUNT'
            : widget.data[index].coaName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(),
      ),
    );
  }

  Widget _buildAmount(int index) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 90,
      child: Text(
        widget.data[index].value.format(0),
        textAlign: TextAlign.right,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildAmountYTD(int index) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      width: 90,
      child: Text(
        widget.data[index].valueYTD.format(0),
        textAlign: TextAlign.right,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }

  SizedBox _buildPercentage(int index) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 30,
      child: Container(
        height: 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: theme.colorScheme.primary,
        ),
        child: Tooltip(
          message: '% per month to date',
          child: Text(
            '${widget.data[index].percent.toStringAsFixed(1)}%',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 8,
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _buildPercentageResult(int index) {
    final theme = Theme.of(context);
    if (widget.data[index].coaName.startsWith('COGS')) {
      return SizedBox(
        width: 30,
        child: Container(
          height: 15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: theme.colorScheme.primary.withOpacity(0.8),
          ),
          child: Tooltip(
            message: '% per sales category',
            child: Text(
              '${widget.data[index].percentResult.toStringAsFixed(1)}%',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 8,
              ),
            ),
          ),
        ),
      );
    } else {
      return const SizedBox(
        width: 30,
        child: Text(
          '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      );
    }
  }

  SizedBox _buildPercentageResultYTD(int index) {
    final theme = Theme.of(context);
    if (widget.data[index].coaName.startsWith('COGS')) {
      return SizedBox(
        width: 30,
        child: Container(
          height: 15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: theme.colorScheme.primary.withOpacity(0.8),
          ),
          child: Tooltip(
            message: '% per sales vs cogs',
            child: Text(
              '${widget.data[index].percentResultYTD.toStringAsFixed(1)}%',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 8,
              ),
            ),
          ),
        ),
      );
    } else {
      return const SizedBox(
        width: 30,
        child: Text(
          '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      );
    }
  }

  SizedBox _buildPercentageYTD(int index) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 30,
      child: Container(
        height: 15,
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Tooltip(
          message: '% per years to date',
          child: Text(
            '${widget.data[index].percentYTD.toStringAsFixed(1)}%',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 8,
            ),
          ),
        ),
      ),
    );
  }
}
