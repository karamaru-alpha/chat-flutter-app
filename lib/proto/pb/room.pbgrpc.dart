///
//  Generated code. Do not modify.
//  source: room.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'room.pb.dart' as $0;
export 'room.pb.dart';

class RoomServicesClient extends $grpc.Client {
  static final _$createRoom =
      $grpc.ClientMethod<$0.CreateRoomRequest, $0.CreateRoomResponse>(
          '/chatserver.RoomServices/CreateRoom',
          ($0.CreateRoomRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CreateRoomResponse.fromBuffer(value));
  static final _$getRooms =
      $grpc.ClientMethod<$0.GetRoomsRequest, $0.GetRoomsResponse>(
          '/chatserver.RoomServices/GetRooms',
          ($0.GetRoomsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetRoomsResponse.fromBuffer(value));

  RoomServicesClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreateRoomResponse> createRoom(
      $0.CreateRoomRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createRoom, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetRoomsResponse> getRooms($0.GetRoomsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRooms, request, options: options);
  }
}

abstract class RoomServicesServiceBase extends $grpc.Service {
  $core.String get $name => 'chatserver.RoomServices';

  RoomServicesServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateRoomRequest, $0.CreateRoomResponse>(
        'CreateRoom',
        createRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateRoomRequest.fromBuffer(value),
        ($0.CreateRoomResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRoomsRequest, $0.GetRoomsResponse>(
        'GetRooms',
        getRooms_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRoomsRequest.fromBuffer(value),
        ($0.GetRoomsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateRoomResponse> createRoom_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateRoomRequest> request) async {
    return createRoom(call, await request);
  }

  $async.Future<$0.GetRoomsResponse> getRooms_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetRoomsRequest> request) async {
    return getRooms(call, await request);
  }

  $async.Future<$0.CreateRoomResponse> createRoom(
      $grpc.ServiceCall call, $0.CreateRoomRequest request);
  $async.Future<$0.GetRoomsResponse> getRooms(
      $grpc.ServiceCall call, $0.GetRoomsRequest request);
}
