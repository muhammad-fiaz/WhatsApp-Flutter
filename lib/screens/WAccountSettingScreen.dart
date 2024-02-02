// Importing necessary packages and modules
import 'package:whatsapp/screens/WChangeNumber/WChangeNumber1Screen.dart';
import 'package:whatsapp/screens/WDeleteMyAccountScreen.dart';
import 'package:whatsapp/screens/WPrivacyScreen.dart';
import 'package:whatsapp/screens/WRequestAccountInfoScreen.dart';
import 'package:whatsapp/screens/WATwoStepsVerification/WTwoStepsVerificationEnableScreen.dart';
import 'package:whatsapp/utils/WWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// This widget is the root of the application.
class CGAccountSettingScreen extends StatefulWidget {
  // Creates the mutable state for this widget at a given location in the tree.
  @override
  _CGAccountSettingScreenState createState() => _CGAccountSettingScreenState();
}

// This class holds the state for the CGAccountSettingScreen widget.
class _CGAccountSettingScreenState extends State<CGAccountSettingScreen> {
  // Initializes the state of the widget after having been inserted into the tree.
  @override
  void initState() {
    super.initState();
    init();
  }

  // This method is used to perform some initial setup.
  init() async {}

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
        // Setting the app bar of the scaffold
        appBar: commonAppBar(context, title: 'Account') as PreferredSizeWidget?,
        body: ListView(
          children: [
            // Creating a setting widget for privacy
            SettingWidget(
              icon: Icons.lock,
              title: 'Privacy',
              onTap: () {
                CGPrivacyScreen().launch(context);
              },
            ),
            // Creating a setting widget for security
            const SettingWidget(
              icon: Icons.security,
              title: 'Security',
            ),
            // Creating a setting widget for two-step verification
            SettingWidget(
              icon: Icons.verified_user,
              title: 'Two-step verification',
              onTap: () {
                CGTwoStepsVerificationEnable().launch(context);
              },
            ),
            // Creating a setting widget for changing number
            SettingWidget(
              icon: Icons.phonelink_setup,
              title: 'Change number',
              onTap: () {
                CGChangeNumber().launch(context);
              },
            ),
            // Creating a setting widget for requesting account info
            SettingWidget(
              icon: Icons.insert_drive_file,
              title: 'Request account info',
              onTap: () {
                CGRequestAccountInfo().launch(context);
              },
            ),
            // Creating a setting widget for deleting account
            SettingWidget(
              icon: Icons.delete,
              title: 'Delete my account',
              onTap: () {
                CGDeleteMyAccount().launch(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}