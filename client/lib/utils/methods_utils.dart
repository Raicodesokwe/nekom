// import 'package:app/utils/create_channel.dart';
// import 'package:protos/protos.dart';

// class MethodsUtils{
//     late ClientChannel _channel;
//   late SuppliersClient _stub;
//   _channel = ClientChannel('g-p7vyglxg01zy04zpw4n7w6xyr75zd9.srv.pstmn.io',
//         port: 443,
//         options: ChannelOptions(
//           credentials: ChannelCredentials.secure(
//               // certificates: File('crtFilePath/file.crt').readAsBytesSync(),
//               // authority: 'localhost',
//               ),
//           // codecRegistry:
//           //     CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
//         ));
//     final token = 'e7efd6f150c257e2733d3279a581a7bd22fe1776';

//     // final headers = {'Authorization': '$token'};

//     final headers = {'client': token};

//     _stub = SuppliersClient(_channel,
//         options: CallOptions(metadata: headers),
//         interceptors: [
//           RequestLoggingInterceptor(),
//         ]);
//  static Future<void> addSupplier({
//   String? city,
//   String? countryISO3,
//   String? firstName,
//   String? houseNumber,
//   String? lastName,
//   String? street,
//   String? street2,
//   String? zip,
//   String? email,
//   bool? internalSupplier,
//   String? name1,
//   String? name2,

//   // Int64? shippingTime;
//   String? supplierId,
//   Supplyment? supplyment
//  }) async {
//     try {
//       final res = await SuppService.instance.suppClient..addSupplier(AddSupplierRequest()
//         ..address.city = city!
//         ..address.countryISO3 = countryISO3!
//         ..address.firstName = firstName!
//         ..address.houseNumber = houseNumber!
//         ..address.lastName = lastName!
//         ..address.street = street!
//         ..address.street2 = street2!
//         ..address.zip = zip!
//         ..email = email!
//         ..internalSupplier = internalSupplier!
//         ..name1 = name1!
//         ..name2 = name2!
//         // ..shippingTime=shippingTime!
//         ..supplierId = supplierId!
//         ..supplyment = supplyment!);
//       print('res is is ${res.supplier.email}');
//     } on GrpcError catch (e) {
//       // TODO
//       print('Erick error is $e');
//     }
//   }
// }