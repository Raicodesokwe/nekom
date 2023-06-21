import 'package:app/widgets/text_box.dart';
import 'package:flutter/material.dart';
import 'package:protos/protos.dart';

import '../screens/add_supplier_submit.dart';
import '../utils/app_color.dart';
import '../utils/supplier_data.dart';

class MediumSupplier extends StatefulWidget {
  const MediumSupplier({Key? key}) : super(key: key);

  @override
  State<MediumSupplier> createState() => _MediumSupplierState();
}

class _MediumSupplierState extends State<MediumSupplier> {
  final _addressForm = GlobalKey<FormState>();
  checkFields() {
    final form = _addressForm.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  String? city;
  String? countryISO3;
  String? firstName;
  String? houseNumber;
  String? lastName;
  String? street;
  String? street2;
  String? zip;
  String? email;
  bool? internalSupplier;
  String? name1;
  String? name2;

  // Int64? shippingTime;
  String? supplierId;
  Supplyment? supplyment;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _addressForm,
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
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              ),
              Spacer()
            ],
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Text('Address details',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            children: [
              Spacer(),
              TextBoxInput(
                hintText: 'city',
                validator: (value) =>
                    value!.isEmpty ? 'valid city is required' : null,
                onChanged: (value) {
                  city = value;
                  setState(() {
                    SupplierData.city = city;
                  });
                },
              ),
              Spacer(),
              TextBoxInput(
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
              Spacer(),
            ],
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextBoxInput(
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
              TextBoxInput(
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
            ],
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextBoxInput(
                hintText: 'last name',
                validator: (value) =>
                    value!.isEmpty ? 'valid last name is required' : null,
                onChanged: (value) {
                  lastName = value;
                  setState(() {
                    SupplierData.lastName = lastName;
                  });
                },
              ),
              TextBoxInput(
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
            ],
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextBoxInput(
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
              TextBoxInput(
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
            ],
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                if (checkFields()) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddSupplierSubmit()));
                }
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
        ],
      ),
    );
  }
}
