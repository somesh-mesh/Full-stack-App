import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryButton(text: "IGTV", icon: Icons.tv),
                    CategoryButton(text: "Shop", icon: Icons.shop),
                    CategoryButton(text: "Style", icon: Icons.style),
                    CategoryButton(text: "Sports", icon: Icons.sports_baseball),
                    CategoryButton(text: "Auto", icon: Icons.directions_car),
                  ],
                ),
              ),
              Padding(
            padding: const EdgeInsets.all(8.0),
            child: StaggeredGrid.count(
              crossAxisCount: 4, // Adjust the number of columns in the grid
              mainAxisSpacing: 4, // Vertical spacing between tiles
              crossAxisSpacing: 4, // Horizontal spacing between tiles
              children: List.generate(100, (index) { // Generate 8 items
                return StaggeredGridTile.count(
                  crossAxisCellCount: 2, // Number of columns the tile will span
                  mainAxisCellCount: index % 3 == 0 ? 2 : 1, // Varying the row span
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Item $index',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
               
            ],
          ),
        ),
      );
  }
}

class CategoryButton extends StatelessWidget {
  final String text;
  final IconData icon;

  const CategoryButton({Key? key, required this.text, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton.icon(
        icon: Icon(icon, size: 18),
        label: Text(text),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black, backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          textStyle: TextStyle(color: Colors.black),
          elevation: 0,
        ),
      ),
    );
  }
}




