import 'package:whatsapp/utils/WConstant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGqrCode extends StatefulWidget {
  @override
  _CGqrCodeState createState() => _CGqrCodeState();
}

class _CGqrCodeState extends State<CGqrCode> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.05, vertical: MediaQuery.of(context).size.width / 2 - 50),
          decoration: BoxDecoration(color: Colors.grey[300]),
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: Colors.white),
                      height: 300,
                      margin: EdgeInsets.symmetric(vertical: 30),
                      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
                      child: Column(
                        children: [
                          Text(
                            "john smith",
                            style: boldTextStyle(),
                          ),
                          Text("$CGAppName contact"),
                          Image.network(
                            "https://miro.medium.com/max/307/1*Uzg6QnHA2gAJWOjO72Xwng.png",
                            width: 200,
                            height: 200,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 100,
                    child: CircleAvatar(radius: 28, backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/96.jpg")),
                  ),
                ],
              ),
              Text("Your QR code is private. If you share it with someone, they can scan it with their $CGAppName camera to add you as a contact."),
            ],
          ),
        ),
      ),
    );
  }
}
