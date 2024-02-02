// Importing necessary packages and modules
import 'package:whatsapp/utils/WConstant.dart';
import 'package:whatsapp/utils/WWidgets.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// This widget is the root of the application.
class CGTwoStepsVerificationPwdScreen extends StatefulWidget {
  // Page controller for the page view
  PageController? _pageController;
  // Index of the current page
  int index = 0;

  // Creates the mutable state for this widget at a given location in the tree.
  @override
  _CGTwoStepsVerificationPwdScreenState createState() => _CGTwoStepsVerificationPwdScreenState();
}

// This class holds the state for the CGTwoStepsVerificationPwdScreen widget.
class _CGTwoStepsVerificationPwdScreenState extends State<CGTwoStepsVerificationPwdScreen> {
  // Initializes the state of the widget after having been inserted into the tree.
  @override
  void initState() {
    // Initialize the page controller
    widget._pageController = PageController(initialPage: 0);
    super.initState();
  }

  // Describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Setting the app bar of the scaffold
        appBar: commonAppBar(context, title: "Two-step verification") as PreferredSizeWidget?,
        body: PageView(
          // Disabling the scroll physics of the page view
          physics: const NeverScrollableScrollPhysics(),
          // Setting the controller of the page view
          controller: widget._pageController,
          children: [
            // Creating the pages of the page view
            _pageViewPWDDataItem(titleText: "Enter 6-digit PIN which you\'ll be asked for when you register your phone number with $CGAppName", hintText: " * * * * * * ", btnText: "NEXT", index: 1),
            _pageViewPWDDataItem(titleText: "Confirm your PIN.", hintText: " * * * * * * ", btnText: "NEXT", index: 2),
            _pageViewEmailData(titleText: "Add an email address to your account which will be used to reset your PIN if you forget it and safeguard your account.", hintText: "Enter Email", btnText: "NEXT", index: 3),
            _pageViewEmailData(titleText: "Confirm Email", hintText: "Enter Email", btnText: "Done", index: 4)
          ],
        ),
      ),
    );
  }

  // This method returns a widget that represents a page view item for password data
  Widget _pageViewPWDDataItem({required String titleText, String? hintText, required String btnText, int? index}) {
    return Container(
      // Setting the padding of the container
      padding: const EdgeInsets.only(top: CGAppPadding, left: CGAppPadding, right: CGAppPadding, bottom: 10.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            // Displaying the title text
            Text(
              titleText,
              style: const TextStyle(fontSize: CGAppTextSize),
            ),
            32.height,
            // Displaying the text field for password input
            SizedBox(
              width: 150,
              child: TextField(
                maxLines: 1,
                keyboardType: TextInputType.phone,
                style: const TextStyle(fontSize: CGAppTextSize),
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: hintText),
              ),
            )
          ],
        ),
        // Displaying the next button
        ElevatedButton(
          onPressed: () {
            // Defining the action when the button is pressed
            widget._pageController!.animateToPage(
              index!,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOutQuad,
            );
            //print(index);
          },
          style: ElevatedButton.styleFrom(
            // Setting the background color of the button
            primary: Colors.green,
          ),
          child: Text(
            btnText,
            style: const TextStyle(
              // Setting the text color of the button
              color: Colors.white,
            ),
          ),
        ),

      ]),
    );
  }

  // This method returns a widget that represents a page view item for email data
  Widget _pageViewEmailData({String? titleText, String? hintText, required String btnText, int? index}) {
    return Container(
      // Setting the padding of the container
      padding: const EdgeInsets.only(top: CGAppPadding, left: CGAppPadding, right: CGAppPadding, bottom: 10.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            // Displaying the title text
            Text.rich(TextSpan(children: [TextSpan(text: index == 4 ? null : "Skip", style: const TextStyle(color: Colors.blue, fontSize: CGAppTextSize))], text: titleText)),
            32.height,
            // Displaying the text field for email input
            SizedBox(
              width: 350,
              child: TextField(
                maxLines: 1,
                keyboardType: TextInputType.phone,
                style: const TextStyle(fontSize: CGAppTextSize),
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: hintText),
              ),
            )
          ],
        ),
        // Displaying the next or done button
        ElevatedButton(
          onPressed: () {
            if (index == 4) {
              // Defining the action when the done button is pressed
              finish(context);
              toast("Successfully Verified");
            } else {
              // Defining the action when the next button is pressed
              widget._pageController!.animateToPage(
                index!,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutQuad,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            // Setting the background color of the button
            primary: Colors.green,
          ),
          child: Text(
            btnText,
            style: const TextStyle(
              // Setting the text color of the button
              color: Colors.white,
            ),
          ),
        ),

      ]),
    );
  }
}