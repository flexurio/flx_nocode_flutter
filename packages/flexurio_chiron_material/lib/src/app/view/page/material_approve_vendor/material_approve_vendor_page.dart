import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_material/src/app/view/page/material_approve_vendor/widget/material_approve_vendor_data_table.dart';
import 'package:flutter/material.dart';

class MaterialApproveVendorPage extends StatelessWidget {
  const MaterialApproveVendorPage._({required this.material});

  final model.Material material;

  static Route<void> route({
    required model.Material material,
  }) {
    return MaterialPageRoute(
      builder: (context) => MaterialApproveVendorPage._(
        material: material,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        children: [
          Row(
            children: [
              const BackButton(),
              const SizedBox(width: 8),
              Text(
                '${material.name} Supplier List',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: MaterialApproveVendorDataTable.prepare(
              material: material,
            ),
          ),
        ],
      ),
    );
  }
}
