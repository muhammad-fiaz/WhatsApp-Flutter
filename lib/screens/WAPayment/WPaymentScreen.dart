import 'package:whatsapp/screens/WAPayment/WPaymentBankDetails.dart';
import 'package:whatsapp/screens/WAPayment/WPaymentHelpScreen.dart';
import 'package:whatsapp/screens/WAPayment/WPaymentListBankScreen.dart';
import 'package:whatsapp/screens/WqrScanScreen.dart';
import 'package:whatsapp/utils/WColors.dart';
import 'package:whatsapp/utils/WDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../components/model/WChatModel.dart';

class CGPaymentScreen extends StatefulWidget {
  @override
  _CGPaymentScreenState createState() => _CGPaymentScreenState();
}

class _CGPaymentScreenState extends State<CGPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              finish(context);
            },
          ),
          backgroundColor: secondaryColor,
          title: const Text("Payment", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: SingleChildScrollView(
          child: Column(children: [_buildHoldernamepart(), _buildPaymentHistory(), _buildpaymentMethod(), _buildHelp()]),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              PaymentBank? result = await CGPaymentListBankScreen().launch(context);
              if (result != null) {
                payBankData.add(result);
              }
              setState(() {});
            },
            label: const Text("NEW PAYMENT", style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.green),
      ),
    );
  }

  Widget _buildHoldernamepart() {
    return Container(
        padding: const EdgeInsets.only(top: 22, bottom: 22, left: 14, right: 14),
        color: Colors.white,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            const CircleAvatar(backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/86.jpg"), radius: 24),
            12.width,
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "John Smith",
                style: boldTextStyle(size: 18),
              ),
              const Text("123456789.wa.548@sbi")
            ])
          ]),
          IconButton(
            icon: const Icon(Icons.qr_code, color: secondaryColor),
            onPressed: () {
              CGqrScanScreen().launch(context);
            },
          )
        ]));
  }

  Widget _buildPaymentHistory() {
    return Container(
      padding: const EdgeInsets.all(14),
      width: context.width(),
      color: Colors.white,
      margin: const EdgeInsets.only(top: 8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Payment history", style: boldTextStyle(color: secondaryColor)),
        18.height,
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            const CircleAvatar(backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/91.jpg"), radius: 24),
            12.width,
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "John Deo",
                style: boldTextStyle(size: 18),
              ),
              const Text("Payment to you")
            ])
          ]),
          const Column(
            children: [Text("Rs 1,200/-"), Text("completed", style: TextStyle(color: Colors.green))],
          ),
        ])
      ]),
    );
  }

  Widget _buildpaymentMethod() {
    return Container(
      padding: const EdgeInsets.all(14),
      width: context.width(),
      color: Colors.white,
      margin: const EdgeInsets.only(top: 8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text("Payment Method", style: boldTextStyle(color: secondaryColor)),
        Container(
          padding: const EdgeInsets.only(top: 8),
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: payBankData.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    PaymentBank? result = await CGPaymentBankDetails(detail: payBankData[index]).launch(context);
                    payBankData.remove(result);
                    setState(() {});
                  },
                  child: Row(
                    children: [
                      CircleAvatar(backgroundImage: NetworkImage("${payBankData[index].bankImage}"), radius: 24),
                      12.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${payBankData[index].bankName!}..1234 via UPI",
                            style: boldTextStyle(size: 16),
                          ),
                          const Text("primary payment method")
                        ],
                      ),
                    ],
                  ).paddingOnly(top: 8, bottom: 8),
                );
              }),
        ),
        const Divider(thickness: 1),
        InkWell(
          onTap: () async {
            PaymentBank? result = await CGPaymentListBankScreen().launch(context);
            if (result != null) {
              payBankData.add(result);
            }
            setState(() {});
          },
          child: Row(
            children: [const Icon(Icons.add_circle_outline, color: secondaryColor, size: 28), 32.width, const Text("Add payment method", style: TextStyle(fontSize: 18))],
          ),
        )
      ]),
    );
  }

  _buildHelp() {
    return InkWell(
      onTap: () {
        CGPaymentHelpScreen().launch(context);
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        width: context.width(),
        color: Colors.white,
        margin: const EdgeInsets.only(top: 8.0, bottom: 72),
        child: Row(
          children: [
            const Icon(
              Icons.help_outline,
              color: secondaryColor,
              size: 28,
            ),
            32.width,
            const Text("Help", style: TextStyle(fontSize: 18))
          ],
        ),
      ),
    );
  }
}
