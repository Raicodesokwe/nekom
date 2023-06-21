import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protos/protos.dart';

import '../utils/app_color.dart';

class SmallViewSupplier extends StatefulWidget {
  Supplier res;
  SmallViewSupplier({Key? key, required this.res}) : super(key: key);

  @override
  State<SmallViewSupplier> createState() => _SmallViewSupplierState();
}

class _SmallViewSupplierState extends State<SmallViewSupplier> {
  bool isVisible = true;
  bool isVisibleTwo = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            ActionChip(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              elevation: 10,
              pressElevation: 7,
              label: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Address Details',
                    style: TextStyle(
                        fontSize: size.height * 0.025,
                        color: AppColor.whiteColor),
                  ),
                  isVisible
                      ? RotatedBox(
                          quarterTurns: 1,
                          child: Icon(
                            Icons.arrow_right,
                            color: AppColor.whiteColor,
                          ),
                        )
                      : Icon(
                          Icons.arrow_right,
                          color: AppColor.whiteColor,
                        )
                ],
              ),
              backgroundColor: AppColor.greenColor,
            ),
            Divider(),
            isVisible
                ? Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Center(
                              child: Icon(
                                Icons.person,
                                color: AppColor.whiteColor,
                                size: 25,
                              ),
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                AppColor.greenColor,
                                AppColor.yellowColor,
                              ]),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text('name: ',
                              style: GoogleFonts.prompt(
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: size.width * 0.6,
                            child: Text(
                              '${widget.res.address.firstName} ${widget.res.address.lastName}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.prompt(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Center(
                              child: Icon(
                                FontAwesomeIcons.streetView,
                                color: AppColor.whiteColor,
                                size: 20,
                              ),
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                AppColor.greenColor,
                                AppColor.yellowColor,
                              ]),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text('street: ',
                              style: GoogleFonts.prompt(
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: size.width * 0.6,
                            child: Text(
                              widget.res.address.street,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.prompt(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Center(
                              child: Icon(
                                FontAwesomeIcons.house,
                                color: AppColor.whiteColor,
                                size: 15,
                              ),
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                AppColor.greenColor,
                                AppColor.yellowColor,
                              ]),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text('house number: ',
                              style: GoogleFonts.prompt(
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: size.width * 0.45,
                            child: Text(
                              widget.res.address.houseNumber,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.prompt(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Center(
                              child: Icon(
                                FontAwesomeIcons.streetView,
                                color: AppColor.whiteColor,
                                size: 20,
                              ),
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                AppColor.greenColor,
                                AppColor.yellowColor,
                              ]),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text('street2: ',
                              style: GoogleFonts.prompt(
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: size.width * 0.6,
                            child: Text(
                              widget.res.address.street2,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.prompt(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Center(
                              child: Icon(
                                FontAwesomeIcons.envelopeOpen,
                                color: AppColor.whiteColor,
                                size: 20,
                              ),
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                AppColor.greenColor,
                                AppColor.yellowColor,
                              ]),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text('zip: ',
                              style: GoogleFonts.prompt(
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: size.width * 0.6,
                            child: Text(
                              widget.res.address.zip,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.prompt(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Center(
                              child: Icon(
                                FontAwesomeIcons.city,
                                color: AppColor.whiteColor,
                                size: 15,
                              ),
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                AppColor.greenColor,
                                AppColor.yellowColor,
                              ]),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text('city: ',
                              style: GoogleFonts.prompt(
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: size.width * 0.6,
                            child: Text(
                              widget.res.address.city,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.prompt(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Center(
                              child: Icon(
                                FontAwesomeIcons.tag,
                                color: AppColor.whiteColor,
                                size: 20,
                              ),
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                AppColor.greenColor,
                                AppColor.yellowColor,
                              ]),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text('countryISO3: ',
                              style: GoogleFonts.prompt(
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: size.width * 0.5,
                            child: Text(
                              widget.res.address.countryISO3,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.prompt(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                    ],
                  )
                : Container(),
            ActionChip(
              onPressed: () {
                setState(() {
                  isVisibleTwo = !isVisibleTwo;
                });
              },
              elevation: 10,
              pressElevation: 7,
              label: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'More Details',
                    style: TextStyle(
                        fontSize: size.height * 0.025,
                        color: AppColor.whiteColor),
                  ),
                  isVisibleTwo
                      ? RotatedBox(
                          quarterTurns: 1,
                          child: Icon(
                            Icons.arrow_right,
                            color: AppColor.whiteColor,
                          ),
                        )
                      : Icon(
                          Icons.arrow_right,
                          color: AppColor.whiteColor,
                        )
                ],
              ),
              backgroundColor: AppColor.greenColor,
            ),
            Divider(),
            isVisibleTwo
                ? Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Center(
                              child: Icon(
                                Icons.person,
                                color: AppColor.whiteColor,
                                size: 25,
                              ),
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                AppColor.greenColor,
                                AppColor.yellowColor,
                              ]),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text('name1: ',
                              style: GoogleFonts.prompt(
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: size.width * 0.6,
                            child: Text(
                              widget.res.name1,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.prompt(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Center(
                              child: Icon(
                                FontAwesomeIcons.person,
                                color: AppColor.whiteColor,
                                size: 20,
                              ),
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                AppColor.greenColor,
                                AppColor.yellowColor,
                              ]),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text('name2: ',
                              style: GoogleFonts.prompt(
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: size.width * 0.6,
                            child: Text(
                              widget.res.name2,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.prompt(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Center(
                              child: Icon(
                                Icons.email,
                                color: AppColor.whiteColor,
                                size: 15,
                              ),
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                AppColor.greenColor,
                                AppColor.yellowColor,
                              ]),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text('email: ',
                              style: GoogleFonts.prompt(
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: size.width * 0.45,
                            child: Text(
                              widget.res.email,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.prompt(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Center(
                              child: Icon(
                                FontAwesomeIcons.tag,
                                color: AppColor.whiteColor,
                                size: 20,
                              ),
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                AppColor.greenColor,
                                AppColor.yellowColor,
                              ]),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text('supplier ID: ',
                              style: GoogleFonts.prompt(
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: size.width * 0.5,
                            child: Text(
                              widget.res.supplierId,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.prompt(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Center(
                              child: Icon(
                                FontAwesomeIcons.shop,
                                color: AppColor.whiteColor,
                                size: 15,
                              ),
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                AppColor.greenColor,
                                AppColor.yellowColor,
                              ]),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text('Internal supplier: ',
                              style: GoogleFonts.prompt(
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: size.width * 0.4,
                            child: Text(
                              widget.res.internalSupplier ? 'yes' : 'no',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.prompt(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Center(
                              child: Icon(
                                FontAwesomeIcons.trailer,
                                color: AppColor.whiteColor,
                                size: 15,
                              ),
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                AppColor.greenColor,
                                AppColor.yellowColor,
                              ]),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text('supplyment: ',
                              style: GoogleFonts.prompt(
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: size.width * 0.5,
                            child: Text(
                              widget.res.supplyment == Supplyment.CENTRAL
                                  ? 'central'
                                  : 'cross-docking',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.prompt(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Container(),
            SizedBox(
              height: size.height * 0.025,
            ),
          ],
        ),
      ),
    );
  }
}
