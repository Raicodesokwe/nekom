import 'package:app/utils/stub_channel.dart';
import 'package:app/widgets/success_dialog.dart';
import 'package:app/widgets/text_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protos/protos.dart';
import 'package:shimmer/shimmer.dart';

import '../request_interceptors.dart';
import '../utils/app_color.dart';
import '../utils/supplier_data.dart';
import 'drop_down_box.dart';
import 'failed_dialog.dart';

class SmallUpdateScreen extends StatefulWidget {
  final Supplier res;
  const SmallUpdateScreen({Key? key, required this.res}) : super(key: key);

  @override
  State<SmallUpdateScreen> createState() => _SmallUpdateScreenState();
}

class _SmallUpdateScreenState extends State<SmallUpdateScreen> {
  final _addressFieldsForm = GlobalKey<FormState>();
  bool isLoading = false;
  checkFields() {
    final form = _addressFieldsForm.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  List<String> dropDownData = ['true', 'false'];
  List<String> dropDownDataTwo = ['CENTRAL', 'CROSS-DOCKING'];
  String? selectedValue;
  String? selectedValueTwo;
  TextEditingController emailController = TextEditingController();
  String? email;

  bool? internalSupplier;
  String? name1;
  TextEditingController name1Controller = TextEditingController();
  String? name2;
  TextEditingController name2Controller = TextEditingController();
  String? uuid;

  // Int64? shippingTime;
  String? supplierId;
  TextEditingController supplierIdController = TextEditingController();
  Supplyment? supplyment;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email = widget.res.email;
    emailController.text = widget.res.email;
    name1 = widget.res.name1;
    name1Controller.text = widget.res.name1;
    name2 = widget.res.name2;
    name2Controller.text = widget.res.name2;
    selectedValue = widget.res.internalSupplier ? 'true' : 'false';
    selectedValueTwo = widget.res.supplyment == Supplyment.CENTRAL
        ? 'CENTRAL'
        : 'CROSS-DOCKING';
    supplyment = widget.res.supplyment;
    supplierId = widget.res.supplierId;
    supplierIdController.text = widget.res.supplierId;
    uuid = widget.res.uuid;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Form(
        key: _addressFieldsForm,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Spacer(),
                Container(
                  height: 70,
                  width: 70,
                  child: Center(
                    child: Text(
                      '1',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      shape: BoxShape.circle,
                      color: Colors.black),
                ),
                Container(
                  width: size.width * 0.3,
                  height: 2,
                  color: Colors.black,
                ),
                Container(
                  height: 70,
                  width: 70,
                  child: Center(
                    child: Text(
                      '2',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColor.yellowColor),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Text('More details',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
            SizedBox(
              height: size.height * 0.015,
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.1),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'email',
                    style: GoogleFonts.prompt(
                        fontWeight: FontWeight.w600,
                        color: AppColor.blackColor.withOpacity(0.6)),
                  )),
            ),
            TextBoxInput(
              width: size.width * 0.8,
              hintText: 'email',
              controller: emailController,
              // validator: (value) =>
              //     !value!.contains('@') || !value.contains('.')
              //         ? 'valid email is required'
              //         : null,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.1),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'internal supplier',
                    style: GoogleFonts.prompt(
                        fontWeight: FontWeight.w600,
                        color: AppColor.blackColor.withOpacity(0.6)),
                  )),
            ),
            DropDownWidget(
              width: size.width * 0.8,
              hintText: 'internal supplier',
              dropdownData: dropDownData,
              selectedValue: selectedValue,
              onChanged: (newVal) {
                setState(() {
                  selectedValue = newVal;
                });
              },
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.1),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'name1',
                    style: GoogleFonts.prompt(
                        fontWeight: FontWeight.w600,
                        color: AppColor.blackColor.withOpacity(0.6)),
                  )),
            ),
            TextBoxInput(
              width: size.width * 0.8,
              controller: name1Controller,
              hintText: 'name1',
              validator: (value) =>
                  value!.isEmpty ? 'valid name1 is required' : null,
              onChanged: (value) {
                name1 = value;
              },
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.1),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'name2',
                    style: GoogleFonts.prompt(
                        fontWeight: FontWeight.w600,
                        color: AppColor.blackColor.withOpacity(0.6)),
                  )),
            ),
            TextBoxInput(
              width: size.width * 0.8,
              controller: name2Controller,
              hintText: 'name2',
              // validator: (value) =>
              //     value!.isEmpty ? 'valid house number is required' : null,
              onChanged: (value) {
                name2 = value;
              },
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.1),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'supplier ID',
                    style: GoogleFonts.prompt(
                        fontWeight: FontWeight.w600,
                        color: AppColor.blackColor.withOpacity(0.6)),
                  )),
            ),
            TextBoxInput(
              width: size.width * 0.8,
              hintText: 'supplier ID',
              controller: supplierIdController,
              // validator: (value) =>
              //     value!.isEmpty ? 'valid house number is required' : null,
              onChanged: (value) {
                supplierId = value;
              },
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.1),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'supplyment',
                    style: GoogleFonts.prompt(
                        fontWeight: FontWeight.w600,
                        color: AppColor.blackColor.withOpacity(0.6)),
                  )),
            ),
            DropDownWidget(
              hintText: 'supplyment',
              width: size.width * 0.8,
              dropdownData: dropDownDataTwo,
              selectedValue: selectedValueTwo,
              onChanged: (newVal) {
                setState(() {
                  selectedValueTwo = newVal;
                });
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  if (checkFields()) {
                    setState(() {
                      isLoading = true;
                    });
                    await StubChannel()
                        .stub
                        .updateSupplier(
                          UpdateSupplierRequest(
                              address: SupplierAddress(
                                  city: SupplierData.city!,
                                  countryISO3: SupplierData.countryISO3!,
                                  firstName: SupplierData.firstName!,
                                  houseNumber: SupplierData.houseNumber!,
                                  lastName: SupplierData.lastName!,
                                  street: SupplierData.street!,
                                  street2: SupplierData.street2!,
                                  zip: SupplierData.zip!),
                              email: email!,
                              internalSupplier:
                                  selectedValue == 'true' ? true : false,
                              name1: name1!,
                              name2: name2!,
                              // ..shippingTime=shippingTime!
                              supplierId: supplierId!,
                              supplyment: selectedValue == 'CENTRAL'
                                  ? Supplyment.CENTRAL
                                  : Supplyment.CROSS_DOCKING,
                              uuid: uuid),

                          // ..address.city = SupplierData.city!
                          // ..address.countryISO3 = SupplierData.countryISO3!
                          // ..address.firstName = SupplierData.firstName!
                          // ..address.houseNumber = SupplierData.houseNumber!
                          // ..address.lastName = SupplierData.lastName!
                          // ..address.street = SupplierData.street!
                          // ..address.street2 = SupplierData.street2!
                          // ..address.zip = SupplierData.zip!
                        )
                        .then((value) {
                      setState(() {
                        isLoading = false;
                      });
                      if (value.metaResponse.success) {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return SuccessDialog(
                                  message: SupplierData.status == 'Add supplier'
                                      ? 'Successfully added a supplier'
                                      : 'Successfully updated the supplier');
                            });
                      } else {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return FailedDialog(
                                  message:
                                      'Request was unsuccessful\n${value.metaResponse.errorMessage}');
                            });
                      }
                    });
                  }
                },
                child: isLoading
                    ? Shimmer.fromColors(
                        child: Container(
                          height: 50,
                          width: size.width * 0.4,
                          decoration: BoxDecoration(
                              color: AppColor.greenColor.withOpacity(0.8),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                        ),
                        baseColor: AppColor.greenColor.withOpacity(0.6),
                        highlightColor: AppColor.greenColor.withOpacity(0.4),
                      )
                    : Container(
                        height: 50,
                        width: size.width * 0.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Submit',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: AppColor.greenColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20))),
                      ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
