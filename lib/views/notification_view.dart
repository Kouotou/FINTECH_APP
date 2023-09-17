import 'package:flutter/material.dart';
import 'package:learnflutter/constants/routes.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          iconSize: 15,
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () => Navigator.of(context).popAndPushNamed(
            homePageRoute,
          ),
        ),
        title: const Text('Notification'),
      ),
    );
  }
}
