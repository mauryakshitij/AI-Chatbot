import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'message.dart';
import 'chat_bubble.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var msgController = TextEditingController();

  Future<void> getChatbotReply(String userReply) async {
    var response = await http.get(Uri.parse(
        "http://api.brainshop.ai/get?bid=167106&key=iABJFJf8sP50MTTg&uid=kshitijmaurya&msg=$userReply"));
    var data = jsonDecode(response.body);
    setState(() {
      messages.insert(0, Message(message: data["cnt"], sent: false));
    });
  }

  // print(getChatbotReply(hello)) {
  //   // TODO: implement print
  //   throw UnimplementedError();
  // }

  List<Message> messages = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Chat bot"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: messages.length,
                  shrinkWrap: true,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return ChatBubble(message: messages[index]);
                  }),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.grey.shade300,
                    child: TextField(
                      autocorrect: true,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: msgController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(12),
                          hintText: "Type your message here..."),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      var newMessage =
                          Message(message: msgController.text, sent: true);
                      getChatbotReply(msgController.text);
                      setState(() {
                        msgController.clear();
                        messages.insert(0, newMessage);
                      });
                    },
                    icon: const Icon(Icons.send))
              ],
            )
          ],
        ),
      ),
    );
  }
}
