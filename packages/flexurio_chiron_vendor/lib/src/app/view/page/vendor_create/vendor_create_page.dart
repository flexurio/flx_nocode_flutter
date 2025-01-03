import 'package:flexurio_chiron_vendor/src/app/bloc/vendor/vendor_bloc.dart';
import 'package:flexurio_chiron_vendor/src/app/bloc/vendor_query/vendor_query_bloc.dart';
import 'package:flexurio_chiron_vendor/src/app/model/vendors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gap/gap.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:page_transition/page_transition.dart';

class VendorCreatePage extends StatefulWidget {
  const VendorCreatePage._(this.vendor);

  final Vendor? vendor;

  static Route<bool?> route({Vendor? vendor}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => VendorBloc()),
          BlocProvider(create: (context) => VendorQueryBloc()),
        ],
        child: VendorCreatePage._(vendor),
      ),
    );
  }

  @override
  State<VendorCreatePage> createState() => _VendorCreatePageState();
}

class _VendorCreatePageState extends State<VendorCreatePage> {
  late DataAction _action;
  final _formKey = GlobalKey<FormState>();

  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _countryController = TextEditingController();
  final _cityController = TextEditingController();
  final _phoneController = TextEditingController();
  final _faxController = TextEditingController();
  final _picController = TextEditingController();
  final _emailController = TextEditingController();
  final _npwpController = TextEditingController();

  final _idValidator = MultiValidator([
    RequiredValidator(errorText: pleaseFillOutThisField.tr()),
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

  final _postalCodeValidator = MultiValidator([
    PostalCodeValidator(errorText: errorPostalCodeValidator),
  ]);

  final _countryValidator = MultiValidator([
    RequiredValidator(errorText: pleaseFillOutThisField.tr()),
  ]);

  final _cityValidator = MultiValidator([
    RequiredValidator(errorText: pleaseFillOutThisField.tr()),
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
    _action = createOrEdit(widget.vendor);
    if (_action.isEdit) {
      _idController.text = widget.vendor!.id;
      _nameController.text = widget.vendor!.name;
      _addressController.text = widget.vendor!.address;
      _postalCodeController.text = widget.vendor!.postalCode == 0
          ? ''
          : widget.vendor!.postalCode.toString();
      _phoneController.text = widget.vendor!.phone;
      _faxController.text = widget.vendor!.fax;
      _picController.text = widget.vendor!.pic;
      _emailController.text = widget.vendor!.email;
      _npwpController.text =
          widget.vendor!.npwp == '-' ? '' : widget.vendor!.npwp;
      // _city = widget.vendor!.city;
      // _country = widget.vendor!.country;
      _countryController.text = widget.vendor!.country;
      _cityController.text = widget.vendor!.city;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late VendorEvent event;

      if (_action.isEdit) {
        event = VendorEvent.update(
          id: widget.vendor!.id,
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
        );
      } else {
        event = VendorEvent.create(
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
        );
      }
      context.read<VendorBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VendorBloc, VendorState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(_action, Entity.vendor);
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
          entity: Entity.vendor,
          actions: [
            BlocBuilder<VendorBloc, VendorState>(
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
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
              ],
              maxLength: 50,
            ),
            // FDropDownSearch<String>(
            //   initialValue: _action.isEdit ? widget.vendor!.country : null,
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
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
              ],
              maxLength: 50,
            ),
            // FDropDownSearch<String>(
            //   initialValue: _action.isEdit ? widget.vendor!.city : null,
            //   labelText: 'City',
            //   items: exampleCities,
            //   onChanged: (value) {
            //     if (value != null) {
            //       _city = value;
            //     }
            //   },
            //   itemAsString: (vendorCity) => vendorCity,
            //   validator: requiredObjectValidator.call,
            // ),
            const Gap(24),
            FTextFormField(
              labelText: 'PIC',
              controller: _picController,
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
