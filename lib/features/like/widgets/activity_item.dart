import 'package:flutter/material.dart';
import 'package:nomad_challenge_04_03/features/like/widgets/activity_trailing.dart';

class ActivityItem extends StatelessWidget {
  final Map<String, dynamic> activity;

  const ActivityItem({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(activity["profileImage"]),
      ),
      title: Row(
        children: [
          Text(activity["user"], style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 5),
          Text(activity["time"], style: TextStyle(color: Colors.grey)),
        ],
      ),
      subtitle: Text(activity["message"]),
      trailing: ActivityTrailing(activity: activity),
    );
  }
}
