import 'package:flutter/material.dart';
import 'package:nomad_challenge_04_03/features/like/data/like_data.dart';
import 'package:nomad_challenge_04_03/features/like/widgets/activity_item.dart';

class ActivityList extends StatelessWidget {
  final String filterType;

  ActivityList({super.key, required this.filterType});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredList = filterType == "all"
        ? likeActivities
        : likeActivities
            .where((activity) => activity["type"] == filterType)
            .toList();

    if (filteredList.isEmpty) {
      return Center(child: Text("No $filterType activity"));
    }
    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        return ActivityItem(activity: filteredList[index]);
      },
    );
  }
}
