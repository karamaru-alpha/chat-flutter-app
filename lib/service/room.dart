import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

import '../model/message.dart';
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

Future<Error> joinRoom({String roomID, Function addMessage}) async {
  ClientChannel channel = createChannel();
  RoomServicesClient grpcClient = createGrpcClient(channel);
  try {
    final stream = grpcClient.joinRoom(JoinRoomRequest(roomId: roomID));
    await for (final res in stream) {
      addMessage(
        Message(
          id: res.message.id,
          roomID: res.message.roomId,
          body: res.message.body,
        ),
      );
    }
    return Future.error(null);
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
