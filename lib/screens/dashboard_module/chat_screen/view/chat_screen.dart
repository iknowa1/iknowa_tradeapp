import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/screens/dashboard_module/chat_screen/controller/chat_controller.dart';
import 'package:trade_app/screens/dashboard_module/profile_screen/controller/profile_controller.dart';
import 'package:trade_app/widgets/base_screen.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        body: Column(
      children: [
        Text("Chat screen")
      ],
    ));
  }
}
