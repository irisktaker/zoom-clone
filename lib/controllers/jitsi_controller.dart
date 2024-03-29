import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:zoom_clone/controllers/auth_controller.dart';
import 'package:zoom_clone/controllers/firestore_controller.dart';

class JitsiController {
  final FirestoreController _firestoreController = FirestoreController();
  final AuthController _authController = AuthController();

  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p

      // check if the user choose another display name or add the default name of the user
      String name;
      if (username.isEmpty) {
        name = _authController.user.displayName!;
      } else {
        name = username;
      }

      var options = JitsiMeetingOptions(
        room: roomName,
      )
        ..userDisplayName = name //_authController.user.displayName
        ..userEmail = _authController.user.email
        ..userAvatarURL = _authController.user.photoURL
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

      _firestoreController.addMeetingToFirestore(roomName);

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      // debugPrint("error: $error");
      print("error: $error");
    }
  }
}
