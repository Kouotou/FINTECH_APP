// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';

import 'package:learnflutter/constants/routes.dart';
import 'package:learnflutter/services/auth/auth_exceptions.dart';
import 'package:learnflutter/services/auth/auth_service.dart';
import 'package:learnflutter/widgets/text_input_field.dart';

import '../utilities/show_error_dialog.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
                              await AuthService.firebase().createUser(
                                email: email,
                                password: password,
                              );
                              // devtools.log(
                              //   userCredential.toString(),
                              // );
                              AuthService.firebase().sendEmailVerification();
                              Navigator.of(context).pushNamed(
                                verifyEmailRoute,
                              );
                            } on WeekPasswordAuthException {
                              await showErrorDialog(
                                context,
                                'weak-password',
                              );
                            } on EmailALreadyInUseAuthException {
                              await showErrorDialog(
                                context,
                                'email-already-in-use',
                              );
                            } on InvalidEmailAuthException {
                              await showErrorDialog(
                                context,
                                'Invalid email address',
                              );
                            } on GenericAuthException {
                              await showErrorDialog(
                                context,
                                "Failed to register",
                              );
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(00, 190, 00, 1),
                            // shape: BorderRadius.all(Radius.zero),
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            // style: TextStyle(color: Colors.black12),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              loginRoute,
                              (route) => false,
                            );
                          },
                          child: const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                              ),
                              Text(
                                "Already registered?",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "  Login here",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Register'),
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
    //           return ;
    //         default:
    //           return const Text("Loading...");
    //       }
    //     },
    //   ),
    // );
  }
}
