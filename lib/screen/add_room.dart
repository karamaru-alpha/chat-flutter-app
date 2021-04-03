import 'package:flutter/material.dart';

class AddRoomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("トークルーム作成"),
      ),
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            ElevatedButton(
              child: const Text('作成！'),
              onPressed: () {
                // TODO: トークルーム作成処理
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
