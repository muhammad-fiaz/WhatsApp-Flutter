import 'package:whatsapp/utils/WConstant.dart';
import 'package:whatsapp/utils/WWidgets.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGTwoStepsVerificationPwdScreen extends StatefulWidget {
  PageController? _pageController;
  int index = 0;

  @override
  _CGTwoStepsVerificationPwdScreenState createState() => _CGTwoStepsVerificationPwdScreenState();
}

class _CGTwoStepsVerificationPwdScreenState extends State<CGTwoStepsVerificationPwdScreen> {
  @override
  void initState() {
    widget._pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBar(context, title: "Two-step verification") as PreferredSizeWidget?,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: widget._pageController,
          children: [
            _pageViewPWDDataItem(titleText: "Enter 6-digit PIN which you\'ll be asked for when you register your phone number with $CGAppName", hintText: " * * * * * * ", btnText: "NEXT", index: 1),
            _pageViewPWDDataItem(titleText: "Confirm your PIN.", hintText: " * * * * * * ", btnText: "NEXT", index: 2),
            _pageViewEmailData(titleText: "Add an email address to your account which will be used to reset your PIN if you forget it and safeguard your account.", hintText: "Enter Email", btnText: "NEXT", index: 3),
            _pageViewEmailData(titleText: "Confirm Email", hintText: "Enter Email", btnText: "Done", index: 4)
          ],
        ),
      ),
    );
  }

  Widget _pageViewPWDDataItem({required String titleText, String? hintText, required String btnText, int? index}) {
    return Container(
      padding: const EdgeInsets.only(top: CGAppPadding, left: CGAppPadding, right: CGAppPadding, bottom: 10.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            Text(
              titleText,
              style: const TextStyle(fontSize: CGAppTextSize),
            ),
            32.height,
            SizedBox(
              width: 150,
              child: TextField(
                maxLines: 1,
                keyboardType: TextInputType.phone,
                style: const TextStyle(fontSize: CGAppTextSize),
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: hintText),
              ),
            )
          ],
        ),
        ElevatedButton(
          onPressed: () {
            widget._pageController!.animateToPage(
              index!,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOutQuad,
            );
            //print(index);
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
          ),
          child: Text(
            btnText,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),

      ]),
    );
  }

  Widget _pageViewEmailData({String? titleText, String? hintText, required String btnText, int? index}) {
    return Container(
      padding: const EdgeInsets.only(top: CGAppPadding, left: CGAppPadding, right: CGAppPadding, bottom: 10.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            Text.rich(TextSpan(children: [TextSpan(text: index == 4 ? null : "Skip", style: const TextStyle(color: Colors.blue, fontSize: CGAppTextSize))], text: titleText)),
            32.height,
            SizedBox(
              width: 350,
              child: TextField(
                maxLines: 1,
                keyboardType: TextInputType.phone,
                style: const TextStyle(fontSize: CGAppTextSize),
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: hintText),
              ),
            )
          ],
        ),
        ElevatedButton(
          onPressed: () {
            if (index == 4) {
              finish(context);
              toast("Successfully Verified");
            } else {
              widget._pageController!.animateToPage(
                index!,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutQuad,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
          ),
          child: Text(
            btnText,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),

      ]),
    );
  }
}
