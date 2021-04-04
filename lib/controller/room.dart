import 'package:state_notifier/state_notifier.dart';

import '../state/room.dart';
import '../model/room.dart';

class RoomController extends StateNotifier<RoomState> {
  RoomController() : super(RoomState());

  void setRooms(List<Room> v) {
    state = state..rooms = v;
  }

  void addRoom(Room v) {
    state = state..rooms.add(v);
  }
}
