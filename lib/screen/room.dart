import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../service/room.dart';
import '../model/room.dart';
import '../model/message.dart';
import '../provider/message.dart';
import '../proto/pb/message.pb.dart' as pb;

class RoomScreen extends HookWidget {
  RoomScreen({Key key, this.room}) : super(key: key);

  final Room room;

  @override
  Widget build(BuildContext context) {
    final messageState = useProvider(provider.state);
    final messageController = useProvider(provider);

    useEffect(
      () {
        (() async {
          try {
            pb.JoinRoomResponse res = await joinRoom(roomID: room.id);
            messageController.setMessages(
              res.messages
                  .map((e) => Message(id: e.id, roomID: e.roomId, body: e.body))
                  .toList(),
            );
          } catch (e) {
            return null;
          }
        })();

        return;
      },
      const <Object>[],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(room.title),
      ),
      body: ListView.builder(
        itemCount: messageState.messages.length,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200,
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                messageState.messages[index].body,
                style: TextStyle(fontSize: 15),
              ),
            ),
          );
        },
      ),
    );
  }
}
