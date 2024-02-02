import 'package:whatsapp/utils/WColors.dart';
import 'package:whatsapp/utils/WConstant.dart';
import 'package:whatsapp/utils/WDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../components/model/WUserModel.dart';

class CGProfileScreen extends StatefulWidget {
  final User? image;

  CGProfileScreen({this.image});

  @override
  _CGProfileScreenState createState() => _CGProfileScreenState();
}

class _CGProfileScreenState extends State<CGProfileScreen> {
  bool isCheckbtn = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: _buildImageAppBar(),
      ),
    );
  }

  _buildImageAppBar() {
    return NestedScrollView(
      scrollDirection: Axis.vertical,
      floatHeaderSlivers: false,
      headerSliverBuilder: (context, scoll) {
        return [
          SliverAppBar(
            actions: [
              PopupMenuButton(
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                itemBuilder: (context) {
                  return [const PopupMenuItem(value: 1, child: Text("Share")), const PopupMenuItem(value: 2, child: Text("Edit")), const PopupMenuItem(value: 3, child: Text("View in address book")), PopupMenuItem(value: 4, child: Text("Verify security code"))];
                },
              )
            ],
            backgroundColor: secondaryColor,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                finish(context);
              },
            ),
            expandedHeight: 330.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.image!.name!, style: const TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold)),
              background: Image.network(widget.image!.avatarUrl!, fit: BoxFit.cover),
            ),
          ),
        ];
      },
      body: SingleChildScrollView(
        child: Column(
          children: [_docsListData(), _itemNotification(), _itemEncryption(), _itemAboutPhone(), _itemGroupCommon(), _buildBlockMSG(), _buildReport()],
        ),
      ),
    );
  }

  _docsListData() {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 8.0),
        padding: const EdgeInsets.only(bottom: 8.0),
        color: Colors.white,
        child: Column(children: [
          const ListTile(
            title: Text(
              "Media, links and docs",
              style: TextStyle(color: secondaryColor),
            ),
            trailing: Icon(Icons.arrow_forward_ios, size: 14),
          ),
          SizedBox(
            height: 70,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: docimg.length,
                itemBuilder: (context, index) {
                  return Container(padding: const EdgeInsets.only(right: 8.0, left: 8.0), child: Image.network(docimg[index]));
                }),
          )
        ]),
      ),
    );
  }

  _itemNotification() {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
      margin: const EdgeInsets.only(top: 8.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text("Mute notification"),
              ),
              Switch(
                  value: isCheckbtn,
                  onChanged: (val) {
                    setState(() {});
                    isCheckbtn = val;
                  })
            ]),
          ),
          const Divider(thickness: 1),
          Container(padding: const EdgeInsets.all(8.0), child: const Text("Custom notification")),
          const Divider(thickness: 1),
          Container(padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: 12.0), child: const Text("Media visibility")),
        ],
      ),
    );
  }

  _itemEncryption() {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 8.0),
      child: const ListTile(
        title: Text("Encryption"),
        subtitle: Text("Message and calls are end-to-end Tap to verify"),
        trailing: Icon(Icons.lock, color: secondaryColor),
      ),
    );
  }

  _itemAboutPhone() {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(padding: const EdgeInsets.only(left: 16.0, top: 8.0), child: const Text("About and Phone number", style: TextStyle(fontSize: 16, color: secondaryColor))),
          const ListTile(
            title: Text("I am flutter Developer"),
            subtitle: Text("9 December 2020"),
          ),
          const Divider(thickness: 1),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const SizedBox(width: 270, child: ListTile(title: Text("+91 123456 6789"), subtitle: Text("Mobile"))),
            IconButton(
              icon: const Icon(Icons.message, color: secondaryColor),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.call, color: secondaryColor),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.videocam, color: secondaryColor),
              onPressed: () {},
            ),
          ])
        ],
      ),
    );
  }

  _itemGroupCommon() {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(padding: const EdgeInsets.only(left: 16.0, top: 8.0), child: const Text("Groups in common", style: TextStyle(fontSize: 16, color: secondaryColor))),
          const ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage("https://cdn.dribbble.com/users/1622791/screenshots/11174104/flutter_intro.png"),
              radius: 30,
            ),
            title: Text("Flutter Group"),
            subtitle: Text("michael, emily, daniel, isabella, jacob, lily, matthew"),
          )
        ],
      ),
    );
  }

  _buildBlockMSG() {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: InkWell(
        onTap: () {
          _buildBlockDilaog();
        },
        child: Row(children: [Icon(Icons.block, color: Colors.red[900]), 16.width, Text("Block", style: TextStyle(fontSize: 16, color: Colors.red[900]))]),
      ),
    );
  }

  _buildReport() {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: InkWell(
        onTap: () {
          _buildReportDilaog();
        },
        child: Row(children: [Icon(Icons.thumb_down, color: Colors.red[900]), 16.width, Text("Report contact", style: TextStyle(fontSize: 16, color: Colors.red[900]))]),
      ),
    );
  }

  Future _buildBlockDilaog() async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Block ${widget.image!.name}? Blocked contact will no longer be able to call you or sendyou message"),
            actions: [
              TextButton(
                  onPressed: () {
                    finish(context);
                  },
                  child: const Text("CANCEL", style: TextStyle(color: secondaryColor))),
              TextButton(onPressed: () {}, child: const Text("BLOCK", style: TextStyle(color: secondaryColor))),
            ],
          );
        });
  }

  Future _buildReportDilaog() async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Report this contact to $CGAppName ?", style: TextStyle(fontSize: 14)),
            content: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Checkbox(value: true, onChanged: (val) {}, activeColor: secondaryColor),
              title: const Text("Block contact and delete this chat\'s message", style: TextStyle(fontSize: 14)),
            ),
            actions: [
              TextButton(
                  child: const Text("CANCEL", style: TextStyle(color: secondaryColor)),
                  onPressed: () {
                    finish(context);
                  }),
              TextButton(child: const Text("REPORT", style: TextStyle(color: secondaryColor)), onPressed: () {})
            ],
          );
        });
  }
}
