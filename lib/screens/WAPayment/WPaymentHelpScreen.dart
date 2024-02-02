// Importing necessary packages and modules
import 'package:whatsapp/utils/WConstant.dart';
import 'package:whatsapp/utils/WWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// This widget is the root of the application.
class CGPaymentHelpScreen extends StatefulWidget {
  // Creates the mutable state for this widget at a given location in the tree.
  @override
  _CGPaymentHelpScreenState createState() => _CGPaymentHelpScreenState();
}

// This class holds the state for the CGPaymentHelpScreen widget.
class _CGPaymentHelpScreenState extends State<CGPaymentHelpScreen> {
  // Controller for the text field
  final TextEditingController _textEditingController = TextEditingController();
  // Boolean to enable or disable the button
  bool enable = false;

  // Describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Setting the app bar with a common style and title
        appBar: commonAppBar(context, title: "Contact us") as PreferredSizeWidget?,
        body: Container(
          // Setting padding for the container
          padding: const EdgeInsets.all(CGAppPadding),
          child: Column(
            // Aligning the children vertically with space between them
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // Setting padding and background color for the container
                padding: const EdgeInsets.all(4),
                color: Colors.grey[300],
                child: TextField(
                  // Setting the controller for the text field
                  controller: _textEditingController,
                  // Enabling or disabling the button based on the text field content
                  onChanged: (data) {
                    _textEditingController.text.isEmpty ? enable = false : enable = true;
                    setState(() {});
                  },
                  // Allowing multiple lines in the text field
                  maxLines: 4,
                  // Setting a hint for the text field
                  decoration: const InputDecoration(hintText: "Describe your problem"),
                ),
              ),
              Row(
                // Aligning the children horizontally with space between them
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text widget with a question
                    const Text("Have you read our FAQ yet?", style: TextStyle(color: Colors.blue, fontSize: 18)),
                    // Button that finishes the context when enabled and pressed
                    ElevatedButton(
                      onPressed: enable
                          ? () {
                        finish(context);
                      }
                          : null,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      child: const Text(
                        "DONE",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ]
              )
            ],
          ),
        ),
      ),
    );
  }
}