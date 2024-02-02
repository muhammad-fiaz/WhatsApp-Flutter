import 'package:whatsapp/main.dart';
import 'package:whatsapp/screens/WAPayment/WPaymentScreen.dart';
import 'package:whatsapp/screens/WProfilescreen.dart';
import 'package:whatsapp/utils/WColors.dart';
import 'package:whatsapp/utils/WDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';

import '../components/model/WChatModel.dart';
import '../components/model/WUserModel.dart';

class CGMessageScreen extends StatefulWidget {
  final User? user;
  bool _isSend = false;
  bool _isEmojiShow = false;
  FocusNode? _focusNode;
  int? radioGroupItem = 1;
  bool? chk = false;

  final _messageController = TextEditingController();

  CGMessageScreen({this.user});

  @override
  _CGMessageScreenState createState() => _CGMessageScreenState();
}

class _CGMessageScreenState extends State<CGMessageScreen> with SingleTickerProviderStateMixin {
  final popupmenuButton = GlobalKey<State>();
  bool iselected = false;

  @override
  void initState() {
    super.initState();
    widget._focusNode = FocusNode();
  }

  _buildMessage(ChatModel message, bool isMe) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 2, offset: const Offset(2, 2), color: Colors.black.withOpacity(.20))],
        borderRadius: BorderRadius.circular(5.0),
        color: isMe ? const Color(0xffdcf8c6) : const Color(0xffffffff),
      ),
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      margin: isMe ? const EdgeInsets.only(top: 6.0, bottom: 4.0, left: 100.0, right: 6.0) : const EdgeInsets.only(top: 6.0, bottom: 4.0, right: 120.0, left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Text(message.text),
          Text(message.text!),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(message.time!, style: primaryTextStyle(size: 12)),
              2.width,
              isMe ? const Icon(Icons.done_all, size: 15.0, color: Colors.blueAccent) : const Text(''),
            ],
          ),
        ],
      ),
    );
  }

  _buildSendMessageWidget() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(4, 16, 4, 8),
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(60.0), color: Colors.white),
          child: Row(
            children: <Widget>[
              IconButton(
                icon: widget._isEmojiShow ? const Icon(Icons.keyboard) : const Icon(Icons.insert_emoticon),
                iconSize: 25.0,
                color: Colors.grey,
                onPressed: () {
                  setState(() {});
                  if (!widget._isEmojiShow) {
                    widget._focusNode!.unfocus();
                    widget._isEmojiShow = true;
                  } else {
                    widget._focusNode!.requestFocus();
                    widget._isEmojiShow = false;
                  }
                },
              ),
              TextField(
                controller: widget._messageController,
                focusNode: widget._focusNode,
                onSubmitted: (data) {
                  setState(() {});
                  widget._isSend = false;
                },
                onChanged: (data) {
                  setState(() {});
                  widget._messageController.text.isNotEmpty ? widget._isSend = true : widget._isSend = false;
                },
                onTap: () {
                  setState(() {});
                  if (widget._isEmojiShow) widget._isEmojiShow = false;
                },
                textInputAction: TextInputAction.done,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration.collapsed(hintText: 'Type a message'),
              ).expand(),
              IconButton(
                icon: const Icon(Icons.attach_file),
                iconSize: 25.0,
                color: Colors.grey,
                onPressed: () {
                  setState(() {});
                  //_showAttachmentDialog();
                  if (!widget._isEmojiShow) _showAttachmentDialog();
                },
              ),
              IconButton(
                icon: const Icon(Icons.camera_alt),
                iconSize: 25.0,
                color: Colors.grey,
                onPressed: () {},
              ),
            ],
          ),
        ).expand(),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(60.0), color: secondaryColor),
          child: IconButton(
            icon: widget._isSend ? const Icon(Icons.send) : const Icon(Icons.mic),
            iconSize: 20.0,
            color: Colors.white,
            onPressed: () {
              setState(() {});
              widget._isSend && widget._messageController.text.isNotEmpty ? _sendMessage() : print("no message");
            },
          ),
        ).paddingRight(10).paddingTop(10),
      ],
    );
  }

  /* ****for send message by current user**** */
  _sendMessage() {
    message.insert(0, ChatModel(sender: currentUser, text: widget._messageController.text, time: "11:45"));
    Future.delayed(const Duration(milliseconds: 500), () {
      message.insert(0, ChatModel(sender: emily, text: widget._messageController.text, time: "10:45"));
      widget._messageController.clear();
      setState(() {});
    });
  }

  _showAttachmentDialog() {
    return showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.only(top: 50),
            height: 350,
            margin: const EdgeInsets.only(bottom: 70, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: GridView.count(
              childAspectRatio: 1.5,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              children: [
                _attachmentDataItem(context, const Icon(Entypo.text_document, size: 30, color: Colors.white), "Document", Colors.indigo[800], 1),
                _attachmentDataItem(context, const Icon(Icons.camera_alt_rounded, size: 30, color: Colors.white), "Camera", Colors.pink[800], 2),
                _attachmentDataItem(context, const Icon(Icons.panorama, size: 30, color: Colors.white), "Gallery", Colors.purple, 3),
                _attachmentDataItem(context, const Icon(MaterialIcons.headset, size: 30, color: Colors.white), "Audio", Colors.orange, 4),
                _attachmentDataItem(context, const Icon(Icons.attach_money, size: 30, color: Colors.white), "Payment", Colors.teal, 5),
                _attachmentDataItem(context, const Icon(Icons.videocam, size: 30, color: Colors.white), "Room", Colors.indigo, 6),
                _attachmentDataItem(context, const Icon(Icons.location_on, size: 30, color: Colors.white), "Location", Colors.green[700], 7),
                _attachmentDataItem(context, const Icon(Icons.person, size: 30, color: Colors.white), "Contact", Colors.blue[700], 8)
              ],
            ),
          ),
        );
      },
    );
  }

  _attachmentDataItem(BuildContext context, Icon icons, String name, colors, int index) {
    return Column(children: [
      GestureDetector(
          onTap: () {
            if (index == 5) {
              finish(context);
              CGPaymentScreen().launch(context);
            } else {
              finish(context);
            }
          },
          child: CircleAvatar(backgroundColor: colors, radius: 30, child: icons)),
      8.height,
      Material(child: Text(name, style: const TextStyle(fontSize: 14)))
    ]);
  }

  _openwallpaperImageDialog() {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (context) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 0.8, mainAxisSpacing: 4, crossAxisSpacing: 8, crossAxisCount: 4),
          itemCount: wallpaperImage.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {});
                setWallpaper = index;
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(fit: BoxFit.cover, image: ExactAssetImage(wallpaperImage[index])),
                ),
              ),
            );
          },
        ).paddingAll(16);
      },
    );
  }

  /*_emojiPicker() {
    return EmojiPicker(
      rows: 3,
      columns: 7,
      buttonMode: ButtonMode.MATERIAL,
      recommendKeywords: ["racing", "horse"],
      numRecommended: 10,
      onEmojiSelected: (emoji, category) {
        widget._messageController.text += emoji.emoji;
      },
    );
  }*/

  _showMuteNotification() {
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, state) {
            return AlertDialog(
              title: const Text("Mute notification for..."),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          activeColor: secondaryColor,
                          value: 1,
                          groupValue: widget.radioGroupItem,
                          onChanged: (dynamic itemval) {
                            widget.radioGroupItem = itemval;
                            state(() {});
                          },
                        ),
                        const Text("8 hours")
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: secondaryColor,
                          value: 2,
                          groupValue: widget.radioGroupItem,
                          onChanged: (dynamic itemval) {
                            widget.radioGroupItem = itemval;
                            state(() {});
                          },
                        ),
                        const Text("1 week")
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: secondaryColor,
                          value: 3,
                          groupValue: widget.radioGroupItem,
                          onChanged: (dynamic itemval) {
                            widget.radioGroupItem = itemval;
                            state(() {});
                          },
                        ),
                        const Text("Always")
                      ],
                    ),
                    const Divider(thickness: 1),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: secondaryColor,
                          value: widget.chk,
                          onChanged: (ischeck) {
                            widget.chk = ischeck;
                            state(() {});
                          },
                        ),
                        const Text("Show notification")
                      ],
                    )
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    finish(context);
                  },
                  child: const Text("CANCEL", style: TextStyle(color: secondaryColor)),
                ),
                TextButton(
                  onPressed: () {
                    finish(context);
                  },
                  child: const Text("OK", style: TextStyle(color: secondaryColor)),
                )
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffece5dd),
        appBar: AppBar(
          backgroundColor: secondaryColor,
          titleSpacing: 0,
          title: InkWell(
            onTap: () {
              CGProfileScreen(image: widget.user).launch(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(widget.user!.avatarUrl!),
                ),
                const SizedBox(width: 8.0),
                Text(widget.user!.name.validate(), style: boldTextStyle(color: Colors.white)),
              ],
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              finish(context);
            },
          ),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: const Icon(Icons.videocam, color: Colors.white)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.call, color: Colors.white)),
            PopupMenuButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onSelected: (dynamic val) {
                if (val == 4) {
                  _openwallpaperImageDialog();
                } else if (val == 1) {
                  CGProfileScreen(image: widget.user).launch(context);
                } else if (val == 3) {
                  _showMuteNotification();
                }
              },
              itemBuilder: (context) => menuEntry,
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.darken),
              fit: BoxFit.cover,
              image: Image.asset(wallpaperImage[setWallpaper]).image,
            ),
          ),
          child: Column(
            children: <Widget>[
              ListView.builder(
                reverse: true,
                itemCount: message.length,
                itemBuilder: (context, i) {
                  bool isMe = message[i].sender!.id == currentUser.id;

                  return _buildMessage(message[i], isMe);
                },
              ).expand(),
              _buildSendMessageWidget(),
              //   if (widget._isEmojiShow) _emojiPicker(),
            ],
          ),
        ),
      ),
    );
  }
}
