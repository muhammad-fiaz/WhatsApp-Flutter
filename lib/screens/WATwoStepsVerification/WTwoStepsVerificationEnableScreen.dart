import 'package:whatsapp/screens/WATwoStepsVerification/WTwoStepsVerificationPWDScreen.dart';
import 'package:whatsapp/utils/WConstant.dart';
import 'package:whatsapp/utils/WWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGTwoStepsVerificationEnable extends StatefulWidget {
  @override
  _CGTwoStepsVerificationEnableState createState() => _CGTwoStepsVerificationEnableState();
}

class _CGTwoStepsVerificationEnableState extends State<CGTwoStepsVerificationEnable> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBar(context, title: "Two-step verification") as PreferredSizeWidget?,
        body: Container(
            padding: const EdgeInsets.only(top: CGAppPadding, right: CGAppPadding, left: CGAppPadding, bottom: 8.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(children: [
                const CircleAvatar(backgroundImage: NetworkImage("https://icons-for-free.com/iconfiles/png/512/green+lock+privacy+safe+secure+security+icon-1320196713520107078.png"), radius: 50.0),
                18.height,
                const Text(
                  "For added security, enable two-step verification, which will require a PIN when registering your phone number with $CGAppName again",
                  style: TextStyle(fontSize: 16),
                )
              ]),
              ElevatedButton(
                onPressed: () {
                  CGTwoStepsVerificationPwdScreen().launch(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: const Text(
                  "ENABLE",
                  style: TextStyle(color: Colors.white),
                ),
              ),

            ])),
      ),
    );
  }
}
