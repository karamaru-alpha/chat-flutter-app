import 'package:grpc/grpc.dart';

import '../environment/index.dart';
import '../proto/pb/service.pbgrpc.dart';

ClientChannel createChannel() {
  return ClientChannel(
    Environment.HOST,
    port: Environment.PORT,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );
}

RoomServicesClient createGrpcClient(ClientChannel channel) {
  return RoomServicesClient(channel);
}
