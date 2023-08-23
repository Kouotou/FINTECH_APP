// import 'dart:js';
// import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learnflutter/constants/routes.dart';
import 'package:learnflutter/views/login_view.dart';
import 'package:learnflutter/views/register_view.dart';
import 'package:learnflutter/views/verify_email.%20view.dart';
import 'dart:developer' as devtools show log;

import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomePage(),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        notesRoute: (context) => const NotesView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          //   case ConnectionState.none:
          //     print("none connection");
          //     break;
          //   case ConnectionState.waiting:
          //     print("waiting connection");
          //     break;
          //   case ConnectionState.active:
          //     print("active connection");
          //     break;
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              if (user.emailVerified) {
                // print('email is verified');
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }
            // final user = FirebaseAuth.instance.currentUser;
            // if (user?.emailVerified ?? false) {
            //   return const Text('Verified User');
            // } else {
            //   return const VerifyEmailView();
            //   // Navigator.of(context).push(
            //   //   MaterialPageRoute(
            //   //     builder: (context) => const VerifyEmailView(),
            //   //   ),
            //   // );
            //   //return const Text(' need to verify email');
            // }
            // return const Text('Done');
            return const NotesView();
          default:
            // return const Text("Loading...");
            return const CircularProgressIndicator();
        }
      },
    );
  }
}

enum MenuAction { logout, support }

class NotesView extends StatefulWidget {
  const NotesView({super.key});

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
        title: const Text('Main UI'),
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              devtools.log(value.toString());
              switch (value) {
                case MenuAction.logout:
                  final shouldLogout = await showLogOutDialog(context);
                  devtools.log(shouldLogout.toString());
                  if (shouldLogout) {
                    await FirebaseAuth.instance.signOut();
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
    );
  }
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
        // MenuAnchor(
        //   builder: (BuildContext context, MenuController controller,
        //       Widget? child) {
        //     return IconButton(
        //       onPressed: () {
        //         if (controller.isOpen) {
        //           controller.close();
        //         } else {
        //           controller.open();
        //         }
        //       },
        //       icon: const Icon(Icons.account_box),
        //       tooltip: 'Show menu',
        //     );
        //   },
        //   menuChildren: List<MenuItemButton>.generate(
        //     1,
        //     (int index) => MenuItemButton(
        //       onPressed: () => setState(
        //         () {
        //           selectedMenu = MenuAction.values[index];
        //         },
        //       ),
        //       child: const Text('Log Out'),
        //     ),
        //   ),