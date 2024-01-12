import 'package:flutter/material.dart';

class Notification extends StatefulWidget {
  const Notification({super.key});

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text('Notification'),
      ),
      body: Center(
          child: Container(
        child: Text(
          'Notification Zone!',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      )),
    );
  }
}
