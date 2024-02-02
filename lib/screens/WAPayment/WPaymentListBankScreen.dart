import 'package:whatsapp/utils/WColors.dart';
import 'package:whatsapp/utils/WDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGPaymentListBankScreen extends StatefulWidget {
  @override
  _CGPaymentListBankScreenState createState() => _CGPaymentListBankScreenState();
}

class _CGPaymentListBankScreenState extends State<CGPaymentListBankScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: secondaryColor,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                finish(context);
              }),
          title: const Text("Select your bank", style: TextStyle(fontWeight: FontWeight.bold)),
          actions: [IconButton(icon: const Icon(Icons.search, color: Colors.white), onPressed: () {})],
        ),
        body: ListView.builder(
            itemCount: banklist.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {});
                  finish(context, banklist[index]);
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 16, left: 16),
                  child: Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        child: Image.network("${banklist[index].bankImage}"),
                      ).cornerRadiusWithClipRRect(60),
                      32.width,
                      Text("${banklist[index].bankName}", style: boldTextStyle(size: 16))
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
