// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import 'package:learnflutter/constants/routes.dart';
import 'package:learnflutter/services/auth/auth_exceptions.dart';
import 'package:learnflutter/services/auth/auth_service.dart';
import 'package:learnflutter/widgets/text_input_field.dart';

import '../utilities/show_error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
      body: Column(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 100,
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //creating some distance from the top
                      Flexible(
                        flex: 0,
                        child: Container(
                            // alignment: Alignment.bottomRight,
                            ),
                      ),

                      //app logo
                      Image.asset(
                        'assets/time-cash_white.png',
                        height: 100,
                        // width: 1,
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
                        height: 35,
                      ),

                      TextFieldInput(
                        hintText: 'Enter your password',
                        isPassword: true,
                        textInputType: TextInputType.text,
                        textEditingController: _password,
                        isEnableSuggestions: false,
                        isAutoCorrect: false,
                      ),

                      Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          TextButton(
                            onPressed: () async {
                              final email = _email.text;
                              final password = _password.text;
                              try {
                                final userCredential =
                                    await AuthService.firebase().logIn(
                                  email: email,
                                  password: password,
                                );
                                final user = AuthService.firebase().currentUser;
                                if (user?.isEmailVerified ?? false) {
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
                              } on UserNotFoundAuthException {
                                await showErrorDialog(
                                  context,
                                  "User not found",
                                );
                              } on WrongPasswordAuthException {
                                await showErrorDialog(
                                  context,
                                  "Wrong Password",
                                );
                              } on GenericAuthException {
                                await showErrorDialog(
                                  context,
                                  "Authentication Error",
                                );
                              }
                            },
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(00, 190, 00, 1),
                              // shape: BorderRadius.all(Radius.zero),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              // style: TextStyle(color: Colors.black12),
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            registerRoute,
                            (route) => false,
                          );
                        },
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                            ),
                            Text(
                              "Not yet registered?",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "  Register here",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // const SizedBox(
                      //   height: 100,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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
