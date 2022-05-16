import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class MeetingOptions extends StatelessWidget {
  const MeetingOptions(
      {Key? key,
      required this.text,
      required this.isMute,
      required this.onChanged})
      : super(key: key);

  final String text;
  final bool isMute;
  final Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Switch.adaptive(value: isMute, onChanged: onChanged)
        ],
      ),
    );
  }
}
