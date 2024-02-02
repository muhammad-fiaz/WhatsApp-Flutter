// Importing necessary packages and modules
import 'package:whatsapp/screens/WChangeNumber/WChangeNumber2Screen.dart';
import 'package:whatsapp/utils/WConstant.dart';
import 'package:whatsapp/utils/WWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// This widget is the root of the application.
class CGChangeNumber extends StatefulWidget {
  // Creates the mutable state for this widget at a given location in the tree.
  @override
  _CGChangeNumberState createState() => _CGChangeNumberState();
}

// This class holds the state for the CGChangeNumber widget.
class _CGChangeNumberState extends State<CGChangeNumber> {
  // Describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Setting the app bar of the scaffold
        appBar: commonAppBar(context, title: "Change number") as PreferredSizeWidget?,
        body: Container(
          // Setting the padding of the container
          padding: const EdgeInsets.only(left: CGAppPadding, right: CGAppPadding, top: CGAppPadding, bottom: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  // Displaying the change number icon
                  const CircleAvatar(
                    backgroundImage: NetworkImage("https://cdn0.iconfinder.com/data/icons/technology-business-and-people/1000/file_light-21-512.png"),
                    radius: 100,
                  ),
                  18.height,
                  // Displaying the change number information
                  const Text("Change your phone number will migrate your account info, group & settings.", style: TextStyle(fontSize: 16)),
                  8.height,
                  // Displaying the SMS or call confirmation information
                  const Text("Before proceeding, please confirm that your are able to receive SMS or calls at your new number.", style: TextStyle(fontSize: 14, color: Colors.grey)),
                  8.height,
                  // Displaying the new phone and new number information
                  const Text("If you have both new phone and new number, first change your number on your old phone.", style: TextStyle(fontSize: 14, color: Colors.grey))
                ],
              ),
              // Displaying the next button
              ElevatedButton(
                onPressed: () {
                  // Defining the action when the button is pressed
                  finish(context);
                  CGChangeNumber2().launch(context);
                },
                style: ElevatedButton.styleFrom(
                  // Setting the background color of the button
                  primary: Colors.green,
                ),
                child: const Text(
                  "NEXT",
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