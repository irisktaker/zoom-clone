import 'package:flutter/material.dart';
import 'package:zoom_clone/controllers/auth_controller.dart';
import 'package:zoom_clone/controllers/jitsi_controller.dart';
import 'package:zoom_clone/utils/colors.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthController _authController = AuthController();
  final JitsiController _jitsiController = JitsiController();

  late TextEditingController meetingIDController;
  late TextEditingController usernameController;

  @override
  void initState() {
    meetingIDController = TextEditingController();
    usernameController =
        TextEditingController(text: _authController.user.displayName);
    super.initState();
  }

  _joinMeeting() {
    _jitsiController.createMeeting(
      roomName: meetingIDController.text,
      isAudioMuted: true,
      isVideoMuted: true,
      username: usernameController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Join a meeting",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: meetingIDController,
            keyboardType: TextInputType.number,
            maxLines: 1,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              fillColor: secondaryBackgroundColor,
              filled: true,
              border: InputBorder.none,
              hintText: 'Room ID',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: usernameController,
            keyboardType: TextInputType.text,
            maxLines: 1,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              fillColor: secondaryBackgroundColor,
              filled: true,
              border: InputBorder.none,
              hintText: 'Username',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: _joinMeeting,
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                "Join",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
