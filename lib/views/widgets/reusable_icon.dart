import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class ReusableIcon extends StatelessWidget {
  const ReusableIcon(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onPressed})
      : super(key: key);

  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.6),
                  // offset: Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
