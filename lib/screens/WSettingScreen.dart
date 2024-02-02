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

class CGSettingScreen extends StatefulWidget {
  @override
  _CGSettingScreenState createState() => _CGSettingScreenState();
}

class _CGSettingScreenState extends State<CGSettingScreen> {
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
        appBar: commonAppBar(context, title: 'Settings') as PreferredSizeWidget?,
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: InkWell(
                onTap: () {
                  CGEditProfileScreen().launch(context);
                },
                child: Row(
                  children: [
                    Hero(
                      tag: "profile_image",
                      child: CircleAvatar(
                        radius: 32.0,
                        backgroundImage: Image.network('https://randomuser.me/api/portraits/women/65.jpg').image,
                      ),
                    ),
                    10.width,
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
                    IconButton(
                      icon: const Icon(
                        Icons.qr_code_scanner,
                        color: secondaryColor,
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CGqrScanScreen()));
                      },
                    )
                  ],
                ),
              ),
            ),
            SettingWidget(
              icon: Icons.vpn_key,
              title: 'Account',
              subtitle: 'Privacy, security, change number',
              onTap: () {
                CGAccountSettingScreen().launch(context);
              },
            ),
            SettingWidget(
              icon: Icons.chat,
              title: 'Chats',
              subtitle: 'Backup, history, wallpaper',
              onTap: () {
                CGChatSettingScreen().launch(context);
              },
            ),
            SettingWidget(
              icon: Icons.notifications,
              title: 'Notifications',
              subtitle: 'Message, group & call tones',
              onTap: () {
                CGNotificationScreen().launch(context);
              },
            ),
            SettingWidget(
              icon: Icons.data_usage,
              title: 'Data and storage usage',
              subtitle: 'Network usage, auto-download',
              onTap: () {
                CGDataStorageScreen().launch(context);
              },
            ),
            SettingWidget(
              icon: Icons.help_outline,
              title: 'Help',
              subtitle: 'FAQ, contact us, privacy policy',
              onTap: () {
                CGHelpScreen().launch(context);
              },
            ),
            const Divider(),
            SettingWidget(
              icon: Icons.group,
              title: 'Invite a friend',
            ),
          ],
        ),
      ),
    );
  }
}
