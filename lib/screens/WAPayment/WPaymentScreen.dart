// Importing necessary packages and modules
import 'package:whatsapp/screens/WAPayment/WPaymentBankDetails.dart';
import 'package:whatsapp/screens/WAPayment/WPaymentHelpScreen.dart';
import 'package:whatsapp/screens/WAPayment/WPaymentListBankScreen.dart';
import 'package:whatsapp/screens/WqrScanScreen.dart';
import 'package:whatsapp/utils/WColors.dart';
import 'package:whatsapp/utils/WDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../components/model/WChatModel.dart';

// This widget is the root of the application.
class CGPaymentScreen extends StatefulWidget {
  // Creates the mutable state for this widget at a given location in the tree.
  @override
  _CGPaymentScreenState createState() => _CGPaymentScreenState();
}

// This class holds the state for the CGPaymentScreen widget.
class _CGPaymentScreenState extends State<CGPaymentScreen> {
  // Describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Setting the background color of the scaffold
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          // Setting the leading widget of the app bar
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            // Defining the action when the leading widget is pressed
            onPressed: () {
              finish(context);
            },
          ),
          // Setting the background color of the app bar
          backgroundColor: secondaryColor,
          // Setting the title of the app bar
          title: const Text("Payment", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: SingleChildScrollView(
          // Building the body of the scaffold
          child: Column(children: [_buildHoldernamepart(), _buildPaymentHistory(), _buildpaymentMethod(), _buildHelp()]),
        ),
        floatingActionButton: FloatingActionButton.extended(
          // Defining the action when the button is pressed
            onPressed: () async {
              PaymentBank? result = await CGPaymentListBankScreen().launch(context);
              if (result != null) {
                payBankData.add(result);
              }
              setState(() {});
            },
            // Setting the label of the button
            label: const Text("NEW PAYMENT", style: TextStyle(color: Colors.white)),
            // Setting the background color of the button
            backgroundColor: Colors.green),
      ),
    );
  }

  // This method builds the holder name part widget
  Widget _buildHoldernamepart() {
    return Container(
      // Setting the padding of the container
        padding: const EdgeInsets.only(top: 22, bottom: 22, left: 14, right: 14),
        // Setting the background color of the container
        color: Colors.white,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            // Setting the avatar of the holder
            const CircleAvatar(backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/86.jpg"), radius: 24),
            12.width,
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Setting the name of the holder
              Text(
                "John Smith",
                style: boldTextStyle(size: 18),
              ),
              // Setting the UPI of the holder
              const Text("123456789.wa.548@sbi")
            ])
          ]),
          // Setting the QR code button
          IconButton(
            icon: const Icon(Icons.qr_code, color: secondaryColor),
            onPressed: () {
              CGqrScanScreen().launch(context);
            },
          )
        ]));
  }

  // This method builds the payment history widget
  Widget _buildPaymentHistory() {
    return Container(
      // Setting the padding of the container
      padding: const EdgeInsets.all(14),
      // Setting the width of the container
      width: context.width(),
      // Setting the background color of the container
      color: Colors.white,
      // Setting the margin of the container
      margin: const EdgeInsets.only(top: 8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Setting the title of the payment history
        Text("Payment history", style: boldTextStyle(color: secondaryColor)),
        18.height,
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            // Setting the avatar of the payer
            const CircleAvatar(backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/91.jpg"), radius: 24),
            12.width,
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Setting the name of the payer
              Text(
                "John Deo",
                style: boldTextStyle(size: 18),
              ),
              // Setting the payment status
              const Text("Payment to you")
            ])
          ]),
          // Setting the payment details
          const Column(
            children: [Text("Rs 1,200/-"), Text("completed", style: TextStyle(color: Colors.green))],
          ),
        ])
      ]),
    );
  }

  // This method builds the payment method widget
  Widget _buildpaymentMethod() {
    return Container(
      // Setting the padding of the container
      padding: const EdgeInsets.all(14),
      // Setting the width of the container
      width: context.width(),
      // Setting the background color of the container
      color: Colors.white,
      // Setting the margin of the container
      margin: const EdgeInsets.only(top: 8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        // Setting the title of the payment method
        Text("Payment Method", style: boldTextStyle(color: secondaryColor)),
        Container(
          padding: const EdgeInsets.only(top: 8),
          child: ListView.builder(
            // Setting the scroll physics of the list view
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              // Setting the item count of the list view
              itemCount: payBankData.length,
              // Defining the builder for the list view
              itemBuilder: (context, index) {
                return InkWell(
                  // Defining the action when the item is tapped
                  onTap: () async {
                    PaymentBank? result = await CGPaymentBankDetails(detail: payBankData[index]).launch(context);
                    payBankData.remove(result);
                    setState(() {});
                  },
                  child: Row(
                    // Defining the children of the row
                    children: [
                      // Setting the avatar of the bank
                      CircleAvatar(backgroundImage: NetworkImage("${payBankData[index].bankImage}"), radius: 24),
                      12.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Setting the name of the bank
                          Text(
                            "${payBankData[index].bankName!}..1234 via UPI",
                            style: boldTextStyle(size: 16),
                          ),
                          // Setting the payment method status
                          const Text("primary payment method")
                        ],
                      ),
                    ],
                  ).paddingOnly(top: 8, bottom: 8),
                );
              }),
        ),
        // Setting the divider
        const Divider(thickness: 1),
        // Setting the add payment method button
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

  // This method builds the help widget
  _buildHelp() {
    return InkWell(
      // Defining the action when the widget is tapped
      onTap: () {
        CGPaymentHelpScreen().launch(context);
      },
      child: Container(
        // Setting the padding of the container
        padding: const EdgeInsets.all(14),
        // Setting the width of the container
        width: context.width(),
        // Setting the background color of the container
        color: Colors.white,
        // Setting the margin of the container
        margin: const EdgeInsets.only(top: 8.0, bottom: 72),
        child: Row(
          // Defining the children of the row
          children: [
            // Setting the help icon
            const Icon(
              Icons.help_outline,
              color: secondaryColor,
              size: 28,
            ),
            32.width,
            // Setting the help text
            const Text("Help", style: TextStyle(fontSize: 18))
          ],
        ),
      ),
    );
  }
}