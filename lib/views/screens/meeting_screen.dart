import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_clone/views/widgets/reusable_icon.dart';
import 'package:zoom_clone/controllers/jitsi_controller.dart';
import 'package:zoom_clone/views/screens/video_call_screen.dart';

class MeetingScreen extends StatefulWidget {
  const MeetingScreen({Key? key}) : super(key: key);

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  final JitsiController _jitsiController = JitsiController();

  createNewMeeting() {
    Random random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();

    _jitsiController.createMeeting(
      roomName: roomName,
      isAudioMuted: true,
      isVideoMuted: true,
    );
  }

  joinMeeting() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const VideoCallScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ReusableIcon(
              icon: Icons.videocam,
              text: "New Meeting",
              onPressed: createNewMeeting,
            ),
            ReusableIcon(
              icon: Icons.add_box,
              text: "Join Meeting",
              onPressed: joinMeeting,
            ),
            ReusableIcon(
              icon: Icons.calendar_today,
              text: "Schedule",
              onPressed: () {
                print("Schedule");
              },
            ),
            ReusableIcon(
              icon: Icons.arrow_upward_outlined,
              text: "Share Screen",
              onPressed: () {
                print("Share Screen");
              },
            ),
          ],
        ),
        const Expanded(
            child: Center(
          child: Text(
            "Create/Join a meeting with just a click",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        )),
      ],
    );
  }
}
