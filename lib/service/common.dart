import 'package:grpc/grpc.dart';

import '../proto/pb/room.pbgrpc.dart';

ClientChannel createChannel() {
  return ClientChannel(
    'localhost',
    port: 8080,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );
}

RoomServicesClient createGrpcClient(ClientChannel channel) {
  return RoomServicesClient(
    channel,
    options: CallOptions(
      timeout: Duration(seconds: 10),
    ),
  );
}
