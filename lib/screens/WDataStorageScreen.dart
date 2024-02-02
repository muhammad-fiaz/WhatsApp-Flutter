import 'package:whatsapp/utils/WWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGDataStorageScreen extends StatefulWidget {
  @override
  _CGDataStorageScreenState createState() => _CGDataStorageScreenState();
}

class _CGDataStorageScreenState extends State<CGDataStorageScreen> {
  bool _isCheck = false;

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
        appBar: commonAppBar(context, title: 'Storage and data') as PreferredSizeWidget?,
        body: ListView(
          children: [
            SettingWidget(
              icon: Icons.drive_file_move,
              title: 'Manage storage',
              subtitle: '3.0 GB',
            ),
            Divider(),
            SettingWidget(
              icon: Icons.network_check_sharp,
              title: 'Network usage',
              subtitle: '3.5 GB sent · 9.4 GB received',
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.only(right: 16.0, left: 70.0, top: 12.0),
              title: Text(
                'Use less data for calls',
                style: primaryTextStyle(),
              ),
              value: _isCheck,
              activeColor: Colors.teal,
              onChanged: (v) {
                setState(() {});
                _isCheck = v;
              },
            ),
            Divider(),
            SettingItemHeader(
              title: 'Media auto-download',
              subtitle: 'Voice messages are always automatically downloaded',
              padding: EdgeInsets.only(top: 0.0, left: 70.0, right: 16.0, bottom: 4.0),
            ),
            SettingWidget(
              padding: EdgeInsets.only(right: 16.0, left: 70.0),
              title: 'When using mobile data',
              subtitle: 'No media',
            ),
            SettingWidget(
              padding: EdgeInsets.only(right: 16.0, left: 70.0),
              title: 'When connected on Wi-Fi',
              subtitle: 'No media',
            ),
            SettingWidget(
              padding: EdgeInsets.only(right: 16.0, left: 70.0),
              title: 'When roaming',
              subtitle: 'No media',
            ),
          ],
        ),
      ),
    );
  }
}
