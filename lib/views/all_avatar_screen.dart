import 'package:flutter/material.dart';
import 'package:learn_with_ar/views/widgets/avatar_grid.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class AllAvatarScreen extends StatefulWidget {
  @override
  _AllAvatarScreenState createState() => _AllAvatarScreenState();
}

class _AllAvatarScreenState extends State<AllAvatarScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(

      body: Column(
        children: [
          Container(
            height: h * 0.11,
            width: w,
            child: FloatingSearchBar(
              hint: 'Search...',
              scrollPadding: EdgeInsets.only(top: 16, bottom: 56),
              transitionDuration: Duration(milliseconds: 800),
              transitionCurve: Curves.easeInOut,
              physics: BouncingScrollPhysics(),
              axisAlignment: 0.0,
              openAxisAlignment: 0.0,
              maxWidth: 600,
              debounceDelay: Duration(milliseconds: 500),
              onQueryChanged: (query) {
              },
              transition: CircularFloatingSearchBarTransition(),
              actions: [
                FloatingSearchBarAction(
                  showIfOpened: false,
                  child: CircularButton(
                    icon: const Icon(Icons.emoji_objects_outlined),
                    onPressed: () {},
                  ),
                ),
                FloatingSearchBarAction.searchToClear(
                  showIfClosed: false,
                ),
              ],
              builder: (context, transition) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Material(
                    color: Colors.white,
                    elevation: 4.0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: Colors.accents.map((color) {
                        return Container(height: 112, color: color);
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: AvatarGrid(),
          ),
        ],
      ),
    );
  }
}
