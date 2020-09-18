parse snapshot flutter realtime database


Future<String> getLastMessageOfConversation(String uid) async {
    DataSnapshot dataSnapshot = await FirebaseDatabase.instance
        .reference()
        .child(ChatService.PRIVATE_CHAT)
        .child(uid)
        .limitToLast(1)
        .once();


    String message = '';
    if (dataSnapshot.value != null) {
      dataSnapshot.value.forEach(
        (index, data) {
          MessageModel messageModel = MessageModel.fromJson(data);
          message = messageModel.text;
        },
      );
    }
  return message;
  }


if inside container flutter


return Column(children: <Widget>[
  Text("hello"),
  if (condition)
     Text("should not render if false"),
  Text("world")
],);
//logic inside container
//logic inside widget
