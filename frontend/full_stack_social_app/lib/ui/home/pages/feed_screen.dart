import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stories_for_flutter/stories_for_flutter.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0, right: 10),
              child: Container(
                height: 120, // Fixed height for the stories ListView
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: 100, // Assuming you have 5 story items to display
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stories(
                        storyStatusBarColor: Colors.white,
                        fullpageUnisitedColor: Colors.red,
                        fullpageVisitedColor: Colors.white,
                        storyItemList: [
                          StoryItem(
                            name: "Story $index",
                            thumbnail: NetworkImage(
                                "https://cdn-icons-png.flaticon.com/512/4138/4138124.png"),
                            stories: [
                              Scaffold(
                                
                              backgroundColor: Colors.white,
                                body: Container(
                                    color: Colors.red,
                                  ),
                                ),
                              
                          ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            ListView.builder(
              itemCount: 10, // Number of posts
              primary: false, // Use inside a parent ScrollView
              shrinkWrap: true,
              padding: EdgeInsets
                  .zero, // Necessary for nesting inside SingleChildScrollView
              physics:
                  NeverScrollableScrollPhysics(), // Prevent inner scrolling
              itemBuilder: (context, index) {
                return Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: Image.network(
                              "https://cdn-icons-png.flaticon.com/512/4138/4138124.png"),
                        ),
                        SizedBox(width: 10),
                        Text("Username $index"),
                      ],
                    ),
                  ),
                  Container(
                    height: 400,
                    color: Colors.red,
                  ),
                  SizedBox(height: 8.0),
                  Padding(
                      padding: const EdgeInsets.only(left: 6.0, right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person_3, color: Colors.black),
                              SizedBox(width: 8.0),
                              Text(
                                'Liked by ',
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                'craig_love ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                'and ',
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                '44,686 others',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'joshua_l ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                TextSpan(
                                  text:
                                      'The game in Japan was amazing and I want to share some photos',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          )
                          // Additional content (like, comment icons, etc.)
                        ],
                      ))
                ]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

