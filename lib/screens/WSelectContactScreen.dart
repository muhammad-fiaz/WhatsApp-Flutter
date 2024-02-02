import 'package:whatsapp/screens/WMessageScreen.dart';
import 'package:whatsapp/screens/WNewGroupAndBroadcastScreen.dart';
import 'package:whatsapp/screens/WqrScanScreen.dart';
import 'package:whatsapp/utils/WColors.dart';
import 'package:whatsapp/utils/WConstant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../components/model/WChatModel.dart';
import '../components/model/WUserModel.dart';

class CGSelectContactScreen extends StatefulWidget {
  ChatModel? data;
  final bool? isCallScreen;

  CGSelectContactScreen({this.isCallScreen});

  @override
  _CGSelectContactScreenState createState() => _CGSelectContactScreenState();
}

class _CGSelectContactScreenState extends State<CGSelectContactScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                finish(context);
              }),
          backgroundColor: secondaryColor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Select contact", style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                "${fav.length} Contacts",
                style: boldTextStyle(size: 14, color: Colors.white),
              )
            ],
          ),
          actions: [
            IconButton(icon: const Icon(Icons.search, color: Colors.white), onPressed: () {}),
            PopupMenuButton(
                icon: const Icon(Icons.more_vert, color: Colors.white),
                itemBuilder: (context) => [const PopupMenuItem(value: 1, child: Text("Invite a friend")), const PopupMenuItem(value: 2, child: Text("Contacts")), PopupMenuItem(value: 3, child: Text("Refresh")), PopupMenuItem(value: 4, child: Text("Help"))])
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(CGAppPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    CGNewGroupAndBroadcastScreen(isNewGroup: true).launch(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        const CircleAvatar(radius: 24, backgroundColor: secondaryColor, child: Icon(Icons.group, color: Colors.white, size: 28.0)),
                        18.width,
                        Text(widget.isCallScreen! ? "New group call" : "New group", style: boldTextStyle(size: 18))
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(radius: 24, backgroundColor: secondaryColor, child: Icon(Icons.group, color: Colors.white, size: 28.0)),
                          18.width,
                          Text("New contact", style: boldTextStyle(size: 18)),
                        ],
                      ),
                      IconButton(
                          icon: const Icon(Icons.qr_code, color: secondaryColor),
                          onPressed: () {
                            CGqrScanScreen().launch(context);
                          })
                    ],
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: fav.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          finish(context);
                          CGMessageScreen(user: User(id: index, avatarUrl: fav[index].avatarUrl, name: fav[index].name)).launch(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(backgroundImage: NetworkImage(fav[index].avatarUrl!), radius: 24, backgroundColor: secondaryColor),
                                  18.width,
                                  Text(fav[index].name!, style: boldTextStyle(size: 18)),
                                ],
                              ),
                              if (widget.isCallScreen!)
                                Row(
                                  children: [
                                    IconButton(onPressed: () {}, icon: const Icon(Icons.call, color: secondaryColor)),
                                    IconButton(onPressed: () {}, icon: const Icon(Icons.videocam, color: secondaryColor)),
                                  ],
                                )
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
