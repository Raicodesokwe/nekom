import 'package:app/widgets/text_box.dart';
import 'package:flutter/material.dart';
import 'package:protos/protos.dart';

import '../utils/app_color.dart';
import '../utils/supplier_data.dart';
import 'drop_down_box.dart';

class MediumSubmit extends StatefulWidget {
  const MediumSubmit({Key? key}) : super(key: key);

  @override
  State<MediumSubmit> createState() => _MediumSubmitState();
}

class _MediumSubmitState extends State<MediumSubmit> {
  final _addressForm = GlobalKey<FormState>();
  checkFields() {
    final form = _addressForm.currentState;
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
              Spacer()
            ],
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Text('More details',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            children: [
              Spacer(),
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
              Spacer(),
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
                hintText: 'name1',
                validator: (value) =>
                    value!.isEmpty ? 'valid name1 is required' : null,
                onChanged: (value) {
                  name1 = value;
                },
              ),
              TextBoxInput(
                hintText: 'name2',
                // validator: (value) =>
                //     value!.isEmpty ? 'valid house number is required' : null,
                onChanged: (value) {
                  name2 = value;
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
                hintText: 'supplier ID',
                // validator: (value) =>
                //     value!.isEmpty ? 'valid house number is required' : null,
                onChanged: (value) {
                  supplierId = value;
                },
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
            ],
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                if (checkFields()) {}
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
        ],
      ),
    );
  }
}
