import 'package:whatsapp/utils/WConstant.dart';
import 'package:whatsapp/utils/WWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGPaymentHelpScreen extends StatefulWidget {
  @override
  _CGPaymentHelpScreenState createState() => _CGPaymentHelpScreenState();
}

class _CGPaymentHelpScreenState extends State<CGPaymentHelpScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  bool enable = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBar(context, title: "Contact us") as PreferredSizeWidget?,
        body: Container(
          padding: const EdgeInsets.all(CGAppPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                color: Colors.grey[300],
                child: TextField(
                  controller: _textEditingController,
                  onChanged: (data) {
                    _textEditingController.text.isEmpty ? enable = false : enable = true;
                    setState(() {});
                  },
                  maxLines: 4,
                  decoration: const InputDecoration(hintText: "Describe your problem"),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text("Have you read our FAQ yet?", style: TextStyle(color: Colors.blue, fontSize: 18)),
                ElevatedButton(
                  onPressed: enable
                      ? () {
                    finish(context);
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: const Text(
                    "DONE",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

              ])
            ],
          ),
        ),
      ),
    );
  }
}
