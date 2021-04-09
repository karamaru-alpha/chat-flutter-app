import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/room.dart';
import '../model/room.dart';
import '../service/room.dart';
import '../proto/pb/message.pb.dart' as pb;
import '../provider/room.dart';

class AddRoomScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final RoomController controller = useProvider(provider);
    final ValueNotifier<String> title = useState("");

    return Scaffold(
      appBar: AppBar(
        title: Text("トークルーム作成"),
      ),
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              onChanged: (v) => title.value = v,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            ElevatedButton(
              child: const Text('作成！'),
              onPressed: () async {
                try {
                  pb.CreateRoomResponse res = await createRoom(
                    title: title.value,
                  );
                  controller.addRoom(
                    Room(id: res.room.id, title: res.room.title),
                  );
                  Navigator.of(context).pop();
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text("エラー"),
                        content: Text(e.toString()),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
