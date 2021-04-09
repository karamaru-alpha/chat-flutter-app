import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/room.dart';

StateNotifierProvider<RoomController> provider =
    StateNotifierProvider<RoomController>((_) => RoomController());
