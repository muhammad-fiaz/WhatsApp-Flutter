import 'package:whatsapp/screens/WDashboardScreen.dart';
import 'package:whatsapp/utils/WConstant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGSplashScreen extends StatefulWidget {
  static String tag = '/CGSplashScreen';

  @override
  CGSplashScreenState createState() => CGSplashScreenState();
}

class CGSplashScreenState extends State<CGSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    checkFirstSeen();
  }

  Future checkFirstSeen() async {
    await Future.delayed(const Duration(seconds: 2));
    finish(context);
    CGDashoardScreen().launch(context);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: getColorFromHex('#FFFFFF'),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset("images/whatsApp/app_ic_wp.png", height: 150, width: 150).center(),
            Positioned(
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('From', style: secondaryTextStyle()),
                  Text(CGAppName, style: boldTextStyle(size: 25, color: Colors.black)),
                ],
              ).paddingBottom(16),
            )
          ],
        ),
      ),
    );
  }
}
