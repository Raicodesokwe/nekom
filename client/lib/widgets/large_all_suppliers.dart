import 'package:flutter/material.dart';
import 'package:protos/protos.dart';
import 'package:flutter/src/widgets/async.dart' as co;
import 'package:shimmer/shimmer.dart';
import '../request_interceptors.dart';
import '../utils/app_color.dart';

class LargeAllSuppliers extends StatefulWidget {
  const LargeAllSuppliers({Key? key}) : super(key: key);

  @override
  State<LargeAllSuppliers> createState() => _LargeAllSuppliersState();
}

class _LargeAllSuppliersState extends State<LargeAllSuppliers> {
  late ClientChannel _channel;

  late SuppliersClient _stub;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _channel = ClientChannel('grpc://cloud.nekom.com/app1_test/',
    _channel = ClientChannel('g-p7vyglxg01zy04zpw4n7w6xyr75zd9.srv.pstmn.io',
        port: 443,
        options: ChannelOptions(
          credentials: ChannelCredentials.secure(
              // certificates: File('crtFilePath/file.crt').readAsBytesSync(),
              // authority: 'localhost',
              ),
          // codecRegistry:
          //     CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
        ));
    final token = 'e7efd6f150c257e2733d3279a581a7bd22fe1776';

    // final headers = {'Authorization': '$token'};

    final headers = {'client': token};

    _stub = SuppliersClient(_channel,
        options: CallOptions(metadata: headers),
        interceptors: [
          RequestLoggingInterceptor(),
        ]);
  }

  SupplierListResponse? res;
  Future<SupplierListResponse> getAllSupplier() async {
    try {
      res = await _stub.getAllSupplier(SupplierEmptyRequest());

      // print('res is is ${res}');
      return res!;
    } on GrpcError catch (e) {
      // TODO
      print('Erick error is $e');
    }
    return res!;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/allsuppliers.png')),
          ),
          width: size.width * 0.5,
        ),
        Spacer(),
        Text(
          'Coming soon!!',
          style: TextStyle(fontSize: size.height * 0.05),
        ),
        Spacer(),
        // FutureBuilder(
        //     future: getAllSupplier(),
        //     builder: (context, AsyncSnapshot<SupplierListResponse> snapshot) {
        //       if (snapshot.hasError) {
        //         return Center(
        //             child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Icon(Icons.person),
        //             Text(
        //               'No suppliers',
        //               style:
        //                   TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        //             ),
        //           ],
        //         ));
        //       } else if (!snapshot.hasData ||
        //           snapshot.connectionState == co.ConnectionState.waiting) {
        //         return Shimmer.fromColors(
        //           child: Container(
        //             width: double.infinity,
        //             height: 60,
        //             decoration: BoxDecoration(
        //                 color: AppColor.greenColor.withOpacity(0.7),
        //                 borderRadius: BorderRadius.circular(10)),
        //           ),
        //           baseColor: AppColor.greenColor.withOpacity(0.5),
        //           highlightColor: AppColor.greenColor.withOpacity(0.3),
        //         );
        //       } else {
        //         final hujma = snapshot.data;
        //         return ListView.builder(
        //             itemCount: hujma!.supplier.length,
        //             itemBuilder: (ctx, index) {
        //               return Text('ummu kulthum');
        //             });
        //       }
        //     })
      ],
    );
  }
}
