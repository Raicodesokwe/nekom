import 'package:app/models/home_model.dart';
import 'package:app/request_interceptors.dart';
import 'package:app/utils/supplier_data.dart';
import 'package:app/widgets/first_homebox.dart';
import 'package:app/widgets/second_homebox.dart';
import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../widgets/first_view_home.dart';
import '../widgets/second_view_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool more900 = size.width >= 970;
    bool less900 = size.width < 900;
    bool more1300 = size.width >= 1300;
    bool less1300 = size.width < 1300;
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/nekomimage.png')),
        ),
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.015),
            child: Card(
              elevation: 7,
              color: AppColor.whiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.02,
                    vertical: size.height * 0.035),
                child: more900
                    ? FirstViewHome(size: size)
                    : SecondViewHome(size: size),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
