import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../components/model/WUserModel.dart';

class CGShowStoryScreen extends StatefulWidget {
  final User? storyData;

  CGShowStoryScreen({this.storyData});

  @override
  _CGShowStoryScreenState createState() => _CGShowStoryScreenState();
}

class _CGShowStoryScreenState extends State<CGShowStoryScreen> {
  double percent = 0.0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: _storyImagePreview()),
    );
  }

  _storyImagePreview() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset("images/cloneApp/whatsApp/sample_wallpaper.jpg", fit: BoxFit.cover),
        Positioned(top: 20, right: 0, child: PopupMenuButton<int>(icon: const Icon(Icons.more_vert, color: Colors.white), itemBuilder: (context) => [const PopupMenuItem(value: 1, child: Text("Mute"))])),
        Positioned(
            top: 5,
            child: Container(
                padding: const EdgeInsets.only(left: 4, right: 4),
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: LinearProgressIndicator(
                    minHeight: 3,
                    backgroundColor: Colors.black38,
                    valueColor: const AlwaysStoppedAnimation(Colors.white),
                    value: percent,
                  ),
                ))),
        Positioned(
            top: 15,
            child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            _timer.cancel();
                            finish(context, true);
                          }),
                      Image.network(widget.storyData!.avatarUrl!, width: 50).cornerRadiusWithClipRRect(30),
                      8.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.storyData!.name!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white)),
                          const Text("Today, 03:45 pm", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
                        ],
                      )
                    ]),
                  ],
                ))),
        Positioned(bottom: 18, right: 0, left: 0, child: Column(children: [const Icon(Icons.keyboard_arrow_up, color: Colors.white), Text("Replay", style: boldTextStyle(size: 14, color: Colors.white))])),
      ],
    );
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 5), (timer) {
      setState(() {
        percent += 0.003;
        if (percent > 1) {
          _timer.cancel();
          finish(context, true);
        }
      });
    });
  }
}
