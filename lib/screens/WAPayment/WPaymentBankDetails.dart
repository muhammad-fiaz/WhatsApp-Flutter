import 'package:whatsapp/screens/WAPayment/WPaymentHelpScreen.dart';
import 'package:whatsapp/utils/WColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../components/model/WChatModel.dart';

class CGPaymentBankDetails extends StatefulWidget {
  final PaymentBank? detail;

  CGPaymentBankDetails({this.detail});

  @override
  _CGPaymentBankDetailsState createState() => _CGPaymentBankDetailsState();
}

class _CGPaymentBankDetailsState extends State<CGPaymentBankDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
            backgroundColor: secondaryColor,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  finish(context);
                }),
            title: const Text("Bank account details", style: TextStyle(fontWeight: FontWeight.bold)),
            actions: [
              PopupMenuButton(
                  onSelected: (dynamic value) {
                    if (value == 2) {
                      setState(() {});
                      finish(context, widget.detail);
                    }
                  },
                  icon: const Icon(Icons.more_vert, color: Colors.white),
                  itemBuilder: (context) => [const PopupMenuItem(value: 1, child: Text("Switch payment provider")), const PopupMenuItem(value: 2, child: Text("Remove payment method"))])
            ]),
        body: Column(
          children: [_buildBankDetail(), _buildBankActiobDetail(), _buildHelp()],
        ),
      ),
    );
  }

  _buildBankDetail() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      width: context.width(),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget.detail!.bankImage!),
            radius: 24,
          ),
          12.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("${widget.detail!.bankName!}..1234 via UPI", style: boldTextStyle(size: 16)), const Text("123456789.wa.548@abc")],
          )
        ],
      ),
    );
  }

  _buildBankActiobDetail() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      color: Colors.white,
      margin: const EdgeInsets.only(top: 8),
      child: Column(
        children: [
          _actionData(const Icon(Icons.star, color: secondaryColor, size: 28), "Default payment method"),
          16.height,
          _actionData(const Icon(Icons.more, color: secondaryColor, size: 28), "Change UPI PIN"),
          16.height,
          _actionData(const Icon(Icons.refresh, color: secondaryColor, size: 28), "Forgot UPI PIN"),
        ],
      ),
    );
  }

  _actionData(Icon icon, String name) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: [icon, 16.width, Text(name, style: const TextStyle(fontSize: 16))],
      ),
    );
  }

  _buildHelp() {
    return InkWell(
      onTap: () {
        CGPaymentHelpScreen().launch(context);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        width: context.width(),
        color: Colors.white,
        margin: const EdgeInsets.only(top: 8.0, bottom: 72),
        child: Row(
          children: [const Icon(Icons.help_outline, color: secondaryColor, size: 28), 16.width, const Text("Help", style: TextStyle(fontSize: 18))],
        ),
      ),
    );
  }
}
