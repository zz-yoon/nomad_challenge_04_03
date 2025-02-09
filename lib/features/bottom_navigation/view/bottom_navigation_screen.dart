import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomad_challenge_04_03/features/home/view/home_screen.dart';
import 'package:nomad_challenge_04_03/features/like/view/like_screen.dart';
import 'package:nomad_challenge_04_03/features/profile/view/profile_screen.dart';
import 'package:nomad_challenge_04_03/features/search/view/search_screen.dart';
import 'package:nomad_challenge_04_03/features/write/view/write_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    SearchScreen(),
    WriteScreen(),
    LikeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ...List.generate(
              _screens.length,
              (index) {
                return Offstage(
                    offstage: _currentIndex != index,
                    child: TickerMode(
                      enabled: _currentIndex == index,
                      child: _screens[index],
                    ));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.house), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.searchengin), label: "search"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.squarePlus), label: "write"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.heart), label: "like"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.user), label: "profile"),
          ],
        ),
      ),
    );
  }
}
