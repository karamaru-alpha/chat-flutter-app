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

    final _textFieldController = TextEditingController();

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
            showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text("エラー"),
                  content: Text(e.toString()),
                  actions: <Widget>[
                    TextButton(
                      child: Text("OK"),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                );
              },
            );
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
      body: Stack(
        children: [
          ListView.builder(
            itemCount: messageState.messages.length,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            itemBuilder: (context, index) {
              return Container(
                padding:
                    EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
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
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textFieldController,
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () async {
                      if (_textFieldController.text.length == 0) {
                        return;
                      }
                      try {
                        await sendMessage(
                            roomID: room.id, body: _textFieldController.text);
                      } catch (e) {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text("エラー"),
                              content: Text(e.toString()),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("OK"),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            );
                          },
                        );
                      } finally {
                        FocusScope.of(context).unfocus();
                        _textFieldController.clear();
                      }
                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
