import 'package:app/screens/add_supplier_page.dart';
import 'package:app/screens/all_suppliers.dart';
import 'package:app/utils/app_color.dart';
import 'package:app/utils/supplier_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/home_model.dart';
import 'first_homebox.dart';

class FirstViewHome extends StatefulWidget {
  const FirstViewHome({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<FirstViewHome> createState() => _FirstViewHomeState();
}

class _FirstViewHomeState extends State<FirstViewHome> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Here are the various supplier\nactions you can undertake',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: widget.size.height * 0.05),
            ),
            SizedBox(
              height: widget.size.height * 0.04,
            ),
            Text(
              'We offer various tools enabling you\nto manage your suppliers effectively',
              style: GoogleFonts.prompt(
                  fontWeight: FontWeight.w500,
                  fontSize: widget.size.height * 0.03),
            ),
            SizedBox(
              height: widget.size.height * 0.04,
            ),
            Card(
              elevation: 15,
              color: AppColor.yellowColor,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.size.width * 0.015,
                  vertical: widget.size.height * 0.015,
                ),
                child: Row(
                  children: [
                    Text(
                      'Get started',
                      style: TextStyle(color: AppColor.whiteColor),
                    ),
                    SizedBox(
                      width: widget.size.width * 0.03,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      child: Center(
                        child: Icon(
                          Icons.arrow_right,
                          color: AppColor.yellowColor,
                        ),
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColor.whiteColor),
                    )
                  ],
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
            )
          ],
        ),
        Spacer(),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Wrap(
              spacing: widget.size.width * 0.02,
              runSpacing: widget.size.height * 0.02,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.start,
              verticalDirection: VerticalDirection.down,
              clipBehavior: Clip.hardEdge,
              children: List.generate(
                  firstHomeList.length,
                  (index) => InkWell(
                        onTap: () {
                          setState(() {
                            SupplierData.status = firstHomeList[index].name;
                          });
                          firstHomeList[index].name == 'Add supplier' ||
                                  firstHomeList[index].name == 'Update supplier'
                              ? Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AddSupplierPage()))
                              : null;
                        },
                        child: FirstHomeBox(
                            name: firstHomeList[index].name,
                            icon: firstHomeList[index].icon),
                      )),
            ),
            SizedBox(
              height: widget.size.height * 0.03,
            ),
            Wrap(
              spacing: widget.size.width * 0.02,
              runSpacing: widget.size.height * 0.02,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.start,
              verticalDirection: VerticalDirection.down,
              clipBehavior: Clip.hardEdge,
              children: List.generate(
                  secondHomeList.length,
                  (index) => InkWell(
                        onTap: () {
                          secondHomeList[index].name == 'All suppliers'
                              ? Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AllSuppliers()))
                              : null;
                        },
                        child: FirstHomeBox(
                            name: secondHomeList[index].name,
                            icon: secondHomeList[index].icon),
                      )),
            ),
          ],
        )
      ],
    );
  }
}
