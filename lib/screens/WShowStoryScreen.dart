// Importing necessary packages and modules
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../components/model/WUserModel.dart';

// This widget is the root of the application.
class CGShowStoryScreen extends StatefulWidget {
  // User data for the story
  final User? storyData;

  // Constructor for the CGShowStoryScreen widget
  CGShowStoryScreen({this.storyData});

  // Creates the mutable state for this widget at a given location in the tree.
  @override
  _CGShowStoryScreenState createState() => _CGShowStoryScreenState();
}

// This class holds the state for the CGShowStoryScreen widget.
class _CGShowStoryScreenState extends State<CGShowStoryScreen> {
  // Variable to hold the progress of the story
  double percent = 0.0;
  // Timer to control the progress of the story
  late Timer _timer;

  // Initializes the state of the widget after having been inserted into the tree.
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  // Cleans up the controller when the widget is disposed.
  @override
  void dispose() {
    super.dispose();
  }

  // Describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: _storyImagePreview()),
    );
  }

  // This method is used to display the story image preview.
  _storyImagePreview() {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Displaying the story image
        Image.asset("images/cloneApp/whatsApp/sample_wallpaper.jpg", fit: BoxFit.cover),
        // Displaying the menu button at the top right corner
        Positioned(top: 20, right: 0, child: PopupMenuButton<int>(icon: const Icon(Icons.more_vert, color: Colors.white), itemBuilder: (context) => [const PopupMenuItem(value: 1, child: Text("Mute"))])),
        // Displaying the progress bar at the top of the screen
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
        // Displaying the user's avatar, name and story time
        Positioned(
            top: 15,
            child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      // Displaying the back button
                      IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            // Defining the action when the back button is pressed
                            _timer.cancel();
                            finish(context, true);
                          }),
                      // Displaying the user's avatar
                      Image.network(widget.storyData!.avatarUrl!, width: 50).cornerRadiusWithClipRRect(30),
                      8.width,
                      // Displaying the user's name and story time
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
        // Displaying the replay icon and text at the bottom of the screen
        Positioned(bottom: 18, right: 0, left: 0, child: Column(children: [const Icon(Icons.keyboard_arrow_up, color: Colors.white), Text("Replay", style: boldTextStyle(size: 14, color: Colors.white))])),
      ],
    );
  }

  // This method is used to start the timer for the story progress.
  void startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 5), (timer) {
      setState(() {
        // Increasing the progress of the story
        percent += 0.003;
        // If the progress reaches 100%, cancel the timer and finish the story
        if (percent > 1) {
          _timer.cancel();
          finish(context, true);
        }
      });
    });
  }
}