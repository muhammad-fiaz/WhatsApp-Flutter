// Importing necessary packages and modules
import 'package:whatsapp/screens/WDashboardScreen.dart';
import 'package:whatsapp/utils/WConstant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// This widget is the root of the application.
class CGSplashScreen extends StatefulWidget {
  // Tag for this screen
  static String tag = '/CGSplashScreen';

  // Creates the mutable state for this widget at a given location in the tree.
  @override
  CGSplashScreenState createState() => CGSplashScreenState();
}

// This class holds the state for the CGSplashScreen widget.
class CGSplashScreenState extends State<CGSplashScreen> {
  // Initializes the state of the widget after having been inserted into the tree.
  @override
  void initState() {
    super.initState();
    init();
  }

  // This method is used to perform some initial setup.
  init() async {
    checkFirstSeen();
  }

  // This method is used to check if the app is being opened for the first time.
  Future checkFirstSeen() async {
    // Delay for 2 seconds
    await Future.delayed(const Duration(seconds: 2));
    // Finish the current screen
    finish(context);
    // Launch the dashboard screen
    CGDashoardScreen().launch(context);
  }

  // This method is used to change the state of the widget.
  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  // Describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Setting the background color of the scaffold
        backgroundColor: getColorFromHex('#FFFFFF'),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Displaying the app icon at the center of the screen
            Image.asset("images/whatsApp/app_ic_wp.png", height: 150, width: 150).center(),
            Positioned(
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Displaying the text "From"
                  Text('From', style: secondaryTextStyle()),
                  // Displaying the app name
                  Text(CGAppName, style: boldTextStyle(size: 25, color: Colors.black)),
                ],
              ).paddingBottom(16),
            )
          ],
        ),
      ),
    );
  }
}