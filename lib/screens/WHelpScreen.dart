import 'package:whatsapp/utils/WWidgets.dart';
import 'package:flutter/material.dart';

class CGHelpScreen extends StatefulWidget {
  @override
  _CGHelpScreenState createState() => _CGHelpScreenState();
}

class _CGHelpScreenState extends State<CGHelpScreen> {
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
        appBar: commonAppBar(context, title: 'Help') as PreferredSizeWidget?,
        body: ListView(
          children: [
            SettingWidget(
              icon: Icons.help,
              title: 'FAQ',
            ),
            SettingWidget(
              icon: Icons.people,
              title: 'Contact us',
              subtitle: 'Questions?Need help?',
            ),
            SettingWidget(
              icon: Icons.insert_drive_file,
              title: 'Terms and Privacy Policy',
            ),
            SettingWidget(
              icon: Icons.info_outline,
              title: 'App info',
            ),
          ],
        ),
      ),
    );
  }
}
