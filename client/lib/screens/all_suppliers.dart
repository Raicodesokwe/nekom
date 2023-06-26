import 'package:app/utils/stub_channel.dart';
import 'package:app/utils/supplier_data.dart';

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

class AllSuppliers extends StatefulWidget {
  const AllSuppliers({Key? key}) : super(key: key);

  @override
  State<AllSuppliers> createState() => _AllSuppliersState();
}

class _AllSuppliersState extends State<AllSuppliers> {
  List<Supplier>? searchedProducts;
  SupplierListResponse? res;
  SupplierResponse? resTwo;
  bool isSearchOn = false;
  TextEditingController controller = TextEditingController();
  Future<SupplierListResponse> getAllSupplier() async {
    try {
      res = await StubChannel().stub.getAllSupplier(SupplierEmptyRequest());

      // print('res is is ${res}');
      return res!;
    } on GrpcError catch (e) {
      // TODO
      print('Erick error is $e');
    }
    return res!;
  }

  Future<SupplierListResponse>? getAllSuppliers;
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
    getAllSuppliers = getAllSupplier();
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
                child: RefreshIndicator(
                  key: _refreshIndicatorKeyFive,
                  color: AppColor.greenColor,
                  onRefresh: () async {
                    setState(() {
                      getAllSuppliers = getAllSupplier();
                    });
                    await getAllSuppliers;
                  },
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        expandedHeight: size.height * 0.15,
                        backgroundColor: Colors.transparent,
                        centerTitle: true,
                        title: Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Text(
                            'All suppliers',
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
                                  onChanged: (value) {
                                    // getOneSupplier(value).then((value) {
                                    //   print('reached here');
                                    // });
                                    if (value.isNotEmpty) {
                                      setState(() {
                                        isSearchOn = true;
                                        searchedProducts = searchedProducts!
                                            .where((element) => element
                                                .address.firstName
                                                .toLowerCase()
                                                .contains(value))
                                            .toList();
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
                                      hintText: 'search by name1',
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
                                  ? FutureBuilder(
                                      future: getAllSuppliers,
                                      builder: (context,
                                          AsyncSnapshot<SupplierListResponse>
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
                                                    fontWeight: FontWeight.w600,
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
                                            highlightColor: AppColor.greenColor
                                                .withOpacity(0.3),
                                          );
                                        } else {
                                          searchedProducts = !isSearchOn
                                              ? snapshot.data!.supplier
                                              : searchedProducts;
                                          return SmallAllSuppliersScreen(
                                            res: searchedProducts!,
                                          );
                                        }
                                      })
                                  : MediumSubmit()),
                        ),
                      )
                    ],
                  ),
                ),
              ));
  }
}
