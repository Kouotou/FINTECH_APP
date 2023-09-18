// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learnflutter/constants/routes.dart';
import 'package:learnflutter/utilities/colors.dart';
import 'package:learnflutter/utilities/fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 165,
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            appBarColor,
            iconColor,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(2, 0, 1, 1).copyWith(
              top: 0,
              right: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: mainTextColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: mainTextColor,
                      width: 2,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/messi.jpg"),
                      radius: 40,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      bottom: 5,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 65,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                accountPageRoute,
                                (_) => false,
                              );
                            },
                            child: const Text(
                              'KOUOTOU Ahmad Bilal',
                              style: primaryTextFont,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                accountPageRoute,
                                (_) => false,
                              );
                            },
                            child: const Text(
                              'Account Number',
                              style: TextStyle(
                                color: mainTextColor,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      notifPageRoute,
                      (_) => false,
                    );
                  },
                  icon: const Icon(
                    Icons.notifications,
                    size: 35,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    size: 35,
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.location_pin),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Location",
                  style: secondaryTextFont,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.account_balance_wallet_rounded),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Balance",
                    style: secondaryTextFont,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
