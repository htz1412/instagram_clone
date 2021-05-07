import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../data.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: SafeArea(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  cursorColor: Colors.grey[700],
                  cursorWidth: 1.5,
                  maxLines: 1,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.3),
                    ),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      size: 26,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              padding: EdgeInsets.zero,
              crossAxisCount: 3,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              scrollDirection: Axis.vertical,
              itemBuilder: (ctx, index) {
                return ClipRRect(
                  child: Image.network(
                    postsData[index].postUrl,
                    fit: BoxFit.cover,
                  ),
                );
              },
              itemCount: postsData.length,
              staggeredTileBuilder: (index) => StaggeredTile.count(
                index % 9 == 0
                    ? index == 0
                        ? 1
                        : 2
                    : index == 1
                        ? 2
                        : 1,
                index % 9 == 0
                    ? index == 0
                        ? 1
                        : 2
                    : index == 1
                        ? 2
                        : 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
