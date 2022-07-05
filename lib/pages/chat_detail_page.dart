import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:telegram_clone_app/json/chat_json.dart';
import 'package:telegram_clone_app/theme/colors.dart';
import 'package:telegram_clone_app/widgets/chat_bubble.dart';

class ChatDetailPage extends StatefulWidget {
  final String name, img;
  const ChatDetailPage({Key? key, required this.name, required this.img})
      : super(key: key);

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) =>
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent));
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: _getAppBar(),
      ),
      // bottomNavigationBar: getBottomBar(),
      resizeToAvoidBottomInset: false,
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            controller: _scrollController,
            children: List.generate(
              messages.length,
              (index) {
                final message = messages[index];
                return CustomBubbleChat(
                    isMe: message['isMe'],
                    message: message['message'],
                    time: message['time'],
                    isLast: message['isLast']);
              },
            ),
          ),
        ),
        _getBottomBar(),
        Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        ),
      ],
    );
  }

  Widget _getBottomBar() {
    return Container(
      // height: 80.0,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: greyColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const IconButton(
              onPressed: null,
              icon: Icon(
                Entypo.attachment,
                color: primary,
                size: 21.0,
              ),
            ),
            Expanded(
              child: Container(
                height: 34,
                decoration: BoxDecoration(
                  color: white.withOpacity(.1),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    style: TextStyle(
                      color: white,
                    ),
                    cursorColor: primary,
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        MaterialCommunityIcons.sticker_emoji,
                        color: primary,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const IconButton(
              onPressed: null,
              icon: Icon(
                MaterialCommunityIcons.microphone,
                color: primary,
                size: 28.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: greyColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 16,
                  color: white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Last seen recently',
                style: TextStyle(
                  fontSize: 12,
                  color: white,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ],
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        color: primary,
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(widget.img),
          ),
        )
      ],
    );
  }
}
