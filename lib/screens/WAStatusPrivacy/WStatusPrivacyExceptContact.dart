import 'package:whatsapp/utils/WColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../components/model/WChatModel.dart';

class CGStatusPrivacyExceptContact extends StatefulWidget {
  bool _selectAll = false;
  int numContact = 0;

  @override
  _CGStatusPrivacyExceptContactState createState() => _CGStatusPrivacyExceptContactState();
}

class _CGStatusPrivacyExceptContactState extends State<CGStatusPrivacyExceptContact> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: secondaryColor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [const Text("Hide status from...", style: TextStyle(fontWeight: FontWeight.bold)), Text("${widget.numContact} contact excluded", style: boldTextStyle(size: 14))],
          ),
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
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
              itemBuilder: (context, index) => InkWell(
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
          onPressed: () {
            finish(context);
            toast("setting updated", gravity: ToastGravity.CENTER);
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.check, color: Colors.white),
        ),
      ),
    );
  }

  _hideCheckBox() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(width: 1, color: Colors.grey[400]!)),
    );
  }

  _showcheckBox() {
    return Container(width: 25, height: 25, decoration: BoxDecoration(color: Colors.red[500], borderRadius: BorderRadius.circular(30), border: Border.all(width: 1, color: Colors.grey[400]!)), child: const Icon(Icons.check, size: 16, color: Colors.white));
  }
}
