import 'package:state_notifier/state_notifier.dart';

import '../state/message.dart';
import '../model/message.dart';

class MessageController extends StateNotifier<MessageState> {
  MessageController() : super(MessageState());

  void setMessages(List<Message> v) {
    state = state..messages = v;
  }

  void addMessage(Message v) {
    state = state..messages.add(v);
  }
}
