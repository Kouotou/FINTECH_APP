// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import 'package:learnflutter/constants/routes.dart';
import 'package:learnflutter/widgets/text_input_field.dart';

import '../utilities/show_error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _HomePageState();
}

class _HomePageState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login'),
      // ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 35,
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //creating some distance from the top
              Flexible(
                flex: 1,
                child: Container(),
              ),

              //app logo
              Image.asset(
                'assets/K_Cash_logo.png',
                color: Colors.black,
                height: 24,
              ),

              const SizedBox(
                height: 64,
              ),

              TextFieldInput(
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _email,
                isEnableSuggestions: false,
                isAutoCorrect: false,
              ),

              const SizedBox(
                height: 64,
              ),

              TextFieldInput(
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                textEditingController: _password,
                isEnableSuggestions: false,
                isAutoCorrect: false,
              ),

              TextButton(
                onPressed: () async {
                  final email = _email.text;
                  final password = _password.text;
                  try {
                    final userCredential =
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    final user = FirebaseAuth.instance.currentUser;
                    if (user?.emailVerified ?? false) {
                      //user's email is verified
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        notesRoute,
                        (route) => false,
                      );
                    } else {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        verifyEmailRoute,
                        (route) => false,
                      );
                    }
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      notesRoute,
                      (route) => false,
                    );
                    devtools.log(
                      userCredential.toString(),
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      await showErrorDialog(
                        context,
                        "User not found",
                      );
                      //devtools.log('User not found dear');
                    } else if (e.code == 'wrong-password') {
                      await showErrorDialog(
                        context,
                        "Wrong Password",
                      );
                      //devtools.log('Wrong password dear');
                    } else {
                      await showErrorDialog(
                        context,
                        'Error: ${e.code}',
                      );
                    }
                  } catch (e) {
                    await showErrorDialog(
                      context,
                      e.toString(),
                    );
                    //devtools.log('Something bad happened dear');
                  }
                },
                child: const Text('Login'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    registerRoute,
                    (route) => false,
                  );
                },
                child: const Text("Not registered yet? Register here"),
              ),
            ],
          ),
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Login'),
    //   ),
    //   body: FutureBuilder(
    //     future: Firebase.initializeApp(
    //       options: DefaultFirebaseOptions.currentPlatform,
    //     ),
    //     builder: (context, snapshot) {
    //       switch (snapshot.connectionState) {
    //         //   case ConnectionState.none:
    //         //     print("none connection");
    //         //     break;
    //         //   case ConnectionState.waiting:
    //         //     print("waiting connection");
    //         //     break;
    //         //   case ConnectionState.active:
    //         //     print("active connection");
    //         //     break;
    //         case ConnectionState.done:

    //         default:
    //           return const Text("Loading...");
    //       }
    //     },
    //   ),
    // );
  }
}
