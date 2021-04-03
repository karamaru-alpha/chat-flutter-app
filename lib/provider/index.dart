import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controoler/room.dart';

StateNotifierProvider<RoomController> roomProvider =
    StateNotifierProvider<RoomController>((_) => RoomController());
