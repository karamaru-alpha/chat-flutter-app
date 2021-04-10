import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

import '../proto/pb/message.pb.dart';
import '../proto/pb/service.pbgrpc.dart';
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

Future<JoinRoomResponse> joinRoom({String roomID}) async {
  ClientChannel channel = createChannel();
  RoomServicesClient grpcClient = createGrpcClient(channel);
  try {
    return await grpcClient.joinRoom(JoinRoomRequest(roomId: roomID));
  } catch (e) {
    debugPrint('joinRoom: $e');
    return Future.error(e);
  } finally {
    channel.shutdown();
  }
}

Future<SendMessageResponse> sendMessage({String roomID, String body}) async {
  ClientChannel channel = createChannel();
  RoomServicesClient grpcClient = createGrpcClient(channel);
  try {
    return await grpcClient
        .sendMessage(SendMessageRequest(roomId: roomID, body: body));
  } catch (e) {
    debugPrint('sendMessage: $e');
    return Future.error(e);
  } finally {
    channel.shutdown();
  }
}
