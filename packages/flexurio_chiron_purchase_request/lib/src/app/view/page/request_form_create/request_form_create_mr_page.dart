import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail_query/request_form_detail_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail_temporary/request_form_detail_temporary_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form_create/widget/request_form_confirmation.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form_create/widget/request_form_input.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form_create/widget/request_form_select_group.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form_create/widget/request_form_select_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:appointment/src/app/resource/user_repository.dart';

class RequestFormCreateMRPage extends StatefulWidget {
  const RequestFormCreateMRPage._({
    required this.status,
  });

  final PurchaseRequestStatus status;

  static Route<bool?> route({required PurchaseRequestStatus status}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => RequestFormDetailQueryBloc()),
          BlocProvider(create: (context) => RequestFormDetailTemporaryBloc()),
          BlocProvider(
            create: (context) => DepartmentQueryBloc()
              ..add(
                DepartmentQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
        ],
        child: RequestFormCreateMRPage._(status: status),
      ),
    );
  }

  @override
  State<RequestFormCreateMRPage> createState() =>
      _RequestFormCreateMRPageState();
}

class _RequestFormCreateMRPageState extends State<RequestFormCreateMRPage> {
  var _page = 0;
  MaterialGroup _materialGroup = MaterialGroup.empty();
  Department _department =
      UserRepositoryApp.instance.department ?? Department.empty();
  String _description = '';
  bool _showMultiFormPageInput = false;

  final List<String> _pages = [
    'group'.tr(),
    'material'.tr(),
    'confirmation'.tr(),
  ];

  @override
  void initState() {
    super.initState();
    _page = 0;
    _showMultiFormPageInput = false;
  }

  void _nextPage() => setState(() => ++_page);
  void _previousPage() => setState(() => --_page);

  @override
  Widget build(BuildContext context) {
    const action = DataAction.createMR;
    final entity = Entity.requestForm;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleFormPanel(
        action: action,
        entity: entity,
        size: SingleFormPanelSize.extraLarge,
        children: [
          MultiForm(
            page: _page,
            titles: _pages,
            children: [
              RequestFormSelectGroup.prepare(
                onNext: _nextPage,
                onChangedMaterialGroup: (materialGroup) =>
                    _materialGroup = materialGroup,
                onChangedDescription: (description) =>
                    _description = description,
                onChangedDepartment: (department) => _department = department,
              ),
              RequestFormSelectMaterial.prepare(
                onNext: _nextPage,
                onPrevious: _previousPage,
                materialGroup: _materialGroup,
                department: _department,
                description: _description,
                onChanged: (value) {
                  setState(() {
                    _showMultiFormPageInput = value;
                    if (value == true) {
                      if (_pages.length == 3) {
                        _pages.insert(2, 'Input');
                      }
                    }
                  });
                },
              ),
              if (_showMultiFormPageInput)
                RequestFormInput(
                  onNext: _nextPage,
                  onPrevious: _previousPage,
                  materialGroup: _materialGroup,
                  department: _department,
                  description: _description,
                  bloc: context.read<RequestFormDetailTemporaryBloc>(),
                  onChanged: (value) {
                    setState(() {
                      _showMultiFormPageInput = value;
                      if (value == false) {
                        if (_pages.length == 4) {
                          _pages.removeAt(2);
                        }
                      }
                    });
                  },
                ),
              RequestFormConfirmation.prepare(
                onPrevious: _previousPage,
                materialGroup: _materialGroup,
                department: _department,
                description: _description,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
