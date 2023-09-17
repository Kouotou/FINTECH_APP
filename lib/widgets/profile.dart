import 'package:flutter/material.dart';
import 'package:learnflutter/constants/routes.dart';
import 'package:learnflutter/widgets/hover.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.all(8),
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
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(2, 0, 2, 2).copyWith(
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
                    color: Colors.black,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
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
                      bottom: 9,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 65,
                          child: HoverBuilder(
                            builder: (isHovered) {
                              return TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    accountPageRoute,
                                    (_) => false,
                                  );
                                },
                                child: Text(
                                  'KOUOTOU Ahmad Bilal',
                                  style: TextStyle(
                                    color:
                                        isHovered ? Colors.white : Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            },
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
                                color: Colors.black,
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
                Container(
                  padding: const EdgeInsets.all(1),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        notifPageRoute,
                        (_) => false,
                      );
                    },
                    icon: const Icon(
                      Icons.notifications_active,
                      size: 35,
                    ),
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
          const Text(
            "Location",
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
