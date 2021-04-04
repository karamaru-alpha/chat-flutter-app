import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

import '../proto/pb/room.pbgrpc.dart';
import 'common.dart';

Future<CreateRoomResponse> createRoom({String title}) async {
  ClientChannel channel = createChannel();
  RoomServicesClient grpcClient = createGrpcClient(channel);
  try {
    return await grpcClient.createRoom(CreateRoomRequest(title: title));
  } catch (e) {
    debugPrint('createRoom: $e');
    return Future.error(e);
  } finally {
    channel.shutdown();
  }
}

Future<GetRoomsResponse> getRooms() async {
  ClientChannel channel = createChannel();
  RoomServicesClient grpcClient = createGrpcClient(channel);
  try {
    return await grpcClient.getRooms(GetRoomsRequest());
  } catch (e) {
    debugPrint('getRooms: $e');
    return Future.error(e);
  } finally {
    channel.shutdown();
  }
}
