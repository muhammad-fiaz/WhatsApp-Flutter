// Importing necessary packages and modules
import 'package:whatsapp/utils/WColors.dart';
import 'package:whatsapp/utils/WDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// Importing the model for chat data
import '../components/model/WChatModel.dart';

// This widget is the root of the application.
class CGCallScreen extends StatefulWidget {
  // Constructor for this widget
  const CGCallScreen({
    Key? key,
  }) : super(key: key);

  // Creates the mutable state for this widget at a given location in the tree.
  @override
  _CGCallScreenState createState() => _CGCallScreenState();
}

// This class holds the state for the CGCallScreen widget.
class _CGCallScreenState extends State<CGCallScreen> {
  // Describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // Setting the number of items in the list view
      itemCount: 30,
      // Setting the padding of the list view
      padding: const EdgeInsets.only(top: 8, bottom: 80),
      // Defining the builder for the items in the list view
      itemBuilder: (BuildContext context, int index) {
        // Getting the chat data for the current item
        ChatModel data = chats[index % chats.length];

        // Returning a container that represents the current item
        return Container(
          // Setting the padding of the container
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
          child: Row(
            children: [
              // Displaying the avatar of the sender
              Image.network(data.sender!.avatarUrl.validate(), width: 50).cornerRadiusWithClipRRect(30),
              15.width,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Displaying the name of the sender
                  Text(data.sender!.name.validate(), style: boldTextStyle()),
                  5.height,
                  Row(
                    children: [
                      // Displaying the call status icon
                      const Icon(Icons.call_made, color: Colors.green, size: 16).visible(
                        data.callConnect!,
                        defaultWidget: const Icon(Icons.call_received, color: Colors.red, size: 16),
                      ),
                      5.width,
                      // Displaying the date and time of the call
                      Text('November 2 ${data.time.validate()}'),
                    ],
                  ),
                ],
              ).expand(),
              // Displaying the video call or voice call icon
              IconButton(icon: const Icon(Icons.videocam_rounded, color: secondaryColor), onPressed: () {}).visible(data.callRecived!, defaultWidget: IconButton(icon: const Icon(Icons.call, color: secondaryColor), onPressed: () {})),
            ],
          ),
        );
      },
      // Defining the builder for the separators in the list view
      separatorBuilder: (_, i) => const Divider(height: 20),
    );
  }
}