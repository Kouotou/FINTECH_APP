// import 'dart:js';
// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learnflutter/constants/routes.dart';
import 'package:learnflutter/services/auth/auth_service.dart';
import 'package:learnflutter/utilities/buttom_navigation_bar.dart';
import 'package:learnflutter/utilities/theme.dart';
import 'package:learnflutter/views/account_view.dart';
import 'package:learnflutter/views/invoice_veiw.dart';
import 'package:learnflutter/views/login_view.dart';
import 'package:learnflutter/views/notes_view.dart';
import 'package:learnflutter/views/notification_view.dart';
import 'package:learnflutter/views/register_view.dart';
import 'package:learnflutter/views/setting_view.dart';
import 'package:learnflutter/views/analytics_view.dart';
import 'package:learnflutter/views/verify_email_view.dart';
import 'package:learnflutter/views/my_home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      // color: appBarColor,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      // ThemeData.light().copyWith(
      //   bottomNavigationBarTheme:
      //       const BottomNavigationBarThemeData(selectedItemColor: appBarColor),
      //   scaffoldBackgroundColor: mobileBackgroundColor,
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: appBarColor,
      //   ),
      // ).
      home: const HomePage(),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        notesRoute: (context) => const NotesView(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
        settingsRoute: (context) => const SettingsView(),
        invoiceRoute: (context) => const InvoiceView(),
        supportRoute: (context) => const AnalyticsView(),
        buttomNavBarRoute: (context) => const ButtomNavBar(),
        homePageRoute: (context) => const MyHomePage(),
        accountPageRoute: (context) => const AccountView(),
        notifPageRoute: (context) => const NotificationView(),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
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
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                //return const NotesView();
                return const MyHomePage();
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
          default:
            // return const Text("Loading...");
            return const CircularProgressIndicator();
        }
      },
    );
  }
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