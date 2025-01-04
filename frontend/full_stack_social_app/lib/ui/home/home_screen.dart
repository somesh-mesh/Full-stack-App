import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:full_stack_social_app/ui/acctivity_feed/activity_feed.dart';
import 'package:full_stack_social_app/ui/home/pages/feed_screen.dart';
import 'package:full_stack_social_app/ui/home/pages/search_screen.dart';
import 'package:full_stack_social_app/ui/profile_screen/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    FeedScreen(),
    SearchScreen(),
    ActivityFeed(),
    Text('Messages Page'),
   ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/home.svg', color: _selectedIndex == 0 ? Colors.blue[800] : null),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/search.svg', color: _selectedIndex == 1 ? Colors.blue[800] : null),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/add.svg', color: _selectedIndex == 2 ? Colors.blue[800] : null),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/favt.svg', color: _selectedIndex == 3 ? Colors.blue[800] : null),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/profile.svg', color: _selectedIndex == 4 ? Colors.blue[800] : null),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800], // Using a predefined dark blue shade
        unselectedItemColor: Colors.grey, // Direct use of Colors.grey
        iconSize: 40,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
