import 'package:whatsapp/utils/WConstant.dart';
import 'package:whatsapp/utils/WWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGRequestAccountInfo extends StatefulWidget {
  @override
  _CGRequestAccountInfoState createState() => _CGRequestAccountInfoState();
}

class _CGRequestAccountInfoState extends State<CGRequestAccountInfo> {
  bool _isReportDownload = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBar(context, title: "Request account info") as PreferredSizeWidget?,
        body: Column(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(CGAppPadding),
                child: Column(children: [
                  CircleAvatar(
                    backgroundImage: const NetworkImage("https://www.crossroadsfund.org/sites/default/files/document%20icon.png"),
                    radius: 50,
                    backgroundColor: Colors.teal[200],
                  ),
                  18.height,
                  Text.rich(
                    TextSpan(
                        children: [TextSpan(text: " Learn more.", style: boldTextStyle(color: Colors.blue, size: 18, wordSpacing: 2))],
                        text: "Create a report of your $CGAppName account information and setting, which you can access or port to another app. This report dose not include your message.",
                        style: const TextStyle(fontSize: CGAppTextSize)),
                  )
                ])),
            const Divider(thickness: 1),
            _isReportDownload
                ? Column(children: [
                ListTile(
                    onTap: () {
                      setState(() {});
                      _isReportDownload = false;
                    },
                    leading: IconButton(
                      icon: const Icon(Icons.access_time_outlined),
                      onPressed: () {},
                    ),
                    title: const Text("Request sent"),
                    subtitle: const Text("Ready by 28 November 2020")),
                const Divider(thickness: 1),
                Container(
                    padding: const EdgeInsets.all(CGAppPadding),
                    child: Column(children: [
                      const Text("Your report will be ready in about 2 days. You\'ll have a few weeks to download your report after it\'s available", style: TextStyle(fontSize: CGAppTextSize)),
                      18.height,
                      const Text("Your request will be canceled if you make changes to your account such as changing your number or deleting your account.", style: TextStyle(fontSize: CGAppTextSize))
                    ]))
                                  ])
                : Column(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {});
                          _isReportDownload = true;
                        },
                        leading: IconButton(
                          icon: const Icon(Icons.download_sharp),
                          onPressed: () {},
                        ),
                        title: const Text("Download report"),
                        subtitle: const Text("28 November 2020 - 70kb"),
                      ),
                      const Divider(thickness: 1),
                      const Text("Your report is available to download until 28 November 2020", style: TextStyle(fontSize: CGAppTextSize))
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
