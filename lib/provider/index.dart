import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/room.dart';

StateNotifierProvider<RoomController> roomProvider =
    StateNotifierProvider<RoomController>((_) => RoomController());
