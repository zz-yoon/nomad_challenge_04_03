import 'package:flutter/material.dart';
import 'package:nomad_challenge_04_03/features/like/widgets/activity_list.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Activity"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              tabs: [
                Tab(text: "All"),
                Tab(text: "Replies"),
                Tab(text: "Mentions"),
                Tab(text: "Verified"),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ActivityList(filterType: "all"),
                  ActivityList(filterType: "reply"),
                  ActivityList(filterType: "mention"),
                  Center(child: Text("No verified activity")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
