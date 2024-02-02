import 'package:whatsapp/screens/WShowStoryScreen.dart';
import 'package:whatsapp/utils/WDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../components/model/WChatModel.dart';
import '../components/model/WUserModel.dart';

class CGStoryScreen extends StatefulWidget {
  @override
  _CGStoryScreenState createState() => _CGStoryScreenState();
}

class _CGStoryScreenState extends State<CGStoryScreen> {
  int flag = 0;
  bool? flag2 = true;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Row(
              children: [
                Stack(
                  children: [
                    const CircleAvatar(radius: 27, backgroundImage: NetworkImage("https://randomuser.me/api/portraits/women/65.jpg")),
                    Positioned(
                      bottom: 0.0,
                      right: 1.0,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                        child: const Icon(Icons.add, color: Colors.white, size: 15),
                      ),
                    )
                  ],
                ),
                15.width,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("My Status", style: boldTextStyle()),
                    Text("Tap to add status update", style: secondaryTextStyle()),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: context.width(),
            color: getColorFromHex('#F4F4F4'),
            child: Text("Recent updates", style: boldTextStyle(size: 14, color: getColorFromHex('#707070'))).paddingOnly(top: 5, left: 16, bottom: 5, right: 10),
          ),
          ListView.separated(
            padding: const EdgeInsets.only(top: 8, bottom: 80, left: 8, right: 8),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: chats.length,
            itemBuilder: (context, index) {
              ChatModel data = chats[index % chats.length];

              return Container(
                margin: const EdgeInsets.only(top: 0, left: 8, bottom: 4),
                child: Row(
                  children: [
                    Image.network(data.sender!.avatarUrl.validate(), width: 50).cornerRadiusWithClipRRect(30),
                    15.width,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.sender!.name.validate(), style: boldTextStyle()),
                        3.height,
                        Text("Today, ${data.time.validate()}", style: primaryTextStyle(size: 14)),
                      ],
                    ),
                  ],
                ),
              ).onTap(() async {
                flag = data.sender!.id! - 1;
                while (flag != fav.length && flag2!) {
                  if (flag2!) {
                    flag2 = await CGShowStoryScreen(storyData: User(avatarUrl: fav[flag].avatarUrl, name: fav[flag].name)).launch(context);
                    flag += 1;
                  }
                }
                setState(() {
                  flag = 0;
                });
              });
            },
            separatorBuilder: (_, i) => const Divider(height: 20),
          ),
        ],
      ),
    );
  }
}
