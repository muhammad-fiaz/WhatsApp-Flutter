import 'package:whatsapp/screens/WChangeNumber/WChangeNumber2Screen.dart';
import 'package:whatsapp/utils/WConstant.dart';
import 'package:whatsapp/utils/WWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGChangeNumber extends StatefulWidget {
  @override
  _CGChangeNumberState createState() => _CGChangeNumberState();
}

class _CGChangeNumberState extends State<CGChangeNumber> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBar(context, title: "Change number") as PreferredSizeWidget?,
        body: Container(
          padding: const EdgeInsets.only(left: CGAppPadding, right: CGAppPadding, top: CGAppPadding, bottom: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage("https://cdn0.iconfinder.com/data/icons/technology-business-and-people/1000/file_light-21-512.png"),
                    radius: 100,
                  ),
                  18.height,
                  const Text("Change your phone number will migrate your account info, group & settings.", style: TextStyle(fontSize: 16)),
                  8.height,
                  const Text("Before proceeding, please confirm that your are able to receive SMS or calls at your new number.", style: TextStyle(fontSize: 14, color: Colors.grey)),
                  8.height,
                  const Text("If you have both new phone and new number, first change your number on your old phone.", style: TextStyle(fontSize: 14, color: Colors.grey))
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  finish(context);
                  CGChangeNumber2().launch(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: const Text(
                  "NEXT",
                  style: TextStyle(color: Colors.white),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
