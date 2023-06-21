import 'package:protos/protos.dart';

import '../request_interceptors.dart';

class StubChannel {
  final ClientChannel channel =
      ClientChannel('g-p7vyglxg01zy04zpw4n7w6xyr75zd9.srv.pstmn.io',
          port: 443,
          options: ChannelOptions(
            credentials: ChannelCredentials.secure(
                // certificates: File('crtFilePath/file.crt').readAsBytesSync(),
                // authority: 'localhost',
                ),
            // codecRegistry:
            //     CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
          ));

  // final headers = {'Authorization': '$token'};

  final headers = {'client': 'e7efd6f150c257e2733d3279a581a7bd22fe1776'};

  late SuppliersClient stub = SuppliersClient(channel,
      options: CallOptions(metadata: headers),
      interceptors: [
        RequestLoggingInterceptor(),
      ]);
}
