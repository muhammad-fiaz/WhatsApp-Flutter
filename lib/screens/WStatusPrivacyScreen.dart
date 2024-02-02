import 'package:whatsapp/screens/WAStatusPrivacy/WStatusPrivacyExceptContact.dart';
import 'package:whatsapp/screens/WAStatusPrivacy/WStatusPrivacyShareStatusContact.dart';
import 'package:whatsapp/utils/WColors.dart';
import 'package:whatsapp/utils/WConstant.dart';
import 'package:whatsapp/utils/WWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGStatusPrivacyScreen extends StatefulWidget {
  int? statusGroupItem = 1;

  @override
  _CGStatusPrivacyScreenState createState() => _CGStatusPrivacyScreenState();
}

class _CGStatusPrivacyScreenState extends State<CGStatusPrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBar(context, title: "Status privacy") as PreferredSizeWidget?,
        body: Container(
          padding: const EdgeInsets.all(CGAppPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Who can see my status updates", style: boldTextStyle(color: secondaryColor, size: 14)),
                  Row(children: [
                    Radio(
                      activeColor: secondaryColor,
                      onChanged: (dynamic val) {
                        widget.statusGroupItem = val;
                        setState(() {});
                      },
                      groupValue: widget.statusGroupItem,
                      value: 1,
                    ),
                    const Text("My Contact")
                  ]),
                  InkWell(
                    onTap: () {
                      setState(() {});
                      widget.statusGroupItem = 2;
                      CGStatusPrivacyExceptContact().launch(context);
                    },
                    child: Row(children: [
                      Radio(
                        activeColor: secondaryColor,
                        onChanged: (dynamic val) {
                          widget.statusGroupItem = val;
                          setState(() {});
                          CGStatusPrivacyExceptContact().launch(context);
                        },
                        groupValue: widget.statusGroupItem,
                        value: 2,
                      ),
                      const Text("My contact except...")
                    ]),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {});
                      widget.statusGroupItem = 3;
                      CGStatusPrivacyShareStatusContact().launch(context);
                    },
                    child: Row(children: [
                      Radio(
                        activeColor: secondaryColor,
                        onChanged: (dynamic val) {
                          widget.statusGroupItem = val;
                          setState(() {});
                        },
                        groupValue: widget.statusGroupItem,
                        value: 3,
                      ),
                      const Text("Only share with...")
                    ]),
                  ),
                  const Text("Changes to your privacy setting won't affect status updates that you've sent already")
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  finish(context);
                  toast("Setting updated", gravity: ToastGravity.CENTER);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: const Text(
                  "DONE",
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
