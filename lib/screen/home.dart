import 'package:chat/model/room.dart';
import 'package:flutter/material.dart';

List<Room> rooms = [
  Room(id: 1, title: "RoomA"),
  Room(id: 2, title: "RoomB"),
  Room(id: 3, title: "RoomC"),
];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("トークルーム"),
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
                rooms[index].title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: null,
            ),
          );
        },
        itemCount: rooms.length,
      ),
    );
  }
}
