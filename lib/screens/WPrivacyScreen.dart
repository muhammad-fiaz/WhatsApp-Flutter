import 'package:whatsapp/utils/WWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGPrivacyScreen extends StatefulWidget {
  @override
  _CGPrivacyScreenState createState() => _CGPrivacyScreenState();
}

class _CGPrivacyScreenState extends State<CGPrivacyScreen> {
  bool _isChange = false;
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
        appBar: commonAppBar(context, title: 'Privacy') as PreferredSizeWidget?,
        body: ListView(
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          children: [
            10.height,
            SettingItemHeader(
              title: 'Who can see my personal info',
              subtitle: 'if you don\'t share your Last Seen, you won\'t be able to see other people\'s Last Seen',
            ),
            SettingWidget(
              title: 'Last seen',
              subtitle: 'Nobody',
            ),
            SettingWidget(
              title: 'Profile photo',
              subtitle: 'My contacts',
            ),
            SettingWidget(
              title: 'About',
              subtitle: 'My contacts',
            ),
            SettingWidget(
              title: 'Status',
              subtitle: '15 contacts selected',
            ),
            SwitchListTile(
              contentPadding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 12.0, bottom: 12.0),
              title: Text(
                'Read receipt',
                style: primaryTextStyle(weight: FontWeight.w500),
              ),
              subtitle: Text(
                'If turned off, you won\'t send or receive Read receipts, Read receipts are always sent for group chats',
                style: secondaryTextStyle(),
              ),
              value: _isChange,
              activeColor: Colors.teal,
              onChanged: (v) {
                _isChange = v;
                setState(() {});
              },
            ),
            const Divider(),
            SettingWidget(
              title: 'Groups',
              subtitle: 'My contacts',
            ),
            SettingWidget(
              title: 'Live location',
              subtitle: 'None',
            ),
            SettingWidget(
              title: 'Blocked contacts',
              subtitle: '21',
            ),
            SettingWidget(
              title: 'FingerPrint lock',
              subtitle: 'Disabled',
            ),
          ],
        ),
      ),
    );
  }
}
