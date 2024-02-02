import 'package:whatsapp/utils/WWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';

class CGChatSettingScreen extends StatefulWidget {
  @override
  _CGChatSettingScreenState createState() => _CGChatSettingScreenState();
}

class _CGChatSettingScreenState extends State<CGChatSettingScreen> {
  bool selectedTile = false;
  bool _isCheck1 = false, _isCheck2 = false;

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

  setSelectedRadio(bool val) {
    setState(() {
      selectedTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBar(context, title: 'Chats') as PreferredSizeWidget?,
        body: ListView(
          shrinkWrap: true,
          children: [
            SettingItemHeader(
              title: 'Display',
              padding: const EdgeInsets.only(top: 16.0, left: 24.0, right: 24.0, bottom: 4.0),
            ),
            SettingWidget(
              icon: Icons.wb_sunny,
              title: 'Theme',
              subtitle: 'System default',
            ),
            SettingWidget(
              icon: Icons.wallpaper,
              title: 'Wallpaper',
            ),
            Divider(thickness: 1),
            SettingItemHeader(
              title: 'Chat settings',
              padding: const EdgeInsets.only(top: 16.0, left: 24.0, right: 24.0, bottom: 4.0),
            ),
            SwitchListTile(
              contentPadding: const EdgeInsets.only(right: 16.0, left: 70.0, top: 12.0, bottom: 12.0),
              title: Text(
                'Enter is send',
                style: primaryTextStyle(),
              ),
              subtitle: Text(
                'Enter key will send your message',
                style: secondaryTextStyle(),
              ),
              value: _isCheck1,
              activeColor: Colors.teal,
              onChanged: (v) {
                setState(() {});
                _isCheck1 = v;
              },
            ),
            SwitchListTile(
              contentPadding: const EdgeInsets.only(right: 16.0, left: 70.0, top: 12.0, bottom: 12.0),
              title: Text(
                'Media visibility',
                style: primaryTextStyle(),
              ),
              subtitle: Text(
                'Show newly downloaded media in your phone\'s gallery',
                style: secondaryTextStyle(),
              ),
              value: _isCheck2,
              activeColor: Colors.teal,
              onChanged: (v) {
                setState(() {});
                _isCheck2 = v;
              },
            ),
            SettingWidget(
              padding: const EdgeInsets.only(right: 16.0, left: 70.0, top: 0.0, bottom: 0.0),
              title: 'Font Size',
            ),
            SettingWidget(
              padding: const EdgeInsets.only(right: 16.0, left: 70.0, top: 0.0, bottom: 0.0),
              title: 'App Language',
            ),
            const Divider(thickness: 1),
            SettingWidget(
              icon: Icons.backup,
              title: 'Chat Backup',
            ),
            SettingWidget(
              icon: Icons.history,
              title: 'Chat history',
            ),
          ],
        ),
      ),
    );
  }
}
