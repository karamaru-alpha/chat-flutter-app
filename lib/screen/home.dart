import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../proto/pb/room.pb.dart' as pb;
import '../controller/room.dart';
import '../service/room.dart';
import '../state/room.dart';
import '../model/room.dart';
import '../provider/index.dart';
import 'add_room.dart';

class HomeScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final RoomState roomState = useProvider(roomProvider.state);
    final RoomController roomController = useProvider(roomProvider);

    useEffect(
      () {
        (() async {
          try {
            pb.GetRoomsResponse res = await getRooms();
            roomController.setRooms(
              res.rooms.map((e) => Room(id: e.id, title: e.title)).toList(),
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
        title: Text("トークルーム"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => AddRoomScreen(),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black38,
                ),
              ),
            ),
            child: ListTile(
              leading: const Icon(Icons.house),
              title: Text(
                roomState.rooms[index].title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: null,
            ),
          );
        },
        itemCount: roomState.rooms.length,
      ),
    );
  }
}
