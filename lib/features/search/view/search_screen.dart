import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nomad_challenge_04_03/features/search/data/search_data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> filteredUsers = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    filteredUsers = users;
    _searchController.addListener(() {
      filterUsers();
    });
  }

  //filtering users
  void filterUsers() {
    String query = _searchController.text.toLowerCase();
    filteredUsers = users.where((user) {
      return user["name"].toLowerCase().contains(query) ||
          user["username"].toLowerCase().contains(query);
    }).toList();
  }

  //following toggle
  void toggleFollow(int index) {
    setState(() {
      filteredUsers[index]["isFollowing"] =
          !filteredUsers[index]["isFollowing"];
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: CupertinoSearchTextField(
                controller: _searchController,
                placeholder: "Search",
              ),
            ),
            TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              tabs: [
                Tab(text: "Users"),
                Tab(text: "Posts"),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    itemCount: filteredUsers.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          child: Text(
                              filteredUsers[index]["name"][0].toUpperCase()),
                        ),
                        title: Text(
                          filteredUsers[index]["name"],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "${filteredUsers[index]["username"]}\n${filteredUsers[index]["followers"]} followers"),
                        trailing: TextButton(
                          onPressed: () => toggleFollow(index),
                          style: TextButton.styleFrom(
                            backgroundColor: filteredUsers[index]["isFollowing"]
                                ? Colors.grey[300]
                                : Colors.blue,
                            foregroundColor: filteredUsers[index]["isFollowing"]
                                ? Colors.black
                                : Colors.white,
                          ),
                          child: Text(filteredUsers[index]["isFollowing"]
                              ? "Following"
                              : "Follow"),
                        ),
                        isThreeLine: true,
                      );
                    },
                  ),
                  Center(
                    child: Text("No Posts found"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
