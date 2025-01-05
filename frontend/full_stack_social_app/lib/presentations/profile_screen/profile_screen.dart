import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildProfileHeader(),
          _buildProfileStats(),
          _buildHighlightSection(),
          _buildPhotoGrid(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Replace with actual image URL
          ),
          Expanded(
            child: Column(
              children: [
                Text('Jacob West', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text('Digital goodies designer @pixels', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatColumn('54', 'Posts'),
        _buildStatColumn('834', 'Followers'),
        _buildStatColumn('162', 'Following'),
      ],
    );
  }

  Widget _buildStatColumn(String number, String label) {
    return Column(
      children: [
        Text(number, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildHighlightSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildHighlightButton('New'),
          _buildHighlightButton('Friends'),
          _buildHighlightButton('Sport'),
          _buildHighlightButton('Design'),
        ],
      ),
    );
  }

  Widget _buildHighlightButton(String title) {
    return Column(
      children: [
        CircleAvatar( // Placeholder for story highlight icons
          backgroundColor: Colors.grey[300],
          radius: 30,
        ),
        SizedBox(height: 4),
        Text(title),
      ],
    );
  }

  Widget _buildPhotoGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(), // to disable GridView's scrolling
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: 12, // Adjust the number of items
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://via.placeholder.com/100'), // Replace with actual image URLs
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
