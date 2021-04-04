import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

import '../proto/pb/room.pbgrpc.dart';
import 'common.dart';

Future<CreateRoomResponse> createRoom({String title}) async {
  ClientChannel channel = createChannel();
  RoomServicesClient grpcClient = createGrpcClient(channel);
  try {
    return await grpcClient.createRoom(CreateRoomRequest(title: title));
  } catch (error) {
    debugPrint('createRoom: $error');
    return Future.error(error);
  } finally {
    channel.shutdown();
  }
}

Future<GetRoomsResponse> getRooms() async {
  ClientChannel channel = createChannel();
  RoomServicesClient grpcClient = createGrpcClient(channel);
  try {
    return await grpcClient.getRooms(GetRoomsRequest());
  } catch (error) {
    debugPrint('getRooms: $error');
    return Future.error(error);
  } finally {
    channel.shutdown();
  }
}
