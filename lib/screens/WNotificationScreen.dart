import 'package:whatsapp/utils/WWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGNotificationScreen extends StatefulWidget {
  @override
  _CGNotificationScreenState createState() => _CGNotificationScreenState();
}

class _CGNotificationScreenState extends State<CGNotificationScreen> {
  bool _isCheck1 = false, _isCheck2 = false, _isCheck3 = false;

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
        appBar: commonAppBar(context, title: 'Notification') as PreferredSizeWidget?,
        body: ListView(
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          children: [
            SwitchListTile(
              title: Text('Conversation tones', style: primaryTextStyle()),
              contentPadding: const EdgeInsets.only(top: 0.0, left: 16.0, right: 16.0, bottom: 4.0),
              subtitle: Text('Play sounds for incoming and outgoing messages.', style: secondaryTextStyle()),
              onChanged: (bool value) {
                setState(() {});
                _isCheck1 = value;
              },
              activeColor: Colors.teal,
              value: _isCheck1,
            ),
            const Divider(),
            SettingItemHeader(
              title: 'Messages',
              padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 4.0),
            ),
            SettingWidget(
              title: 'Notification tone',
              subtitle: 'Default (notification_001)',
              padding: const EdgeInsets.only(top: 0.0, left: 16.0, right: 16.0, bottom: 4.0),
            ),
            SettingWidget(
              title: 'Vibrate',
              subtitle: 'Default',
              padding: const EdgeInsets.only(top: 0.0, left: 16.0, right: 16.0, bottom: 4.0),
            ),
            SettingWidget(
              title: 'Popup notification',
              subtitle: 'Not available',
              padding: const EdgeInsets.only(top: 0.0, left: 16.0, right: 16.0, bottom: 4.0),
            ),
            SettingWidget(
              title: 'Light',
              subtitle: 'white',
              padding: const EdgeInsets.only(top: 0.0, left: 16.0, right: 16.0, bottom: 4.0),
            ),
            SwitchListTile(
              contentPadding: const EdgeInsets.only(top: 0.0, left: 16.0, right: 16.0, bottom: 4.0),
              title: Text('Use high priority notifications', style: primaryTextStyle()),
              subtitle: Text('Show previews of notifications at the top of the screen.', style: secondaryTextStyle()),
              onChanged: (bool value) {
                setState(() {});
                _isCheck3 = value;
              },
              activeColor: Colors.teal,
              value: _isCheck3,
            ),
            const Divider(),
            SettingItemHeader(
              title: 'Groups',
              padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 4.0),
            ),
            SettingWidget(
              title: 'Notification tone',
              subtitle: 'Default (notification_001)',
              padding: const EdgeInsets.only(top: 0.0, left: 16.0, right: 16.0, bottom: 4.0),
            ),
            SettingWidget(
              title: 'Vibrate',
              subtitle: 'Default',
              padding: const EdgeInsets.only(top: 0.0, left: 16.0, right: 16.0, bottom: 4.0),
            ),
            SettingWidget(
              title: 'Popup notification',
              subtitle: 'Not available',
              padding: const EdgeInsets.only(top: 0.0, left: 16.0, right: 16.0, bottom: 4.0),
            ),
            SettingWidget(
              title: 'Light',
              subtitle: 'white',
              padding: const EdgeInsets.only(top: 0.0, left: 16.0, right: 16.0, bottom: 4.0),
            ),
            SwitchListTile(
              contentPadding: const EdgeInsets.only(top: 0.0, left: 16.0, right: 16.0, bottom: 4.0),
              title: Text('Use high priority notifications', style: primaryTextStyle()),
              subtitle: Text('Show previews of notifications at the top of the screen.', style: secondaryTextStyle()),
              onChanged: (bool value) {
                setState(() {});
                _isCheck2 = value;
              },
              activeColor: Colors.teal,
              value: _isCheck2,
            ),
            const Divider(),
            SettingItemHeader(
              title: 'Calls',
              padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 24.0, bottom: 4.0),
            ),
            SettingWidget(
              title: 'Ringtone',
              subtitle: 'Default(Tere Bin Nahi Lagda)',
              padding: const EdgeInsets.only(top: 0.0, left: 24.0, right: 24.0, bottom: 4.0),
            ),
            SettingWidget(
              title: 'Vibrate',
              subtitle: 'Default',
              padding: const EdgeInsets.only(top: 0.0, left: 24.0, right: 24.0, bottom: 4.0),
            ),
          ],
        ),
      ),
    );
  }
}
