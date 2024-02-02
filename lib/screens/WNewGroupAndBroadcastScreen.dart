import 'package:whatsapp/screens/WNewGroupNameScreen.dart';
import 'package:whatsapp/utils/WColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../components/model/WChatModel.dart';
import '../components/model/WUserModel.dart';

class CGNewGroupAndBroadcastScreen extends StatefulWidget {
  List<User> newGroup = [];
  List<User> newGroup2 = [];
  bool _isParticipantAdded = false;
  bool? isNewGroup;

  CGNewGroupAndBroadcastScreen({this.isNewGroup});

  @override
  _CGNewGroupAndBroadcastScreenState createState() => _CGNewGroupAndBroadcastScreenState();
}

class _CGNewGroupAndBroadcastScreenState extends State<CGNewGroupAndBroadcastScreen> {
  @override
  void initState() {
    super.initState();
    for (var i in fav) {
      i.isAddToGroup = false;
    }
  }

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
              children: [Text(widget.isNewGroup! ? "New group" : "New broadcast", style: const TextStyle(fontWeight: FontWeight.bold)), Text("${widget.newGroup2.length} participants", style: TextStyle(fontSize: 14))],
            ),
            actions: [IconButton(icon: const Icon(Icons.search, color: Colors.white), onPressed: () {})],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                if (widget._isParticipantAdded)
                  Column(
                    children: [
                      SizedBox(
                        height: 90,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.newGroup2.length,
                            itemBuilder: (context, index) {
                              User data = widget.newGroup2[index];
                              return InkWell(
                                onTap: () {
                                  setState(() {});
                                  data.isAddToGroup = !data.isAddToGroup!;
                                  widget.newGroup2.removeAt(index);
                                  widget.newGroup.clear();
                                  if (widget.newGroup2.isEmpty) widget._isParticipantAdded = false;
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(left: 14, top: 8),
                                  child: Stack(children: [
                                    CircleAvatar(backgroundImage: NetworkImage(widget.newGroup2[index].avatarUrl!), radius: 35),
                                    Positioned(
                                      bottom: 6,
                                      right: 0,
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(30.0)),
                                        child: const Icon(Icons.clear, color: Colors.white, size: 14),
                                      ),
                                    )
                                  ]),
                                ),
                              );
                            }),
                      ),
                      const Divider(thickness: 1)
                    ],
                  ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: fav.length,
                      itemBuilder: (context, index) {
                        User data = fav[index];
                        return InkWell(
                          onTap: () {
                            data.isAddToGroup = !data.isAddToGroup!;
                            data.isAddToGroup! ? widget.newGroup.add(data) : widget.newGroup.remove(data);
                            widget.newGroup2 = widget.newGroup.toSet().toList();
                            widget.newGroup.isNotEmpty ? widget._isParticipantAdded = true : widget._isParticipantAdded = false;
                            setState(() {});
                          },
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Stack(children: [
                                      CircleAvatar(backgroundImage: NetworkImage(fav[index].avatarUrl!), radius: 28, backgroundColor: secondaryColor),

                                      /* ***green dot for added to group*** */
                                      if (fav[index].isAddToGroup!)
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(30.0)),
                                            child: const Icon(Icons.check, color: Colors.white, size: 14),
                                          ),
                                        )
                                    ]),
                                    18.width,
                                    Text(fav[index].name!, style: boldTextStyle(size: 18)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
          floatingActionButton: widget.isNewGroup!
              ? FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: () {
                    finish(context);
                    CGNewGroupNameScreen(participant: widget.newGroup2).launch(context);
                  },
                  child: const Icon(Icons.arrow_forward, color: Colors.white),
                )
              : FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: () {
                    finish(context);
                    toast("New broadcast created", gravity: ToastGravity.CENTER);
                  },
                  child: const Icon(Icons.check, color: Colors.white),
                )),
    );
  }
}
