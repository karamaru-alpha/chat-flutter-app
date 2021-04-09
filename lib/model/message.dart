import 'package:flutter/material.dart';

class Message {
  Message({
    @required this.id,
    @required this.roomID,
    @required this.body,
  });

  String id;
  String roomID;
  String body;
}
