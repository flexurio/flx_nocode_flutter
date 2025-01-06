import 'package:appointment/src/app/model/configuration.dart' as configuration;
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MenuHome extends StatelessWidget {
  const MenuHome({
    super.key,
    required this.entity,
  });

  final configuration.Entity entity;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePageCustom(
          title: entity.label,
          subtitle: 'ipsum dolor sit amet',
          iconPath: 'bill',
        ),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: MaterialDataTable(isExternal: isExternal),
        ),
      ],
    );
  }
}
