// Importing necessary packages and modules
import 'package:whatsapp/utils/WConstant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// This widget is the root of the application.
class CGqrCode extends StatefulWidget {
  // Creates the mutable state for this widget at a given location in the tree.
  @override
  _CGqrCodeState createState() => _CGqrCodeState();
}

// This class holds the state for the CGqrCode widget.
class _CGqrCodeState extends State<CGqrCode> {
  // Describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          // Setting the padding of the container
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.05, vertical: MediaQuery.of(context).size.width / 2 - 50),
          // Setting the decoration of the container
          decoration: BoxDecoration(color: Colors.grey[300]),
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      // Setting the decoration of the container
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: Colors.white),
                      // Setting the height of the container
                      height: 300,
                      // Setting the margin of the container
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      // Setting the padding of the container
                      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
                      child: Column(
                        children: [
                          // Displaying the name of the user
                          Text(
                            "john smith",
                            style: boldTextStyle(),
                          ),
                          // Displaying the app contact information
                          const Text("$CGAppName contact"),
                          // Displaying the QR code image
                          Image.network(
                            "https://en.pimg.jp/064/305/428/1/64305428.jpg",
                            width: 200,
                            height: 200,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Displaying the user's avatar
                  const Positioned(
                    top: 0,
                    left: 100,
                    child: CircleAvatar(radius: 28, backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/96.jpg")),
                  ),
                ],
              ),
              // Displaying the QR code privacy information
              const Text("Your QR code is private. If you share it with someone, they can scan it with their $CGAppName camera to add you as a contact."),
            ],
          ),
        ),
      ),
    );
  }
}