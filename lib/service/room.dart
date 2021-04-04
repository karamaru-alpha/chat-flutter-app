import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

import '../proto/pb/room.pbgrpc.dart';
import 'common.dart';

Future<CreateRoomResponse> createRoom({String title}) async {
  ClientChannel channel = createChannel();
  RoomServicesClient grpcClient = createGrpcClient(channel);
  try {
    CreateRoomResponse res =
        await grpcClient.createRoom(CreateRoomRequest(title: title));
    await channel.shutdown();
    return res;
  } catch (error) {
    debugPrint('createRoom: $error');
    await channel.shutdown();
    return Future.error(error);
  }
}

Future<GetRoomsResponse> getRooms() async {
  ClientChannel channel = createChannel();
  RoomServicesClient grpcClient = createGrpcClient(channel);
  try {
    GetRoomsResponse res = await grpcClient.getRooms(GetRoomsRequest());
    await channel.shutdown();
    return res;
  } catch (error) {
    debugPrint('getRooms: $error');
    await channel.shutdown();
    return Future.error(error);
    ;
  }
}
