import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';

import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class CustomerCreatePage extends StatefulWidget {
  const CustomerCreatePage._(this.customer);

  final Customer? customer;

  static Route<bool?> route({Customer? customer}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CustomerBloc()),
          BlocProvider(create: (context) => CustomerQueryBloc()),
        ],
        child: CustomerCreatePage._(customer),
      ),
    );
  }

  @override
  State<CustomerCreatePage> createState() => _CustomerCreatePageState();
}

class _CustomerCreatePageState extends State<CustomerCreatePage> {
  final _formKey = GlobalKey<FormState>();

  final _idController = TextEditingController();
  final _parentController = TextEditingController();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _phoneController = TextEditingController();
  final _faxController = TextEditingController();
  final _picController = TextEditingController();
  final _emailController = TextEditingController();
  final _npwpController = TextEditingController();
  final _nppkpController = TextEditingController();
  final _termController = TextEditingController();
  final _discountController = TextEditingController();
  final _countryController = TextEditingController();
  bool? _isAdministration;
  late CustomerCategory _customerCategory;
  late CustomerType _customerType;

  final _nameValidator = MultiValidator([
    RequiredValidator(errorText: pleaseFillOutThisField.tr()),
  ]);

  final _npwpValidator = MultiValidator([
    RequiredValidator(errorText: pleaseFillOutThisField.tr()),
  ]);

  final _nppkpValidator = MultiValidator([
    RequiredValidator(errorText: pleaseFillOutThisField.tr()),
  ]);

