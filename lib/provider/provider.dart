import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controoler/controller.dart';

StateNotifierProvider<RoomController> roomProvider =
    StateNotifierProvider<RoomController>((_) => RoomController());
