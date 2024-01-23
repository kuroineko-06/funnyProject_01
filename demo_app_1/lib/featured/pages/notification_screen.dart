import 'package:demo_app_1/classes/language_constaits.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});
  static const route = '/notification';

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(translation(context).notificationPage),
      ),
      body: Center(
          child: Container(
        child: Column(
          children: [
            Text(
              message.notification!.title.toString(),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              message.notification!.body.toString(),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              message.data.toString(),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      )),
    );
  }
}
