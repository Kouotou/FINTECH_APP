// import 'package:flutter/material.dart';
// import 'package:learnflutter/constants/routes.dart';

// class AccountView extends StatefulWidget {
//   const AccountView({super.key});

//   @override
//   State<AccountView> createState() => _AccountViewState();
// }

// class _AccountViewState extends State<AccountView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//           ),
//           onPressed: () => Navigator.of(context).popAndPushNamed(
//             notesRoute,
//           ),
//         ),
//         title: const Text('My Account'),
//       ),
//     );
//   }
// }

// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learnflutter/constants/routes.dart';
import 'package:learnflutter/utilities/colors.dart';
import 'package:learnflutter/utilities/fonts.dart';

class AccountView extends StatefulWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // get _defaultMaxRadius => () {
  //       defaultMaxRadius = 15;
  //     };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        // backgroundColor: mobileBackgroundColor,
        appBar: AppBar(
          backgroundColor: iconColor,
          automaticallyImplyLeading: false,
          leading: IconButton(
            iconSize: 15,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: mobileBackgroundColor,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                homePageRoute,
                (_) => false,
              );
            },
          ),
          title: const Text(
            'Profile',
            style: pageTextFont,
          ),
        ),
        //   actions: const [],
        //   centerTitle: false,
        //   elevation: 0,

        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: iconColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 75,
                          height: 72,
                          decoration: BoxDecoration(
                            color: borderColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: borderColor,
                              width: 2,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                            child: Image(
                              image: AssetImage(
                                "assets/messi.jpg",
                              ),
                              // width: CircleAvatar._defaultMaxRadius,
                              // radius: 40,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 1, 0, 0),
                                  child: Text(
                                    'KOUOTOU Ahmad',
                                    style: primaryTextFont,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Text(
                                'bilalKouotou@timecash.com',
                                style: secondaryTextFont,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //Account
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                child: Text(
                  'Account',
                  style: primaryTextFont,
                ),
              ),

              //edit profile
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: mobileBackgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: const AlignmentDirectional(0.00, 0.00),
                    child: const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.account_circle_outlined,
                            color: iconColor,
                            size: 24,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Text(
                              'Edit Profile',
                              style: secondaryTextFont,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.90, 0.00),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: iconColor,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              //Payment option
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: mobileBackgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: const AlignmentDirectional(0.00, 0.00),
                    child: const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.credit_card,
                            color: iconColor,
                            size: 24,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Text(
                              'Payment Options',
                              style: secondaryTextFont,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.90, 0.00),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: iconColor,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              //Language
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: mobileBackgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: const AlignmentDirectional(0.00, 0.00),
                    child: const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.account_box,
                            color: iconColor,
                            size: 24,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Text(
                              'Change Account',
                              style: secondaryTextFont,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.90, 0.00),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: iconColor,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                child: Text(
                  'Support',
                  style: primaryTextFont,
                ),
              ),

              //contact us
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: mobileBackgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: const AlignmentDirectional(0.00, 0.00),
                    child: const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.help_outline_rounded,
                            color: iconColor,
                            size: 24,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Text(
                              'Contact Us',
                              style: secondaryTextFont,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.90, 0.00),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: iconColor,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              //Privacy Policy
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: mobileBackgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: const AlignmentDirectional(0.00, 0.00),
                    child: const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.privacy_tip_rounded,
                            color: iconColor,
                            size: 24,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Text(
                              'Privacy Policy',
                              style: secondaryTextFont,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.90, 0.00),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: iconColor,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
