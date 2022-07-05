import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telegram_clone_app/pages/chats_page.dart';
import 'package:telegram_clone_app/pages/contact_page.dart';
import 'package:telegram_clone_app/pages/setting_page.dart';
import 'package:telegram_clone_app/theme/colors.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: _getFooter(),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        ContactPage(),
        ChatPage(),
        SettingPage(),
      ],
    );
  }

  Widget _getFooter() {
    List iconList = [
      Icons.account_circle,
      CupertinoIcons.chat_bubble_2_fill,
      Icons.settings,
    ];

    List textList = [
      'Contacts',
      'Chat',
      'Settings',
    ];

    return Container(
      height: 60.0,
      width: double.infinity,
      decoration: const BoxDecoration(color: greyColor),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
              iconList.length,
              (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        pageIndex = index;
                      });
                    },
                    child: Column(
                      children: [
                        index == 1
                            ? Badge(
                                badgeContent: const Text(
                                  '3',
                                  style: TextStyle(
                                    color: white,
                                  ),
                                ),
                                child: Icon(
                                  iconList[index],
                                  size: 30.0,
                                  color: pageIndex == index
                                      ? primary
                                      : white.withOpacity(.5),
                                ),
                              )
                            : Icon(
                                iconList[index],
                                size: 30.0,
                                color: pageIndex == index
                                    ? primary
                                    : white.withOpacity(.5),
                              ),
                        Text(
                          textList[index],
                          style: TextStyle(
                              fontSize: 11, color: white.withOpacity(.5)),
                        )
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}
