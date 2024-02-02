import 'package:whatsapp/screens/WChangeNumber/WChangeNumber1Screen.dart';
import 'package:whatsapp/screens/WDeleteMyAccountScreen.dart';
import 'package:whatsapp/screens/WPrivacyScreen.dart';
import 'package:whatsapp/screens/WRequestAccountInfoScreen.dart';
import 'package:whatsapp/screens/WATwoStepsVerification/WTwoStepsVerificationEnableScreen.dart';
import 'package:whatsapp/utils/WWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGAccountSettingScreen extends StatefulWidget {
  @override
  _CGAccountSettingScreenState createState() => _CGAccountSettingScreenState();
}

class _CGAccountSettingScreenState extends State<CGAccountSettingScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBar(context, title: 'Account') as PreferredSizeWidget?,
        body: ListView(
          children: [
            SettingWidget(
              icon: Icons.lock,
              title: 'Privacy',
              onTap: () {
                CGPrivacyScreen().launch(context);
              },
            ),
            SettingWidget(
              icon: Icons.security,
              title: 'Security',
            ),
            SettingWidget(
              icon: Icons.verified_user,
              title: 'Two-step verification',
              onTap: () {
                CGTwoStepsVerificationEnable().launch(context);
              },
            ),
            SettingWidget(
              icon: Icons.phonelink_setup,
              title: 'Change number',
              onTap: () {
                CGChangeNumber().launch(context);
              },
            ),
            SettingWidget(
              icon: Icons.insert_drive_file,
              title: 'Request account info',
              onTap: () {
                CGRequestAccountInfo().launch(context);
              },
            ),
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
