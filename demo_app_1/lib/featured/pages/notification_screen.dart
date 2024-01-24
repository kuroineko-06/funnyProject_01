import 'package:demo_app_1/classes/language_constaits.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
    // final _localNotification = FlutterLocalNotificationsPlugin();
    //     Stream<QuerySnapshot<Map<String, dynamic>>> notificationStream =
    //     FirebaseFirestore.instance.collection("Notification").snapshots();
    //     notificationStream.listen((event) {
    //       if(event.docs.isEmpty) return;
    //       _localNotification.show(event.docs.first);
    //     });

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
              "Title: ${message.notification?.title}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              "Body: ${message.notification?.body}",
              // message.notification!.body.toString(),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              "Data: ${message.data}",
              // message.data.toString(),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      )),
    );
  }
}
