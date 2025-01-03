import 'package:flexurio_chiron_vendor/src/app/bloc/supplier/supplier_bloc.dart';
import 'package:flexurio_chiron_vendor/src/app/bloc/supplier_query/supplier_query_bloc.dart';
import 'package:flexurio_chiron_vendor/src/app/model/supplier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gap/gap.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:page_transition/page_transition.dart';

class SupplierCreatePage extends StatefulWidget {
  const SupplierCreatePage._(this.supplier);

  final Supplier? supplier;

  static Route<bool?> route({Supplier? supplier}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SupplierBloc()),
          BlocProvider(create: (context) => SupplierQueryBloc()),
        ],
        child: SupplierCreatePage._(supplier),
      ),
    );
  }

  @override
  State<SupplierCreatePage> createState() => _SupplierCreatePageState();
}

class _SupplierCreatePageState extends State<SupplierCreatePage> {
  late DataAction _action;
  final _formKey = GlobalKey<FormState>();

  final _idController = TextEditingController();
  final _termOfPaymentController = TextEditingController();
  final _nameController = TextEditingController();
  final _countryController = TextEditingController();
  final _cityController = TextEditingController();
  final _addressController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _phoneController = TextEditingController();
  final _faxController = TextEditingController();
  final _picController = TextEditingController();
  final _emailController = TextEditingController();
  final _npwpController = TextEditingController();

  final _idValidator = MultiValidator([
    RequiredValidator(errorText: pleaseFillOutThisField.tr()),
  ]);

  final _termOfPaymentValidator = MultiValidator([
    RequiredValidator(errorText: pleaseFillOutThisField.tr()),
    NonZeroPositiveNumberValidator(errorText: errorOnlyNumberValidator),
  ]);

  final _nameValidator = MultiValidator([
    RequiredValidator(errorText: pleaseFillOutThisField.tr()),
  ]);

  final _phoneValidator = MultiValidator([
    RequiredValidator(errorText: pleaseFillOutThisField.tr()),
    PhoneValidator(errorText: errorPhoneValidator),
  ]);

  final _emailValidator = MultiValidator([
    EmailValidator(errorText: errorEmailValidator),
  ]);

  final _countryValidator = MultiValidator([
    RequiredValidator(errorText: pleaseFillOutThisField.tr()),
  ]);

  final _cityValidator = MultiValidator([
    RequiredValidator(errorText: pleaseFillOutThisField.tr()),
  ]);

  final _postalCodeValidator = MultiValidator([
    PostalCodeValidator(errorText: errorPostalCodeValidator),
  ]);

  final _faxValidator = MultiValidator([
    FaxValidator(errorText: errorFaxValidator),
  ]);

  final _npwpValidator = MultiValidator([
    NpwpValidator(errorText: errorNpwpValidator),
  ]);

