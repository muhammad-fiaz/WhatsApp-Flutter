import 'package:whatsapp/screens/WProfilescreen.dart';
import 'package:whatsapp/utils/WColors.dart';
import 'package:whatsapp/utils/WDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../components/model/WChatModel.dart';
import '../components/model/WUserModel.dart';
import 'WMessageScreen.dart';

class CGChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
          child: ListView.separated(
            itemCount: fav.length,
            padding: const EdgeInsets.only(top: 8, bottom: 80),
            itemBuilder: (context, i) {
              ChatModel data = chats[i % chats.length];
              return Container(
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          data.sender!.avatarUrl!.isEmpty ? null : _showProfileImageDialog(context, fav, i);
                        },
                        child: Hero(
                          tag: fav[i].avatarUrl!,
                          child: Image.network(data.sender!.avatarUrl.validate(), width: 50).cornerRadiusWithClipRRect(30),
                        )),
                    15.width,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.sender!.name!, style: boldTextStyle()),
                        5.height,
                        Text(data.text!, style: primaryTextStyle(size: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
                      ],
                    ).expand(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          data.time!,
                          style: secondaryTextStyle(size: 12, color: buttonColor),
                        ).visible(
                          i == 0 || i == 1 || i == 2,
                          defaultWidget: Text(data.time!, style: secondaryTextStyle(size: 12, color: Colors.grey)),
                        ),
                        10.height,
                        data.unread!
                            ? Container(
                                height: 17,
                                width: 17,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: buttonColor),
                                alignment: Alignment.center,
                                child: Text('4', style: secondaryTextStyle(size: 12, color: Colors.white)).fit(),
                              ).visible(i == 0 || i == 1 || i == 2)
                            : const Text(''),
                      ],
                    )
                  ],
                ),
              ).onTap(() {
                CGMessageScreen(user: data.sender).launch(context);
              });
            },
            separatorBuilder: (_, i) => const Divider(height: 20),
          ),
        ),
      ),
    );
  }

  _showProfileImageDialog(BuildContext context, List<User> ImageUrl, var Index) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              InkWell(
                onTap: () {},
                child: Hero(
                  tag: ImageUrl[Index].avatarUrl!,
                  child: Image.network(ImageUrl[Index].avatarUrl!, fit: BoxFit.cover, height: 300, width: MediaQuery.of(context).size.width),
                ),
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                color: Colors.black26,
                width: double.infinity,
                child: Text(
                  ImageUrl[Index].name!,
                  style: const TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 45,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          icon: const Icon(Icons.message_rounded),
                          onPressed: () {
                            finish(context);
                            CGMessageScreen(
                              user: User(avatarUrl: ImageUrl[Index].avatarUrl, name: ImageUrl[Index].name, id: ImageUrl[Index].id),
                            ).launch(context);
                          }),
                      IconButton(
                          icon: const Icon(Icons.call),
                          onPressed: () {
                            finish(context);
                          }),
                      IconButton(
                          icon: const Icon(Icons.videocam),
                          onPressed: () {
                            finish(context);
                          }),
                      IconButton(
                          icon: const Icon(Icons.info_outline),
                          onPressed: () {
                            finish(context);
                            CGProfileScreen(image: User(avatarUrl: ImageUrl[Index].avatarUrl, name: ImageUrl[Index].name, id: ImageUrl[Index].id)).launch(context);
                          }),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
