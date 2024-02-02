import 'package:whatsapp/utils/WColors.dart';
import 'package:whatsapp/utils/WConstant.dart';
import 'package:whatsapp/utils/WWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';

class CGDeleteMyAccount extends StatefulWidget {
  @override
  _CGDeleteMyAccountState createState() => _CGDeleteMyAccountState();
}

class _CGDeleteMyAccountState extends State<CGDeleteMyAccount> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBar(context, title: "Delete My Account") as PreferredSizeWidget?,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 36),
              child: Row(
                children: [
                  Icon(FontAwesome.warning, color: Colors.red[900]),
                  22.width,
                  Text("Delete your account will:", style: boldTextStyle(color: Colors.red[900])),
                ],
              ),
            ),
            _buildText(text: "-Delete your account from $CGAppName"),
            _buildText(text: "-Erase your message history"),
            _buildText(text: "-Delete you from all of your $CGAppName groups"),
            _buildText(text: "-Delete your Google Drive backup"),
            const Divider(
              thickness: 1,
              indent: 64,
            ),
            Container(
              padding: const EdgeInsets.only(left: 24, right: 22, top: 18),
              child: Row(
                children: [
                  const Icon(MaterialCommunityIcons.cellphone, color: secondaryColor),
                  20.width,
                  Text(
                    "Change number instead?",
                    style: boldTextStyle(),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 70.0, top: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  // Your onPressed logic
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                child: const Text(
                  "CHANGE NUMBER",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            18.height,
            const Divider(thickness: 1),
            _deleteNumber(),
            Container(
              margin: const EdgeInsets.only(left: 70.0, top: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  toast("Account deleted");
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[900],
                ),
                child: const Text(
                  "DELETE ACCOUNT",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _deleteNumber() {
    return Container(
      padding: const EdgeInsets.only(top: 10.0, left: 70.0),
      child: const Column(children: <Widget>[
        Text(
          "To delete your account, confirm your country code and enter your phone number.",
          style: TextStyle(fontSize: CGAppTextSize),
        ),
        ListTile(
          title: Text("Country"),
          subtitle: Text("india"),
          contentPadding: EdgeInsets.zero,
        ),
        ListTile(
          title: Text("Phone"),
          subtitle: Text("+91 123456 6789"),
          contentPadding: EdgeInsets.zero,
        ),
      ]),
    );
  }

  Widget _buildText({required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 4.0),
      child: Text(
        text,
        style: TextStyle(color: Colors.grey[700]),
      ),
    );
  }
}
