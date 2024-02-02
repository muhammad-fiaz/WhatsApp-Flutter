// Importing necessary packages and modules
import 'package:whatsapp/utils/WColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../components/model/WChatModel.dart';

// This widget is the root of the application.
class CGStatusPrivacyExceptContact extends StatefulWidget {
  // Boolean to check if all contacts are selected
  bool _selectAll = false;
  // Number of contacts excluded from status privacy
  int numContact = 0;

  // Creates the mutable state for this widget at a given location in the tree.
  @override
  _CGStatusPrivacyExceptContactState createState() => _CGStatusPrivacyExceptContactState();
}

// This class holds the state for the CGStatusPrivacyExceptContact widget.
class _CGStatusPrivacyExceptContactState extends State<CGStatusPrivacyExceptContact> {
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
            children: [const Text("Hide status from...", style: TextStyle(fontWeight: FontWeight.bold)), Text("${widget.numContact} contact excluded", style: boldTextStyle(size: 14))],
          ),
          // Setting the actions of the app bar
          actions: [
            IconButton(icon: const Icon(Icons.search), color: Colors.white, onPressed: () {}),
            IconButton(
                icon: const Icon(Icons.playlist_add_check),
                color: Colors.white,
                onPressed: () {
                  setState(() {});
                  widget._selectAll = !widget._selectAll;
                  for (var element in fav) {
                    element.isHide = widget._selectAll;
                  }
                  widget._selectAll ? widget.numContact = fav.length : widget.numContact = 0;
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
                  widget._selectAll = false;
                  fav[index].isHide! ? widget.numContact++ : widget.numContact--;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [Image.network(fav[index].avatarUrl!, width: 42, height: 42).cornerRadiusWithClipRRect(60), 12.width, Text(fav[index].name!, style: const TextStyle(fontSize: 16))],
                    ),
                    fav[index].isHide! ? _showcheckBox() : _hideCheckBox()
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
            toast("setting updated", gravity: ToastGravity.CENTER);
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
  _hideCheckBox() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(width: 1, color: Colors.grey[400]!)),
    );
  }

  // This method returns a widget that represents a visible checkbox
  _showcheckBox() {
    return Container(width: 25, height: 25, decoration: BoxDecoration(color: Colors.red[500], borderRadius: BorderRadius.circular(30), border: Border.all(width: 1, color: Colors.grey[400]!)), child: const Icon(Icons.check, size: 16, color: Colors.white));
  }
}