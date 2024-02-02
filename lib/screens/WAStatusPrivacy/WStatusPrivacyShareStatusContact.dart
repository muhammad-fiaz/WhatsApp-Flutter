// Importing necessary packages and modules
import 'package:whatsapp/utils/WColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../components/model/WChatModel.dart';

// This widget is the root of the application.
class CGStatusPrivacyShareStatusContact extends StatefulWidget {
  // Boolean to check if all contacts are selected
  bool _shareToselectAll = false;
  // Number of contacts selected to share status with
  int numShareContact = 0;

  // Creates the mutable state for this widget at a given location in the tree.
  @override
  _CGStatusPrivacyShareStatusContactState createState() => _CGStatusPrivacyShareStatusContactState();
}

// This class holds the state for the CGStatusPrivacyShareStatusContact widget.
class _CGStatusPrivacyShareStatusContactState extends State<CGStatusPrivacyShareStatusContact> {
  // Describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // Setting the leading widget of the app bar
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            // Defining the action when the leading widget is pressed
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          // Setting the background color of the app bar
          backgroundColor: secondaryColor,
          // Setting the title of the app bar
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [const Text("Share status with...", style: TextStyle(fontWeight: FontWeight.bold)), Text("${widget.numShareContact} contacts selected", style: boldTextStyle(size: 14))],
          ),
          // Setting the actions of the app bar
          actions: [
            IconButton(icon: const Icon(Icons.search), color: Colors.white, onPressed: () {}),
            IconButton(
                icon: const Icon(Icons.playlist_add_check),
                color: Colors.white,
                onPressed: () {
                  setState(() {});
                  widget._shareToselectAll = !widget._shareToselectAll;
                  for (var element in fav) {
                    element.isHide = widget._shareToselectAll;
                  }
                  widget._shareToselectAll ? widget.numShareContact = fav.length : widget.numShareContact = 0;
                })
          ],
        ),
        body: Container(
          // Setting the padding of the container
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
              itemBuilder: (context, index) => InkWell(
                // Defining the action when the item is tapped
                onTap: () {
                  setState(() {});
                  fav[index].isHide = !fav[index].isHide!;
                  widget._shareToselectAll = false;
                  fav[index].isHide! ? widget.numShareContact++ : widget.numShareContact--;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [Image.network(fav[index].avatarUrl!, width: 42, height: 42).cornerRadiusWithClipRRect(60), 12.width, Text(fav[index].name!, style: const TextStyle(fontSize: 16))],
                    ),
                    fav[index].isHide! ? _showshareCheckBox() : _hideshareCheckBox()
                  ],
                ),
              ),
              separatorBuilder: (_, i) => const Divider(thickness: 1),
              itemCount: fav.length),
        ),
        floatingActionButton: FloatingActionButton(
          // Defining the action when the button is pressed
          onPressed: () {
            finish(context);
            toast("status updated", gravity: ToastGravity.CENTER);
          },
          // Setting the background color of the button
          backgroundColor: Colors.green,
          // Setting the icon of the button
          child: const Icon(Icons.check, color: Colors.white),
        ),
      ),
    );
  }

  // This method returns a widget that represents a hidden checkbox
  _hideshareCheckBox() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(width: 1, color: Colors.grey[400]!)),
    );
  }

  // This method returns a widget that represents a visible checkbox
  _showshareCheckBox() {
    return Container(width: 25, height: 25, decoration: BoxDecoration(color: Colors.teal, borderRadius: BorderRadius.circular(30), border: Border.all(width: 1, color: Colors.grey[400]!)), child: const Icon(Icons.check, size: 16, color: Colors.white));
  }
}