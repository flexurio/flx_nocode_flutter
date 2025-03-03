// import 'package:flexurio_erp_core/flexurio_erp_core.dart';
// import 'package:flexurio_no_code/src/app/bloc/entity/entity_bloc.dart';
// import 'package:flexurio_no_code/src/app/model/entity.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class EntityDeleteButton extends StatelessWidget {
//   const EntityDeleteButton._({
//     required this.entity,
//     required this.data,
//     required this.onSuccess,
//   });

//   final Map<String, dynamic> data;
//   final VoidCallback onSuccess;

//   static Widget prepare({
//     required EntityCustom entity,
//     required Map<String, dynamic> data,
//     required VoidCallback onSuccess,
//   }) {
//     return BlocProvider(
//       create: (context) => EntityBloc(entity),
//       child: EntityDeleteButton._(
//           entity: entity, data: data, onSuccess: onSuccess),
//     );
//   }

//   final EntityCustom entity;

//   @override
//   Widget build(BuildContext context) {
//     return LightButton(
//       permission: null,
//       action: DataAction.delete,
//       onPressed: () async {
//         await _showConfirmationDialog(context);
//       },
//     );
//   }

// }
