import 'package:app/screens/add_supplier_submit.dart';
import 'package:app/screens/update_supplier_submit.dart';
import 'package:app/widgets/text_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protos/protos.dart';

import '../utils/app_color.dart';
import '../utils/supplier_data.dart';

class SmallUpdateSupplier extends StatefulWidget {
  final Supplier res;
  const SmallUpdateSupplier({Key? key, required this.res}) : super(key: key);

  @override
  State<SmallUpdateSupplier> createState() => _SmallUpdateSupplierState();
}

class _SmallUpdateSupplierState extends State<SmallUpdateSupplier> {
  final _addressFieldsForm = GlobalKey<FormState>();
  checkFields() {
    final form = _addressFieldsForm.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  TextEditingController cityController = TextEditingController();
  TextEditingController countryISO3Controller = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController street2Controller = TextEditingController();
  TextEditingController zipController = TextEditingController();
  String? city;
  String? countryISO3;
  String? firstName;
  String? houseNumber;
  String? lastName;
  String? street;
  String? street2;
  String? zip;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SupplierData.city = widget.res.address.city;
    cityController.text = widget.res.address.city;
    SupplierData.countryISO3 = widget.res.address.countryISO3;
    countryISO3Controller.text = widget.res.address.countryISO3;
    SupplierData.firstName = widget.res.address.firstName;
    firstNameController.text = widget.res.address.firstName;
    SupplierData.houseNumber = widget.res.address.houseNumber;
    houseNumberController.text = widget.res.address.houseNumber;
    SupplierData.lastName = widget.res.address.lastName;
    lastNameController.text = widget.res.address.lastName;
    SupplierData.street = widget.res.address.street;
    streetController.text = widget.res.address.street;
    SupplierData.street2 = widget.res.address.street2;
    street2Controller.text = widget.res.address.street2;
    SupplierData.zip = widget.res.address.zip;
    zipController.text = widget.res.address.zip;
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
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      shape: BoxShape.circle,
                      color: AppColor.yellowColor),
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
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Text('Address details',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
            SizedBox(
              height: size.height * 0.015,
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.1),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'city',
                    style: GoogleFonts.prompt(
                        fontWeight: FontWeight.w600,
                        color: AppColor.blackColor.withOpacity(0.6)),
                  )),
            ),
            TextBoxInput(
              width: size.width * 0.8,
              hintText: 'city',
              controller: cityController,
              validator: (value) =>
                  value!.isEmpty ? 'valid city is required' : null,
              onChanged: (value) {
                city = value;
                setState(() {
                  SupplierData.city = city;
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
                    'countryISO3',
                    style: GoogleFonts.prompt(
                        fontWeight: FontWeight.w600,
                        color: AppColor.blackColor.withOpacity(0.6)),
                  )),
            ),
            TextBoxInput(
              width: size.width * 0.8,
              controller: countryISO3Controller,
              hintText: 'countryISO3',
              validator: (value) =>
                  value!.isEmpty ? 'valid countryISO3 is required' : null,
              onChanged: (value) {
                countryISO3 = value;
                setState(() {
                  SupplierData.countryISO3 = countryISO3;
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
                    'first name',
                    style: GoogleFonts.prompt(
                        fontWeight: FontWeight.w600,
                        color: AppColor.blackColor.withOpacity(0.6)),
                  )),
            ),
            TextBoxInput(
              controller: firstNameController,
              width: size.width * 0.8,
              hintText: 'first name',
              validator: (value) =>
                  value!.isEmpty ? 'valid first name is required' : null,
              onChanged: (value) {
                firstName = value;
                setState(() {
                  SupplierData.firstName = firstName;
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
                    'house number',
                    style: GoogleFonts.prompt(
                        fontWeight: FontWeight.w600,
                        color: AppColor.blackColor.withOpacity(0.6)),
                  )),
            ),
            TextBoxInput(
              controller: houseNumberController,
              width: size.width * 0.8,
              hintText: 'house number',
              validator: (value) =>
                  value!.isEmpty ? 'valid house number is required' : null,
              onChanged: (value) {
                houseNumber = value;
                setState(() {
                  SupplierData.houseNumber = houseNumber;
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
                    'last name',
                    style: GoogleFonts.prompt(
                        fontWeight: FontWeight.w600,
                        color: AppColor.blackColor.withOpacity(0.6)),
                  )),
            ),
            TextBoxInput(
              controller: lastNameController,
              width: size.width * 0.8,
              hintText: 'last name',
              validator: (value) =>
                  value!.isEmpty ? 'valid house number is required' : null,
              onChanged: (value) {
                lastName = value;
                setState(() {
                  SupplierData.lastName = lastName;
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
                    'street',
                    style: GoogleFonts.prompt(
                        fontWeight: FontWeight.w600,
                        color: AppColor.blackColor.withOpacity(0.6)),
                  )),
            ),
            TextBoxInput(
              controller: streetController,
              width: size.width * 0.8,
              hintText: 'street',
              validator: (value) =>
                  value!.isEmpty ? 'valid street name is required' : null,
              onChanged: (value) {
                street = value;
                setState(() {
                  SupplierData.street = street;
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
                    'street2',
                    style: GoogleFonts.prompt(
                        fontWeight: FontWeight.w600,
                        color: AppColor.blackColor.withOpacity(0.6)),
                  )),
            ),
            TextBoxInput(
              controller: street2Controller,
              width: size.width * 0.8,
              hintText: 'street2',
              validator: (value) =>
                  value!.isEmpty ? 'valid street2 name is required' : null,
              onChanged: (value) {
                street2 = value;
                setState(() {
                  SupplierData.street2 = street2;
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
                    'zip',
                    style: GoogleFonts.prompt(
                        fontWeight: FontWeight.w600,
                        color: AppColor.blackColor.withOpacity(0.6)),
                  )),
            ),
            TextBoxInput(
              controller: zipController,
              width: size.width * 0.8,
              hintText: 'zip',
              validator: (value) =>
                  value!.isEmpty ? 'valid zip is required' : null,
              onChanged: (value) {
                zip = value;
                setState(() {
                  SupplierData.zip = zip;
                });
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  // print('wewe ${SupplierData.city}');
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UpdateSupplierSubmit(
                            res: widget.res,
                          )));
                },
                child: Container(
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
                        'Next',
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
