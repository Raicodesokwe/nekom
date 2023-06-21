import 'package:app/widgets/drop_down_box.dart';
import 'package:app/widgets/failed_dialog.dart';
import 'package:app/widgets/success_dialog.dart';
import 'package:app/widgets/text_box.dart';
import 'package:flutter/material.dart';
import 'package:protos/protos.dart';

import '../utils/app_color.dart';
import '../utils/supplier_data.dart';

class LargeSubmitScreen extends StatefulWidget {
  const LargeSubmitScreen({Key? key}) : super(key: key);

  @override
  State<LargeSubmitScreen> createState() => _LargeSubmitScreenState();
}

class _LargeSubmitScreenState extends State<LargeSubmitScreen> {
  final _moreDetailsForm = GlobalKey<FormState>();
  checkFields() {
    final form = _moreDetailsForm.currentState;
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
  String? email;
  bool? checkTrue;
  String? name1;
  String? name2;
  String? supplierId;
  Supplyment? supplyment;
  // void addSupplier() async {
  //   try {
  //     final res =
  //         .then((p0) => null);

  //     print('res is is ${res.supplier.email}');
  //   } on GrpcError catch (e) {
  //     // TODO
  //     print('Erick error is $e');
  //   }
  // }

  // Int64? shippingTime;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(SupplierData.status == 'Add supplier'
                    ? 'assets/images/addsupplier.png'
                    : 'assets/images/updatesupplier.png')),
          ),
          width: size.width * 0.5,
        ),
        Spacer(),
        SingleChildScrollView(
          child: Form(
            key: _moreDetailsForm,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text('More details',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
                TextBoxInput(
                  hintText: 'email',
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
                DropDownWidget(
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
                TextBoxInput(
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
                TextBoxInput(
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
                TextBoxInput(
                  hintText: 'supplier ID',
                  // validator: (value) =>
                  //     value!.isEmpty ? 'valid house number is required' : null,
                  onChanged: (value) {
                    supplierId = value;
                  },
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                DropDownWidget(
                  hintText: 'supplyment',
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
                GestureDetector(
                  onTap: () async {
                    if (checkFields()) {
                      await SupplierData.stub!
                          .addSupplier(AddSupplierRequest(
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
                                      : Supplyment.CROSS_DOCKING)
                              // ..address.city = SupplierData.city!
                              // ..address.countryISO3 = SupplierData.countryISO3!
                              // ..address.firstName = SupplierData.firstName!
                              // ..address.houseNumber = SupplierData.houseNumber!
                              // ..address.lastName = SupplierData.lastName!
                              // ..address.street = SupplierData.street!
                              // ..address.street2 = SupplierData.street2!
                              // ..address.zip = SupplierData.zip!

                              )
                          .then((value) => {
                                if (value.metaResponse.success)
                                  {
                                    showDialog(
                                        context: context,
                                        builder: (ctx) {
                                          return SuccessDialog(
                                              message: SupplierData.status ==
                                                      'Add supplier'
                                                  ? 'Successfully added a supplier'
                                                  : 'Successfully updated the supplier');
                                        })
                                  }
                                else
                                  {
                                    showDialog(
                                        context: context,
                                        builder: (ctx) {
                                          return FailedDialog(
                                              message:
                                                  'Request was unsuccessful\n${value.metaResponse.errorMessage}');
                                        })
                                  }
                              });
                    }
                  },
                  child: Center(
                    child: Container(
                      height: 50,
                      width: size.width * 0.17,
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
        ),
        Spacer(),
      ],
    );
  }
}
