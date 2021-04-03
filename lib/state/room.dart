import '../model/room.dart';

class RoomState {
  RoomState()
      : rooms = [
          Room(id: 1, title: "RoomA"),
          Room(id: 2, title: "RoomB"),
          Room(id: 3, title: "RoomC"),
        ];
  List<Room> rooms;
}
