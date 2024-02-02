// Importing necessary packages and modules
import 'package:whatsapp/screens/WATwoStepsVerification/WTwoStepsVerificationPWDScreen.dart';
import 'package:whatsapp/utils/WConstant.dart';
import 'package:whatsapp/utils/WWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// This widget is the root of the application.
class CGTwoStepsVerificationEnable extends StatefulWidget {
  // Creates the mutable state for this widget at a given location in the tree.
  @override
  _CGTwoStepsVerificationEnableState createState() => _CGTwoStepsVerificationEnableState();
}

// This class holds the state for the CGTwoStepsVerificationEnable widget.
class _CGTwoStepsVerificationEnableState extends State<CGTwoStepsVerificationEnable> {
  // Describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Setting the app bar of the scaffold
        appBar: commonAppBar(context, title: "Two-step verification") as PreferredSizeWidget?,
        body: Container(
          // Setting the padding of the container
            padding: const EdgeInsets.only(top: CGAppPadding, right: CGAppPadding, left: CGAppPadding, bottom: 8.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(children: [
                // Displaying the security icon
                const CircleAvatar(backgroundImage: NetworkImage("https://icons-for-free.com/iconfiles/png/512/green+lock+privacy+safe+secure+security+icon-1320196713520107078.png"), radius: 50.0),
                18.height,
                // Displaying the security information
                const Text(
                  "For added security, enable two-step verification, which will require a PIN when registering your phone number with $CGAppName again",
                  style: TextStyle(fontSize: 16),
                )
              ]),
              // Displaying the enable button
              ElevatedButton(
                onPressed: () {
                  // Defining the action when the button is pressed
                  CGTwoStepsVerificationPwdScreen().launch(context);
                },
                style: ElevatedButton.styleFrom(
                  // Setting the background color of the button
                  primary: Colors.green,
                ),
                child: const Text(
                  "ENABLE",
                  // Setting the text color of the button
                  style: TextStyle(color: Colors.white),
                ),
              ),

            ])),
      ),
    );
  }
}