import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:telegram_clone_app/json/contact_json.dart';
import 'package:telegram_clone_app/theme/colors.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
                        hintText: 'Search',
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
            height: 10.0,
          ),
          _getSectionIcons(),
          _getContactList(),
        ],
      ),
    );
  }

  Widget _getSectionIcons() {
    List icons = [
      {
        'icon': LineIcons.mapMarker,
        'label': 'Find Peple Nearby',
      },
      {
        'icon': LineIcons.userPlus,
        'label': 'Invite Friends',
      },
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        children: List.generate(icons.length, (index) {
          return Column(
            children: [
              Row(
                children: [
                  Icon(
                    icons[index]['icon'],
                    color: primary,
                    size: 28.0,
                  ),
                  const SizedBox(width: 20.0),
                  Text(
                    icons[index]['label'],
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 48.0),
                child: Divider(
                  thickness: 1,
                  color: white.withOpacity(.15),
                ),
              )
            ],
          );
        }),
      ),
    );
  }

  Widget _getContactList() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        children: List.generate(contact_data.length, (index) {
          return Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(contact_data[index]['img']),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact_data[index]['name'],
                        style: const TextStyle(
                          fontSize: 17.0,
                          color: white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        contact_data[index]['is_online']
                            ? 'online'
                            : contact_data[index]['seen'],
                        style: TextStyle(
                          fontSize: 13.0,
                          color: contact_data[index]['is_online']
                              ? primary
                              : white.withOpacity(.5),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 48.0),
                child: Divider(
                  thickness: 1,
                  color: white.withOpacity(.15),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: greyColor,
      title: const Text(
        'Contacts',
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
          'Sort',
          style: TextStyle(
            fontSize: 16.0,
            color: primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      actions: const [
        IconButton(onPressed: null, icon: Icon(LineIcons.plus, color: primary))
      ],
    );
  }
}
