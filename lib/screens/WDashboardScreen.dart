import 'package:whatsapp/components/WCameraWidget.dart';
import 'package:whatsapp/screens/WCallScreen.dart';
import 'package:whatsapp/screens/WChatScreen.dart';
import 'package:whatsapp/screens/WNewGroupAndBroadcastScreen.dart';
import 'package:whatsapp/screens/WAPayment/WPaymentScreen.dart';
import 'package:whatsapp/screens/WSelectContactScreen.dart';
import 'package:whatsapp/screens/WSettingScreen.dart';
import 'package:whatsapp/screens/WStatusPrivacyScreen.dart';
import 'package:whatsapp/screens/WStoryScreen.dart';
import 'package:whatsapp/utils/WColors.dart';
import 'package:whatsapp/utils/WConstant.dart';
import 'package:whatsapp/utils/WDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../components/model/WChatModel.dart';

class CGDashoardScreen extends StatefulWidget {
  @override
  _CGDashoardScreenState createState() => _CGDashoardScreenState();
}

class _CGDashoardScreenState extends State<CGDashoardScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int tabIndex = 1;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    _tabController = TabController(vsync: this, initialIndex: 1, length: 4);
    _tabController!.addListener(() {
      setState(() {
        tabIndex = _tabController!.index;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            backgroundColor: secondaryColor,
            title: Text(CGAppName, style: boldTextStyle(size: 22, weight: FontWeight.w900, color: Colors.white)),
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: iconPrimaryColor),
                onPressed: () {
                  showSearch(context: context, delegate: SearchContact());
                },
              ),
              PopupMenuButton(
                onSelected: (dynamic v) {
                  if (v == 5) {
                    CGSettingScreen().launch(context);
                  } else if (tabIndex == 2 && v == 1) {
                    CGStatusPrivacyScreen().launch(context);
                  } else if (tabIndex == 3 && v == 1) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: const Text("Do you want to clear your entire call log?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                finish(context);
                              },
                              child: Text("CANCEL", style: boldTextStyle(color: secondaryColor)),
                            ),
                            TextButton(
                              onPressed: () {
                                finish(context);
                              },
                              child: Text("OK", style: boldTextStyle(color: secondaryColor)),
                            ),
                          ],
                        );
                      },
                    );
                  } else if (v == 1 && tabIndex == 1) {
                    CGNewGroupAndBroadcastScreen(isNewGroup: true).launch(context);
                  } else if (v == 2 && tabIndex == 1) {
                    CGNewGroupAndBroadcastScreen(isNewGroup: false).launch(context);
                  } else if (v == 6 && tabIndex == 1) {
                    CGPaymentScreen().launch(context);
                  } else if (v == 3 && tabIndex == 1) {
                    toast('Coming soon');
                  }
                },
                child: IconButton(
                  icon: const Icon(Icons.more_vert_outlined, color: iconPrimaryColor),
                  onPressed: () {},
                ),
                itemBuilder: (context) {
                  if (tabIndex == 1) {
                    return chatpopupItem;
                  } else if (tabIndex == 2) {
                    return statuspopupItem;
                  } else if (tabIndex == 3) {
                    return callpopupItem;
                  }
                  return chatpopupItem;
                },
              ),
            ],
            bottom: TabBar(
              onTap: (index) {
                setState(() {});
                tabIndex = index;
              },
              controller: _tabController,
              indicatorColor: Colors.white,
              labelStyle: boldTextStyle(size: 16, color: textPrimaryColors),
              unselectedLabelColor: textSecondaryColors,
              labelColor: textPrimaryColors,
              tabs: [
                SizedBox(width: 40, child: const Icon(Icons.camera_alt, color: iconPrimaryColor)),
                Row(
                  children: [
                    Tab(text: 'Chats'.toUpperCase()),
                    8.width,
                    Container(
                      decoration: BoxDecoration(color: tabIndex == 1 ? Colors.white : Colors.white54, borderRadius: BorderRadius.circular(30.0)),
                      constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                      child: const Text("2", style: TextStyle(fontSize: 12, color: secondaryColor)).center(),
                    )
                  ],
                ),
                Tab(text: 'Status'.toUpperCase()),
                Tab(text: 'Calls'.toUpperCase()),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              CGCameraWidget(),
              CGChatScreen(),
              CGStoryScreen(),
              const CGCallScreen(),
            ],
          ),
          floatingActionButton: _changeFLoatingActionButton(tabIndex),
        ),
      ),
    );
  }

  _changeFLoatingActionButton(int indexAt) {
    if (indexAt == 1) {
      return FloatingActionButton(
        backgroundColor: buttonColor,
        onPressed: () {
          CGSelectContactScreen(isCallScreen: false).launch(context);
        },
        child: const Icon(Icons.message, color: Colors.white),
      );
    } else if (indexAt == 2) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 1,
            mini: true,
            backgroundColor: Colors.white,
            onPressed: () {},
            child: const Icon(Icons.create, color: secondaryColor),
          ),
          8.height,
          FloatingActionButton(
            heroTag: 2,
            backgroundColor: buttonColor,
            onPressed: () {},
            child: const Icon(Icons.camera_alt_rounded, color: Colors.white),
          ),
        ],
      );
    } else if (indexAt == 3) {
      return FloatingActionButton(
        backgroundColor: buttonColor,
        onPressed: () {
          CGSelectContactScreen(isCallScreen: true).launch(context);
        },
        child: const Icon(
          Icons.add_call,
          color: Colors.white,
        ),
      );
    }
  }
}

class SearchContact extends SearchDelegate<ChatModel?> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return CGChatScreen();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return CGChatScreen();
  }
}
