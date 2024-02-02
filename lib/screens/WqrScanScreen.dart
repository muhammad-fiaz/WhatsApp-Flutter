import 'package:whatsapp/screens/WAqrScreen/WqrCodeScreen.dart';
import 'package:whatsapp/utils/WColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:share/share.dart';

class CGqrScanScreen extends StatefulWidget {
  @override
  _CGqrScanScreenState createState() => _CGqrScanScreenState();
}

class _CGqrScanScreenState extends State<CGqrScanScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text("QR code", style: boldTextStyle(size: 22)),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: secondaryColor,
              ),
              onPressed: () {
                finish(context);
              },
            ),
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.share, color: Colors.grey),
                  onPressed: () {
                    Share.share("abc");
                  }),
              IconButton(icon: const Icon(Icons.more_vert, color: Colors.grey), onPressed: () {})
            ],
            bottom: TabBar(
              controller: _tabController,
              onTap: (index) {},
              labelPadding: const EdgeInsets.all(10.0),
              indicatorColor: secondaryColor,
              tabs: const [Text("MY CODE", style: TextStyle(color: Colors.black, fontSize: 18)), Text("SCAN CODE", style: TextStyle(color: Colors.black, fontSize: 18))],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              CGqrCode(),
              Container(
                child: const Text('Coming Soon').center(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