  @override
  void initState() {
    super.initState();
    _action = createOrEdit(widget.supplier);
    if (_action.isEdit) {
      _idController.text = widget.supplier!.id;
      _nameController.text = widget.supplier!.name;
      _addressController.text = widget.supplier!.address;
      // _city = widget.supplier!.city;
      // _country = widget.supplier!.country;
      _countryController.text = widget.supplier!.country;
      _cityController.text = widget.supplier!.city;
      _postalCodeController.text = widget.supplier!.postalCode == 0
          ? ''
          : widget.supplier!.postalCode.toString();
      _phoneController.text = widget.supplier!.phone;
      _faxController.text = widget.supplier!.fax;
      _picController.text = widget.supplier!.pic;
      _emailController.text = widget.supplier!.email;
      _npwpController.text =
          widget.supplier!.npwp == '-' ? '' : widget.supplier!.npwp;
      _termOfPaymentController.text = widget.supplier!.termOfPayment.toString();
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late SupplierEvent event;

      _action = createOrEdit(widget.supplier);
      if (_action.isEdit) {
        event = SupplierEvent.update(
          id: widget.supplier!.id,
          name: _nameController.text,
          address: _addressController.text,
          country: _countryController.text,
          city: _cityController.text,
          // city: _city,
          // country: _country,
          postalCode: _postalCodeController.text == ''
              ? 0
              : int.parse(_postalCodeController.text),
          phone: _phoneController.text,
          fax: _faxController.text,
          pic: _picController.text,
          email: _emailController.text,
          npwp: _npwpController.text,
          termOfPayment: int.parse(_termOfPaymentController.text),
        );
      } else {
        event = SupplierEvent.create(
          id: _idController.text,
          name: _nameController.text,
          address: _addressController.text,
          country: _countryController.text,
          city: _cityController.text,
          // city: _city,
          // country: _country,
          postalCode: _postalCodeController.text == ''
              ? 0
              : int.parse(_postalCodeController.text),
          phone: _phoneController.text,
          fax: _faxController.text,
          pic: _picController.text,
          email: _emailController.text,
          npwp: _npwpController.text,
          termOfPayment: int.parse(_termOfPaymentController.text),
        );
      }
      context.read<SupplierBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SupplierBloc, SupplierState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(_action, Entity.supplier);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          formKey: _formKey,
          action: _action,
          entity: Entity.supplier,
          actions: [
            BlocBuilder<SupplierBloc, SupplierState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  onPressed: _submit,
                  action: _action,
                );
              },
            ),
          ],
          children: [
            FTextFormField(
              labelText: 'ID',
              controller: _idController,
              validator: _idValidator.call,
              maxLength: 50,
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'Term of Payment',
              controller: _termOfPaymentController,
              validator: _termOfPaymentValidator.call,
              maxLength: 50,
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'Name',
              controller: _nameController,
              validator: _nameValidator.call,
              maxLength: 50,
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'Email',
              controller: _emailController,
              validator: _emailValidator.call,
              maxLength: 50,
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'Phone',
              controller: _phoneController,
              validator: _phoneValidator.call,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp('[0-9+-]')),
              ],
              maxLength: 50,
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'Postal Code',
              controller: _postalCodeController,
              validator: _postalCodeValidator.call,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 5,
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'Country',
              controller: _countryController,
              validator: _countryValidator.call,
              maxLength: 50,
            ),
            // FDropDownSearch<String>(
            //   initialValue: _action.isEdit ? widget.supplier!.country : null,
            //   // initialValue: _action.isEdit ? widget.supplier!.country : null,
            //   labelText: 'Country',
            //   items: exampleCountries,
            //   onChanged: (value) {
            //     if (value != null) {
            //       _country = value;
            //     }
            //   },
            //   itemAsString: (country) => country,
            //   validator: requiredObjectValidator.call,
            // ),
            const Gap(24),
            FTextFormField(
              labelText: 'City',
              controller: _cityController,
              validator: _cityValidator.call,
              maxLength: 50,
            ),
            // FDropDownSearch<String>(
            //   initialValue: _action.isEdit ? widget.supplier!.city : null,
            //   // initialValue: _action.isEdit ? widget.supplier!.city : null,
            //   labelText: 'City',
            //   items: exampleCities,
            //   onChanged: (value) {
            //     if (value != null) {
            //       _city = value;
            //     }
            //   },
            //   itemAsString: (city) => city,
            //   validator: requiredObjectValidator.call,
            // ),
            const Gap(24),
            FTextFormField(
              labelText: 'PIC',
              controller: _picController,
              validator: requiredValidator.call,
              maxLength: 50,
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'FAX',
              controller: _faxController,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp('[0-9+-]')),
              ],
              // MaskTextInputFormatter(
              //   // mask: '###-### ####',
              //   filter: {'#': RegExp('[0-9+-]')},
              // ),
              maxLength: 100,
              validator: _faxValidator.call,
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'NPWP',
              controller: _npwpController,
              inputFormatters: [
                MaskTextInputFormatter(
                  mask: '##.###.###.#-###.###',
                  filter: {'#': RegExp('[0-9]')},
                ),
              ],
              maxLength: 20,
              validator: _npwpValidator.call,
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'address'.tr(),
              controller: _addressController,
              validator: requiredValidator.call,
              maxLines: 5,
              maxLength: 500,
            ),
          ],
        ),
      ),
    );
  }
}
