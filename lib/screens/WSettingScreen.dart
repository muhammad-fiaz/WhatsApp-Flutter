// Importing necessary packages and modules
import 'package:whatsapp/screens/WAccountSettingScreen.dart';
import 'package:whatsapp/screens/WChatSettingScreen.dart';
import 'package:whatsapp/screens/WDataStorageScreen.dart';
import 'package:whatsapp/screens/WEditProfileScreen.dart';
import 'package:whatsapp/screens/WHelpScreen.dart';
import 'package:whatsapp/screens/WNotificationScreen.dart';
import 'package:whatsapp/screens/WqrScanScreen.dart';
import 'package:whatsapp/utils/WColors.dart';
import 'package:whatsapp/utils/WWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// This widget is the root of the application.
class CGSettingScreen extends StatefulWidget {
  // Creates the mutable state for this widget at a given location in the tree.
  @override
  _CGSettingScreenState createState() => _CGSettingScreenState();
}

// This class holds the state for the CGSettingScreen widget.
class _CGSettingScreenState extends State<CGSettingScreen> {
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
        appBar: commonAppBar(context, title: 'Settings') as PreferredSizeWidget?,
        body: ListView(
          children: [
            // Creating a container for the user's profile
            Container(
              padding: const EdgeInsets.all(16),
              child: InkWell(
                onTap: () {
                  // Defining the action when the profile is tapped
                  CGEditProfileScreen().launch(context);
                },
                child: Row(
                  children: [
                    // Displaying the user's avatar
                    Hero(
                      tag: "profile_image",
                      child: CircleAvatar(
                        radius: 32.0,
                        backgroundImage: Image.network('https://randomuser.me/api/portraits/women/65.jpg').image,
                      ),
                    ),
                    10.width,
                    // Displaying the user's name and status
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('John Smith', style: boldTextStyle()),
                        4.height,
                        const Text(
                          'Hey there! i am using WhatsApp.',
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ).expand(),
                    // Displaying the QR code scanner button
                    IconButton(
                      icon: const Icon(
                        Icons.qr_code_scanner,
                        color: secondaryColor,
                      ),
                      onPressed: () {
                        // Defining the action when the QR code scanner button is pressed
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CGqrScanScreen()));
                      },
                    )
                  ],
                ),
              ),
            ),
            // Creating the settings options
            SettingWidget(
              icon: Icons.vpn_key,
              title: 'Account',
              subtitle: 'Privacy, security, change number',
              onTap: () {
                // Defining the action when the "Account" option is tapped
                CGAccountSettingScreen().launch(context);
              },
            ),
            SettingWidget(
              icon: Icons.chat,
              title: 'Chats',
              subtitle: 'Backup, history, wallpaper',
              onTap: () {
                // Defining the action when the "Chats" option is tapped
                CGChatSettingScreen().launch(context);
              },
            ),
            SettingWidget(
              icon: Icons.notifications,
              title: 'Notifications',
              subtitle: 'Message, group & call tones',
              onTap: () {
                // Defining the action when the "Notifications" option is tapped
                CGNotificationScreen().launch(context);
              },
            ),
            SettingWidget(
              icon: Icons.data_usage,
              title: 'Data and storage usage',
              subtitle: 'Network usage, auto-download',
              onTap: () {
                // Defining the action when the "Data and storage usage" option is tapped
                CGDataStorageScreen().launch(context);
              },
            ),
            SettingWidget(
              icon: Icons.help_outline,
              title: 'Help',
              subtitle: 'FAQ, contact us, privacy policy',
              onTap: () {
                // Defining the action when the "Help" option is tapped
                CGHelpScreen().launch(context);
              },
            ),
            // Creating a divider
            const Divider(),
            // Creating the "Invite a friend" option
            const SettingWidget(
              icon: Icons.group,
              title: 'Invite a friend',
            ),
          ],
        ),
      ),
    );
  }
}