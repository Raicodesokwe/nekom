import 'package:app/utils/stub_channel.dart';

import 'package:app/widgets/medium_submit.dart';
import 'package:app/widgets/medium_supplier.dart';
import 'package:app/widgets/small_all_suppliers.dart';
import 'package:flutter/src/widgets/async.dart' as co;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protos/protos.dart';
import 'package:shimmer/shimmer.dart';

import '../request_interceptors.dart';
import '../utils/app_color.dart';
import '../widgets/large_all_suppliers.dart';

class SearchSuppliers extends StatefulWidget {
  const SearchSuppliers({Key? key}) : super(key: key);

  @override
  State<SearchSuppliers> createState() => _SearchSuppliersState();
}

class _SearchSuppliersState extends State<SearchSuppliers> {
  List<Supplier>? searchedProducts;
  String? uuid;
  SupplierResponse? resTwo;
  bool isSearchOn = false;
  TextEditingController controller = TextEditingController();

  Future<SupplierResponse>? getSupplier;
  Future<SupplierResponse> getOneSupplier(String? uuid) async {
    try {
      resTwo =
          await StubChannel().stub.getSupplier(SupplierUuidRequest(uuid: uuid));

      // print('res is is ${res}');
      return resTwo!;
    } on GrpcError catch (e) {
      // TODO
      print('Erick error is $e');
    }
    return resTwo!;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getSupplier = getAllSupplier();
  }

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKeyFive =
      GlobalKey<RefreshIndicatorState>();

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
            ? LargeAllSuppliers()
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
                          'Search suppliers',
                          style: TextStyle(
                              color: AppColor.whiteColor,
                              fontSize: size.height * 0.03),
                        ),
                      ),
                      flexibleSpace: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Card(
                            color: AppColor.whiteColor,
                            elevation: 12,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                controller: controller,
                                // validator: validator,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  uuid = value;
                                },
                                onFieldSubmitted: (value) {
                                  if (value.isNotEmpty) {
                                    setState(() {
                                      getSupplier = getOneSupplier(value);
                                      isSearchOn = true;
                                    });
                                  } else {
                                    setState(() {
                                      isSearchOn = false;
                                    });
                                  }
                                },

                                cursorColor: Colors.black54,
                                style:
                                    GoogleFonts.prompt(color: Colors.black54),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.search),
                                    hintText: 'search by uuid',
                                    hintStyle: GoogleFonts.prompt(
                                        color: Colors.black54),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
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
                                ? (!isSearchOn
                                    ? Center(
                                        child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.person),
                                          Text(
                                            'No suppliers',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ))
                                    : FutureBuilder(
                                        future: getSupplier,
                                        builder: (context,
                                            AsyncSnapshot<SupplierResponse>
                                                snapshot) {
                                          if (snapshot.hasError) {
                                            return Center(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.person),
                                                Text(
                                                  'No suppliers',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 18),
                                                ),
                                              ],
                                            ));
                                          } else if (!snapshot.hasData ||
                                              snapshot.connectionState ==
                                                  co.ConnectionState.waiting) {
                                            return Shimmer.fromColors(
                                              child: Container(
                                                width: double.infinity,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                    color: AppColor.greenColor
                                                        .withOpacity(0.7),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                              ),
                                              baseColor: AppColor.greenColor
                                                  .withOpacity(0.5),
                                              highlightColor: AppColor
                                                  .greenColor
                                                  .withOpacity(0.3),
                                            );
                                          } else {
                                            final searchProduct =
                                                snapshot.data!.supplier;
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Card(
                                                    elevation: 10,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12)),
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20,
                                                        vertical: 7),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Container(
                                                            height: 50,
                                                            width: 50,
                                                            child: Center(
                                                              child: Icon(
                                                                Icons.person,
                                                                color: AppColor
                                                                    .whiteColor,
                                                                size: 25,
                                                              ),
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: AppColor
                                                                  .greenColor,
                                                              borderRadius: BorderRadius.only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          8),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          8),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          8)),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text('name:',
                                                                      style: GoogleFonts.prompt(
                                                                          fontWeight:
                                                                              FontWeight.w600)),
                                                                  SizedBox(
                                                                    width:
                                                                        size.width *
                                                                            0.4,
                                                                    child: Text(
                                                                      '${searchProduct.address.firstName} ${searchProduct.address.lastName}',
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      maxLines:
                                                                          1,
                                                                      style: GoogleFonts
                                                                          .prompt(),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                      'street:',
                                                                      style: GoogleFonts.prompt(
                                                                          fontWeight:
                                                                              FontWeight.w600)),
                                                                  SizedBox(
                                                                    width:
                                                                        size.width *
                                                                            0.4,
                                                                    child: Text(
                                                                      searchProduct
                                                                          .address
                                                                          .street,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      maxLines:
                                                                          1,
                                                                      style: GoogleFonts
                                                                          .prompt(),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                      'house number:',
                                                                      style: GoogleFonts.prompt(
                                                                          fontWeight:
                                                                              FontWeight.w600)),
                                                                  SizedBox(
                                                                    width:
                                                                        size.width *
                                                                            0.3,
                                                                    child: Text(
                                                                      searchProduct
                                                                          .address
                                                                          .houseNumber,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      maxLines:
                                                                          1,
                                                                      style: GoogleFonts
                                                                          .prompt(),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          // Spacer(),
                                                        ],
                                                      ),
                                                    )),
                                              ],
                                            );
                                          }
                                        }))
                                : MediumSubmit()),
                      ),
                    )
                  ],
                ),
              ));
  }
}
