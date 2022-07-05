import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:telegram_clone_app/json/chat_json.dart';
import 'package:telegram_clone_app/pages/chat_detail_page.dart';
import 'package:telegram_clone_app/theme/colors.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: _getAppBar(),
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 70.0,
            decoration: const BoxDecoration(
              color: greyColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 38.0,
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextField(
                      style: const TextStyle(
                        color: white,
                      ),
                      cursorColor: primary,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          LineIcons.search,
                          color: white.withOpacity(.3),
                        ),
                        hintText: 'Search for messages or users',
                        hintStyle: TextStyle(
                          color: white.withOpacity(.3),
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          _getListChats(),
        ],
      ),
    );
  }

  Widget _getListChats() {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: List.generate(
          chat_data.length,
          (index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatDetailPage(
                            name: chat_data[index]['name'],
                            img: chat_data[index]['img']),
                      ),
                    );
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Row(
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(chat_data[index]['img']),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 70.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: (size.width - 40) * 0.6,
                                    child: Text(
                                      chat_data[index]['name'],
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                  Text(
                                    chat_data[index]['date'],
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: white.withOpacity(.4),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: (size.width - 40),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      chat_data[index]['text'],
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        // height: 1.3,
                                        color: white.withOpacity(.3),
                                      ),
                                    ),
                                    chat_data[index]['badge'] > 0
                                        ? Badge(
                                            badgeColor: primary,
                                            badgeContent: Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              child: Text(
                                                chat_data[index]['badge']
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: white),
                                              ),
                                            ),
                                          )
                                        : Container(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 72.0),
                  child: Divider(
                    thickness: 1.0,
                    color: white.withOpacity(.2),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: greyColor,
      title: const Text(
        'Chats',
        style: TextStyle(
          fontSize: 20.0,
          color: white,
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: true,
      leading: const IconButton(
        onPressed: null,
        icon: Text(
          'Edit',
          style: TextStyle(
            fontSize: 16.0,
            color: primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      actions: const [
        IconButton(onPressed: null, icon: Icon(LineIcons.edit, color: primary))
      ],
    );
  }
}
