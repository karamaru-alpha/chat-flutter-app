import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/message.dart';

StateNotifierProvider<MessageController> provider =
    StateNotifierProvider<MessageController>((_) => MessageController());
