// Importing necessary packages and modules
import 'package:whatsapp/screens/WAStatusPrivacy/WStatusPrivacyExceptContact.dart';
import 'package:whatsapp/screens/WAStatusPrivacy/WStatusPrivacyShareStatusContact.dart';
import 'package:whatsapp/utils/WColors.dart';
import 'package:whatsapp/utils/WConstant.dart';
import 'package:whatsapp/utils/WWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// This widget is the root of the application.
class CGStatusPrivacyScreen extends StatefulWidget {
  // Variable to hold the selected status group item
  int? statusGroupItem = 1;

  // Creates the mutable state for this widget at a given location in the tree.
  @override
  _CGStatusPrivacyScreenState createState() => _CGStatusPrivacyScreenState();
}

// This class holds the state for the CGStatusPrivacyScreen widget.
class _CGStatusPrivacyScreenState extends State<CGStatusPrivacyScreen> {
  // Describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Setting the app bar of the scaffold
        appBar: commonAppBar(context, title: "Status privacy") as PreferredSizeWidget?,
        body: Container(
          // Setting the padding of the container
          padding: const EdgeInsets.all(CGAppPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Displaying the title for the status privacy options
                  Text("Who can see my status updates", style: boldTextStyle(color: secondaryColor, size: 14)),
                  // Creating a radio button for the "My Contact" option
                  Row(children: [
                    Radio(
                      activeColor: secondaryColor,
                      onChanged: (dynamic val) {
                        // Defining the action when the radio button is selected
                        widget.statusGroupItem = val;
                        setState(() {});
                      },
                      groupValue: widget.statusGroupItem,
                      value: 1,
                    ),
                    const Text("My Contact")
                  ]),
                  // Creating a radio button for the "My contact except..." option
                  InkWell(
                    onTap: () {
                      // Defining the action when the radio button is selected
                      setState(() {});
                      widget.statusGroupItem = 2;
                      CGStatusPrivacyExceptContact().launch(context);
                    },
                    child: Row(children: [
                      Radio(
                        activeColor: secondaryColor,
                        onChanged: (dynamic val) {
                          // Defining the action when the radio button is selected
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
                  // Creating a radio button for the "Only share with..." option
                  InkWell(
                    onTap: () {
                      // Defining the action when the radio button is selected
                      setState(() {});
                      widget.statusGroupItem = 3;
                      CGStatusPrivacyShareStatusContact().launch(context);
                    },
                    child: Row(children: [
                      Radio(
                        activeColor: secondaryColor,
                        onChanged: (dynamic val) {
                          // Defining the action when the radio button is selected
                          widget.statusGroupItem = val;
                          setState(() {});
                        },
                        groupValue: widget.statusGroupItem,
                        value: 3,
                      ),
                      const Text("Only share with...")
                    ]),
                  ),
                  // Displaying the note about privacy setting changes
                  const Text("Changes to your privacy setting won't affect status updates that you've sent already")
                ],
              ),
              // Creating the "DONE" button
              ElevatedButton(
                onPressed: () {
                  // Defining the action when the button is pressed
                  finish(context);
                  toast("Setting updated", gravity: ToastGravity.CENTER);
                },
                style: ElevatedButton.styleFrom(
                  // Setting the background color of the button
                  primary: Colors.green,
                ),
                child: const Text(
                  "DONE",
                  // Setting the text color of the button
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