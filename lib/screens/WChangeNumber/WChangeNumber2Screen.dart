// Importing necessary packages and modules
import 'package:whatsapp/utils/WConstant.dart';
import 'package:whatsapp/utils/WWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// This widget is the root of the application.
class CGChangeNumber2 extends StatefulWidget {
  // Creates the mutable state for this widget at a given location in the tree.
  @override
  _CGChangeNumber2State createState() => _CGChangeNumber2State();
}

// This class holds the state for the CGChangeNumber2 widget.
class _CGChangeNumber2State extends State<CGChangeNumber2> {
  // Describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Setting the app bar of the scaffold
        appBar: commonAppBar(context, title: "Change number") as PreferredSizeWidget?,
        body: Container(
          // Setting the decoration of the container
          decoration: const BoxDecoration(),
          // Setting the padding of the container
          padding: const EdgeInsets.only(top: CGAppPadding, left: CGAppPadding, right: CGAppPadding, bottom: 10.0),
          child: Container(
            // Setting the decoration of the inner container
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(children: [
                  // Displaying the instruction for entering the old phone number
                  const Text("Enter your old phone number with country code.",
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  Container(
                    // Setting the padding of the container
                    padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          // Displaying the text field for entering the country code of the old phone number
                          child: const TextField(readOnly: true, decoration: InputDecoration(hintText: "+91")),
                        ),
                        10.width,
                        // Displaying the text field for entering the old phone number
                        const Flexible(
                          child: TextField(decoration: InputDecoration(hintText: "old phone number")),
                        ),
                      ],
                    ),
                  ),
                  // Displaying the instruction for entering the new phone number
                  const Text("Enter your new phone number with country code.",
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  Container(
                    // Setting the padding of the container
                    padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          // Displaying the text field for entering the country code of the new phone number
                          child: const TextField(readOnly: true, decoration: InputDecoration(hintText: "+91")),
                        ),
                        10.width,
                        // Displaying the text field for entering the new phone number
                        const Flexible(
                          child: TextField(decoration: InputDecoration(hintText: "New phone number")),
                        ),
                      ],
                    ),
                  ),
                ]),
                // Displaying the next button
                ElevatedButton(
                  onPressed: () {
                    // Defining the action when the button is pressed
                    finish(context);
                    toast("Change Number Successfully");
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
      ),
    );
  }
}