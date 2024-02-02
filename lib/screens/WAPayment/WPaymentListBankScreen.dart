// Importing necessary packages and modules
import 'package:whatsapp/utils/WColors.dart';
import 'package:whatsapp/utils/WDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// This widget is the root of the application.
class CGPaymentListBankScreen extends StatefulWidget {
  // Creates the mutable state for this widget at a given location in the tree.
  @override
  _CGPaymentListBankScreenState createState() => _CGPaymentListBankScreenState();
}

// This class holds the state for the CGPaymentListBankScreen widget.
class _CGPaymentListBankScreenState extends State<CGPaymentListBankScreen> {
  // Describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // Setting the background color of the app bar
          backgroundColor: secondaryColor,
          // Setting the leading widget of the app bar
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              // Defining the action when the leading widget is pressed
              onPressed: () {
                finish(context);
              }),
          // Setting the title of the app bar
          title: const Text("Select your bank", style: TextStyle(fontWeight: FontWeight.bold)),
          // Setting the actions of the app bar
          actions: [IconButton(icon: const Icon(Icons.search, color: Colors.white), onPressed: () {})],
        ),
        body: ListView.builder(
          // Setting the item count of the list view
            itemCount: banklist.length,
            // Defining the builder for the list view
            itemBuilder: (context, index) {
              return InkWell(
                // Defining the action when the item is tapped
                onTap: () {
                  setState(() {});
                  finish(context, banklist[index]);
                },
                child: Container(
                  // Setting the padding of the container
                  padding: const EdgeInsets.only(top: 8, bottom: 16, left: 16),
                  child: Row(
                    // Defining the children of the row
                    children: [
                      Container(
                        // Setting the width and height of the container
                        width: 36,
                        height: 36,
                        // Setting the child of the container
                        child: Image.network("${banklist[index].bankImage}"),
                      ).cornerRadiusWithClipRRect(60),
                      // Adding a horizontal space
                      32.width,
                      // Adding a text widget
                      Text("${banklist[index].bankName}", style: boldTextStyle(size: 16))
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}