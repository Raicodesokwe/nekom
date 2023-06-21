import 'package:grpc/grpc.dart';
import 'package:protos/protos.dart';

import '../request_interceptors.dart';

class SuppService {
  ///here enter your host without the http part (e.g enter google.com now http://google.com)
  String baseUrl = "g-p7vyglxg01zy04zpw4n7w6xyr75zd9.srv.pstmn.io";

  SuppService._internal();
  static final SuppService _instance = SuppService._internal();

  factory SuppService() => _instance;

  ///static SuppService instance that we will call when we want to make requests
  static SuppService get instance => _instance;

  ///SuppliersClient is the  class that was generated for us when we ran the generation command
  ///We will pass a channel to it to intialize it
  late SuppliersClient _suppClient;

  ///this will be used to create a channel once we create this class.
  ///Call HelloService().init() before making any call.
  Future<void> init() async {
    _createChannel();
  }

  ///provide public access to the SuppliersClient instance
  SuppliersClient get suppClient {
    return _suppClient;
  }

  ///here we create a channel and use it to initialize the  was generated
  ///
  _createChannel() {
    final channel = ClientChannel(baseUrl,

        ///port: 9043,
        port: 443,

        ///use credentials: ChannelCredentials.insecure() if you want to connect without Tls
        //options: const ChannelOptions(credentials: ChannelCredentials.insecure()),

        ///use this if you are connecting with Tls
        options: const ChannelOptions(
          credentials: ChannelCredentials.secure(),
        ));
    final token = 'e7efd6f150c257e2733d3279a581a7bd22fe1776';

    // final headers = {'Authorization': '$token'};

    final headers = {'client': token};
    _suppClient = SuppliersClient(channel,
        options: CallOptions(metadata: headers),
        interceptors: [
          RequestLoggingInterceptor(),
        ]);
  }
}