  @override
  void initState() {
    super.initState();
    if (widget.customer != null) {
      _idController.text = widget.customer!.id;
      _parentController.text = widget.customer!.parent!;
      _nameController.text = widget.customer!.name;
      _addressController.text = widget.customer!.address;
      _countryController.text = widget.customer!.countryName;
      _postalCodeController.text = widget.customer!.postalCode.toString();
      _phoneController.text = widget.customer!.phone;
      _faxController.text = widget.customer!.fax;
      _picController.text = widget.customer!.pic;
      _emailController.text = widget.customer!.email;
      _npwpController.text = widget.customer!.npwp;
      _nppkpController.text = widget.customer!.nppkp;
      _termController.text = widget.customer!.termOfPayment.toString();
      _discountController.text = widget.customer!.discount!.toInt().toString();
      _isAdministration = widget.customer!.isAdministration;
      _customerCategory = widget.customer!.customerCategory;
      _customerType = widget.customer!.customerType;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late CustomerEvent event;

      bool? valueGet() {
        if (_isAdministration == null) {
          return false;
        } else {
          return _isAdministration;
        }
      }

      if (widget.customer != null) {
        event = CustomerEvent.update(
          customer: widget.customer!,
          name: _nameController.text,
          address: _addressController.text,
          country: _countryController.text,
          postalCode: stringToInt(_postalCodeController.text),
          phone: _phoneController.text,
          fax: _faxController.text,
          pic: _picController.text,
          email: _emailController.text,
          npwp: _npwpController.text,
          nppkp: _nppkpController.text,
          term: stringToInt(_termController.text),
          discount: stringToInt(_discountController.text),
          isAdministration: valueGet(),
          parent: _parentController.text,
          customerType: _customerType,
          customerCategory: _customerCategory,
        );
      } else {
        event = CustomerEvent.create(
          id: _idController.text,
          name: _nameController.text,
          address: _addressController.text,
          country: _countryController.text,
          postalCode: stringToInt(_postalCodeController.text),
          phone: _phoneController.text,
          fax: _faxController.text,
          pic: _picController.text,
          email: _emailController.text,
          npwp: _npwpController.text,
          nppkp: _nppkpController.text,
          term: stringToInt(_termController.text),
          discount: stringToInt(_discountController.text),
          isAdministration: valueGet(),
          parent: _parentController.text,
          customerType: _customerType,
          customerCategory: _customerCategory,
        );
      }
      context.read<CustomerBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    final action = createOrEdit(widget.customer);
    return BlocListener<CustomerBloc, CustomerState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(action, Entity.customer);
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
          action: action,
          entity: Entity.customer,
          actions: [
            BlocBuilder<CustomerBloc, CustomerState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  onPressed: _submit,
                  action: action,
                );
              },
            ),
          ],
          children: [
            FTextFormField(
              labelText: 'Name',
              controller: _nameController,
              validator: _nameValidator.call,
              maxLength: 50,
            ),
            const SizedBox(height: 24),
            RowFields(
              children: [
                FTextFormField(
                  labelText: 'Customer Code',
                  controller: _idController,
                  validator: requiredValidator.call,
                  maxLength: 5,
                ),
                FTextFormField(
                  labelText: 'Parent',
                  controller: _parentController,
                  validator: requiredValidator.call,
                  maxLength: 50,
                ),
              ],
            ),
            const SizedBox(height: 24),
            FDropDownSearch<CustomerCategory>(
              labelText: 'Category',
              itemAsString: (category) => category.id,
              initialValue: widget.customer?.customerCategory,
              items: const [
                CustomerCategory.cash,
                CustomerCategory.pbf,
              ],
              onChanged: (category) {
                if (category != null) {
                  _customerCategory = category;
                }
              },
            ),
            const SizedBox(height: 24),
            FDropDownSearch<CustomerType>(
              labelText: 'Type',
              itemAsString: (type) => type.id,
              initialValue: widget.customer?.customerType,
              items: const [
                CustomerType.tu,
                CustomerType.nonTu,
              ],
              onChanged: (type) {
                if (type != null) {
                  _customerType = type;
                }
              },
            ),
            const SizedBox(height: 24),
            FTextFormField(
              labelText: 'address'.tr(),
              controller: _addressController,
              validator: requiredValidator.call,
              maxLines: 5,
              maxLength: 500,
            ),
            const SizedBox(height: 24),
            FTextFormField(
              labelText: 'Country',
              controller: _countryController,
              validator: requiredValidator.call,
              maxLength: 50,
            ),
            const SizedBox(height: 24),
            FTextFormField(
              labelText: 'PIC',
              controller: _picController,
              maxLength: 50,
            ),
            const SizedBox(height: 24),
            RowFields(
              children: [
                FTextFormField(
                  labelText: 'Postal Code',
                  controller: _postalCodeController,
                  maxLength: 5,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                FTextFormField(
                  labelText: 'Phone',
                  controller: _phoneController,
                  maxLength: 13,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ],
            ),
            const SizedBox(height: 24),
            RowFields(
              children: [
                FTextFormField(
                  labelText: 'FAX',
                  controller: _faxController,
                  inputFormatters: [
                    MaskTextInputFormatter(
                      mask: '###-### ####',
                      filter: {'#': RegExp('[0-9]')},
                    ),
                  ],
                  maxLength: 12,
                ),
                FTextFormField(
                  labelText: 'Email',
                  controller: _emailController,
                  maxLength: 50,
                ),
              ],
            ),
            const SizedBox(height: 24),
            RowFields(
              children: [
                FTextFormField(
                  labelText: 'NPWP',
                  controller: _npwpController,
                  maxLength: 20,
                  validator: _npwpValidator.call,
                ),
                FTextFormField(
                  labelText: 'NPPKP',
                  controller: _nppkpController,
                  maxLength: 20,
                  validator: _nppkpValidator.call,
                ),
              ],
            ),
            const SizedBox(height: 24),
            RowFields(
              children: [
                FTextFormField(
                  labelText: 'Term of Payment',
                  controller: _termController,
                  validator: requiredValidator.call,
                  inputFormatters: [
                    ThousandsFormatter(),
                  ],
                  maxLength: 50,
                ),
                FTextFormField(
                  labelText: 'Discount',
                  controller: _discountController,
                  validator: requiredValidator.call,
                  maxLength: 50,
                  inputFormatters: [
                    ThousandsFormatter(),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            CheckboxWithText(
              initialValue: _isAdministration ?? false,
              text: 'Administration',
              onChanged: (value) {
                setState(() {
                  _isAdministration = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
