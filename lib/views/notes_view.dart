import 'package:flutter/material.dart';
import 'package:learnflutter/services/auth/auth_service.dart';
import 'dart:developer' as devtools show log;

import '../constants/routes.dart';
import '../enums/menu_action.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  final nav = 0;

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  // note:  MenuAnchor that is preferred for applications
  // that are configured for Material 3 at the place of
  // popupMenuButton.
  // MenuAction? selectedMenu;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              devtools.log(value.toString());
              switch (value) {
                case MenuAction.logout:
                  final shouldLogout = await showLogOutDialog(context);
                  devtools.log(shouldLogout.toString());
                  if (shouldLogout) {
                    await AuthService.firebase().logOut();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      loginRoute,
                      (_) => false,
                    );
                  }
                  break;
                case MenuAction.support:
                  break;
              }
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem<MenuAction>(
                  value: MenuAction.logout,
                  child: Text('Log Out'),
                ),
                PopupMenuItem<MenuAction>(
                  value: MenuAction.support,
                  child: Text('Support'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: 200,
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.greenAccent,
              Colors.green,
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> showLogOutDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Log Out'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Log Out'),
            ),
          ],
        );
      },
    ).then((value) => value ?? false);
  }
}
