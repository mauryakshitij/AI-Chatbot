import 'package:flutter/cupertino.dart';

@immutable
class Message {
  final String message;
  // final DateTime time;
  final bool sent;

  const Message({
    required this.message,
    // required this.time,
    required this.sent
  });

}