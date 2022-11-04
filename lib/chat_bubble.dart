import 'package:flutter/material.dart';
import 'message.dart';

class ChatBubble extends StatefulWidget {
  Message message;

  ChatBubble({required this.message});

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: Align(
        alignment: (widget.message.sent == false
            ? Alignment.topLeft
            : Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: (widget.message.sent == false
                  ? Colors.blue.shade200
                  : Colors.grey.shade200)),
          padding: EdgeInsets.all(16),
          child: Text(widget.message.message),
        ),
      ),
    );
  }
}
