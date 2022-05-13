import 'package:flutter/material.dart';
import 'package:zoom_clone/views/widgets/reusable_icon.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({Key? key}) : super(key: key);

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
              onPressed: () {
                print("New Meeting");
              },
            ),
            ReusableIcon(
              icon: Icons.add_box,
              text: "Join Meeting",
              onPressed: () {
                print("Join Meeting");
              },
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
