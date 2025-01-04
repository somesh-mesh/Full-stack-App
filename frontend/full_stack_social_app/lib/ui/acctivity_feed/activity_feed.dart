import 'package:flutter/material.dart';

class ActivityFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildSectionTitle('New'),
        _buildLikeNotification('karenne', '1h', 'https://example.com/thumbnail.jpg'),
        _buildSectionTitle('Today'),
        _buildFollowNotification('martini_rond', '3d', 'https://example.com/thumbnail.jpg', false),
        // Add more notifications here
      ],
    );
  }
  
Widget _buildLikeNotification(String user, String time, String thumbnailUrl) {
  return ListTile(
    leading: CircleAvatar(
      backgroundImage: NetworkImage(thumbnailUrl),
    ),
    title: Text('$user liked your photo.'),
    subtitle: Text(time),
    trailing: Icon(Icons.more_horiz),
  );
}

Widget _buildFollowNotification(String user, String time, String thumbnailUrl, bool isFollowing) {
  return ListTile(
    leading: CircleAvatar(
      backgroundImage: NetworkImage(thumbnailUrl),
    ),
    title: Text('$user started following you.'),
    subtitle: Text(time),
    trailing: isFollowing ? ElevatedButton(
      onPressed: () {},
      child: Text('Following'),
      //color: Colors.grey[200],
    ) : ElevatedButton(
      onPressed: () {},
      child: Text('Follow'),
      // color: Colors.blue,
      // textColor: Colors.white,
    ),
  );
}

 
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

