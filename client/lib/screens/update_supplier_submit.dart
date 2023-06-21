import 'package:app/utils/supplier_data.dart';
import 'package:app/widgets/large_submit_screen.dart';
import 'package:app/widgets/large_supplier_screen.dart';
import 'package:app/widgets/medium_submit.dart';
import 'package:app/widgets/medium_supplier.dart';
import 'package:app/widgets/small_submit_screen.dart';
import 'package:app/widgets/small_update_screen.dart';

import 'package:flutter/material.dart';
import 'package:protos/protos.dart';

import '../utils/app_color.dart';

class UpdateSupplierSubmit extends StatelessWidget {
  final Supplier res;
  const UpdateSupplierSubmit({Key? key, required this.res}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool more900 = size.width >= 900;
    bool less500 = size.width <= 500;
    bool less900 = size.width < 900;
    bool more1300 = size.width >= 1300;
    bool less1300 = size.width < 1300;
    return Scaffold(
        body: more900
            ? LargeSubmitScreen()
            : Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/nekomimage.png')),
                ),
                width: double.infinity,
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: size.height * 0.15,
                      backgroundColor: Colors.transparent,
                      centerTitle: true,
                      title: Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Text(
                          'Update supplier',
                          style: TextStyle(
                              color: AppColor.whiteColor,
                              fontSize: size.height * 0.03),
                        ),
                      ),
                    ),
                    SliverFillRemaining(
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.02,
                            ),
                            child: less500
                                ? SmallUpdateScreen(
                                    res: res,
                                  )
                                : MediumSubmit()),
                      ),
                    )
                  ],
                ),
              ));
  }
}
