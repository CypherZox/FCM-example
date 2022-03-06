import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FcmMessaging extends StatefulWidget {
  const FcmMessaging({Key? key}) : super(key: key);

  @override
  _FcmMessagingState createState() => _FcmMessagingState();
}

class _FcmMessagingState extends State<FcmMessaging> {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "FCM example",
      style: TextStyle(fontSize: 18),
    )
        // child: MaterialButton(
        //   onPressed: () async {
        //     String? token = await _firebaseMessaging.getToken();
        //     print(token!);
        //   },
        //   color: Colors.amberAccent,
        // ),
        );
  }
}
