import 'package:flutter/material.dart';

class ActivityTrailing extends StatelessWidget {
  final Map<String, dynamic> activity;
  const ActivityTrailing({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    if (activity["type"] == "follow") {
      return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: Colors.grey[300],
          foregroundColor: Colors.black,
        ),
        child: Text("Following"),
      );
    } else if (activity["type"] == "like") {
      return Icon(Icons.favorite, color: Colors.pink);
    } else if (activity["type"] == "mention") {
      return Icon(Icons.alternate_email, color: Colors.blue);
    } else if (activity["type"] == "reply") {
      return Icon(Icons.reply, color: Colors.blue);
    }
    return SizedBox.shrink();
  }
}
