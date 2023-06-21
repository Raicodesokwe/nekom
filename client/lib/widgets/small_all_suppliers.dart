import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protos/protos.dart';

import '../screens/update_supplier_page.dart';
import '../screens/view_supplier_page.dart';
import '../utils/app_color.dart';
import '../utils/supplier_data.dart';

class SmallAllSuppliersScreen extends StatefulWidget {
  List<Supplier> res;
  SmallAllSuppliersScreen({Key? key, required this.res}) : super(key: key);

  @override
  State<SmallAllSuppliersScreen> createState() =>
      _SmallAllSuppliersScreenState();
}

class _SmallAllSuppliersScreenState extends State<SmallAllSuppliersScreen> {
  List<Supplier>? searchedProducts;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    searchedProducts = widget.res;
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: searchedProducts!.length,
        itemBuilder: (ctx, index) {
          final utu = searchedProducts![index];
          return Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      child: Center(
                        child: Icon(
                          Icons.person,
                          color: AppColor.whiteColor,
                          size: 25,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.greenColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                            topRight: Radius.circular(8)),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('name:',
                                style: GoogleFonts.prompt(
                                    fontWeight: FontWeight.w600)),
                            SizedBox(
                              width: size.width * 0.4,
                              child: Text(
                                '${searchedProducts![index].address.firstName} ${searchedProducts![index].address.lastName}',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: GoogleFonts.prompt(),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('street:',
                                style: GoogleFonts.prompt(
                                    fontWeight: FontWeight.w600)),
                            SizedBox(
                              width: size.width * 0.4,
                              child: Text(
                                searchedProducts![index].address.street,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: GoogleFonts.prompt(),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('house number:',
                                style: GoogleFonts.prompt(
                                    fontWeight: FontWeight.w600)),
                            SizedBox(
                              width: size.width * 0.3,
                              child: Text(
                                searchedProducts![index].address.houseNumber,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: GoogleFonts.prompt(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ViewSupplierPage(
                                      res: utu,
                                    )));
                          },
                          child: Icon(
                            Icons.remove_red_eye,
                            color: AppColor.yellowColor,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => AddSupplierPage()));
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UpdateSupplierPage(
                                      res: utu,
                                    )));
                          },
                          child: Icon(
                            Icons.edit,
                            size: 30,
                            color: AppColor.yellowColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ));
        });
  }
}
