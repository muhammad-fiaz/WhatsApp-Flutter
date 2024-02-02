// Importing necessary packages and modules
import 'package:whatsapp/screens/WAqrScreen/WqrCodeScreen.dart';
import 'package:whatsapp/utils/WColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:share/share.dart';

// CGqrScanScreen is a StatefulWidget that represents the QR code scanning screen
class CGqrScanScreen extends StatefulWidget {
  @override
  _CGqrScanScreenState createState() => _CGqrScanScreenState();
}

// _CGqrScanScreenState is the state associated with CGqrScanScreen
class _CGqrScanScreenState extends State<CGqrScanScreen> with SingleTickerProviderStateMixin {
  // TabController to control and manage the tabs on the screen
  TabController? _tabController;

  // initState is called once when the stateful widget is inserted in the widget tree
  @override
  void initState() {
    // Initializing the TabController with two tabs and setting the initial tab
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
  }

  // build method describes the part of the user interface represented by the widget
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            // Setting the background color of the AppBar
            backgroundColor: Colors.white,
            // Setting the title of the AppBar
            title: Text("QR code", style: boldTextStyle(size: 22)),
            // Setting the leading widget of the AppBar
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: secondaryColor,
              ),
              onPressed: () {
                finish(context);
              },
            ),
            // Setting the action widgets of the AppBar
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.share, color: Colors.grey),
                  onPressed: () {
                    Share.share("abc");
                  }),
              IconButton(icon: const Icon(Icons.more_vert, color: Colors.grey), onPressed: () {})
            ],
            // Setting the bottom widget of the AppBar
            bottom: TabBar(
              controller: _tabController,
              onTap: (index) {},
              labelPadding: const EdgeInsets.all(10.0),
              indicatorColor: secondaryColor,
              tabs: const [Text("MY CODE", style: TextStyle(color: Colors.black, fontSize: 18)), Text("SCAN CODE", style: TextStyle(color: Colors.black, fontSize: 18))],
            ),
          ),
          // Setting the body of the Scaffold
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