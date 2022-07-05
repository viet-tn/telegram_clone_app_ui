import 'package:flutter/material.dart';
import 'package:telegram_clone_app/json/chat_json.dart';
import 'package:telegram_clone_app/json/setting_json.dart';
import 'package:telegram_clone_app/theme/colors.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
          Center(
            child: Container(
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(profile[0]['img']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            profile[0]['name'],
            style: const TextStyle(
              fontSize: 24.0,
              color: white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 2.0,
          ),
          Text(
            '+84 33 333 33 33',
            style: TextStyle(
              fontSize: 18.0,
              color: white.withOpacity(.5),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          _getSectionOne(),
          const SizedBox(
            height: 20.0,
          ),
          _getSectionTwo(),
          const SizedBox(
            height: 20.0,
          ),
          _getSectionThree(),
        ],
      ),
    );
  }

  Widget _getSectionOne() {
    return Column(
      children: List.generate(setting_section_one.length, (index) {
        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: textfieldColor),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            color: setting_section_one[index]['color'],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Icon(
                              setting_section_one[index]['icon'],
                              color: white,
                              size: 20.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        Text(
                          setting_section_one[index]['text'],
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: white,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: white.withOpacity(.2),
                      size: 15.0,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _getSectionTwo() {
    return Column(
      children: List.generate(setting_section_two.length, (index) {
        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: textfieldColor),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            color: setting_section_two[index]['color'],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Icon(
                              setting_section_two[index]['icon'],
                              color: white,
                              size: 20.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        Text(
                          setting_section_two[index]['text'],
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: white,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: white.withOpacity(.2),
                      size: 15.0,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _getSectionThree() {
    return Column(
      children: List.generate(setting_section_three.length, (index) {
        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: textfieldColor),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            color: setting_section_three[index]['color'],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Icon(
                              setting_section_three[index]['icon'],
                              color: white,
                              size: 20.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        Text(
                          setting_section_three[index]['text'],
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: white,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: white.withOpacity(.2),
                      size: 15.0,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _getAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: greyColor,
      leading: const IconButton(
        onPressed: null,
        icon: Icon(
          Icons.qr_code,
          color: primary,
          size: 28,
        ),
      ),
      actions: const [
        IconButton(
          onPressed: null,
          icon: Text(
            'Edit',
            style: TextStyle(
              fontSize: 16,
              color: primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
