import 'package:chat/state/room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/index.dart';
import 'add_room.dart';

class HomeScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final RoomState roomState = useProvider(roomProvider.state);

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
