import '../model/room.dart';

class RoomState {
  // TODO: gRPCサーバーからの通信ができたら空配列に
  RoomState()
      : rooms = [
          Room(id: 1, title: "RoomA"),
          Room(id: 2, title: "RoomB"),
          Room(id: 3, title: "RoomC"),
        ];
  List<Room> rooms;
}
