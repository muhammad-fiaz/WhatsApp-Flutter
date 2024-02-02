import 'package:whatsapp/utils/WConstant.dart';
import 'package:whatsapp/utils/WWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGChangeNumber2 extends StatefulWidget {
  @override
  _CGChangeNumber2State createState() => _CGChangeNumber2State();
}

class _CGChangeNumber2State extends State<CGChangeNumber2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBar(context, title: "Change number") as PreferredSizeWidget?,
        body: Container(
          decoration: const BoxDecoration(),
          padding: const EdgeInsets.only(top: CGAppPadding, left: CGAppPadding, right: CGAppPadding, bottom: 10.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(children: [
                  const Text("Enter your old phone number with country code.",
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  Container(
                    padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          child: const TextField(readOnly: true, decoration: InputDecoration(hintText: "+91")),
                        ),
                        10.width,
                        const Flexible(
                          child: TextField(decoration: InputDecoration(hintText: "old phone number")),
                        ),
                      ],
                    ),
                  ),
                  const Text("Enter your new phone number with country code.",
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  Container(
                    padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          child: const TextField(readOnly: true, decoration: InputDecoration(hintText: "+91")),
                        ),
                        10.width,
                        const Flexible(
                          child: TextField(decoration: InputDecoration(hintText: "New phone number")),
                        ),
                      ],
                    ),
                  ),
                ]),
                ElevatedButton(
                  onPressed: () {
                    finish(context);
                    toast("Change Number Successfully");
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: const Text(
                    "NEXT",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
