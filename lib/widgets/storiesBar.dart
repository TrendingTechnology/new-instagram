import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../models/story.dart';

class StoriesBar extends StatefulWidget {
  final List<Story> stories;

  StoriesBar({@required this.stories});
  @override
  _StoriesBarState createState() => _StoriesBarState();
}

class _StoriesBarState extends State<StoriesBar> {
  void _handleStoryPress(BuildContext ctx, List<Story> storiesList) {
    Navigator.of(ctx).pushNamed(
      '/stories',
      arguments: storiesList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () => _handleStoryPress(context, widget.stories),
                child: Container(
                  width: 70,
                  height: 70,
                  padding: const EdgeInsets.all(1.5),
                  margin: const EdgeInsets.all(5),
                  child: Hero(
                    tag: widget.stories[index].url,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        widget.stories[index].user.profileImageUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 200, 50, 50),
                          width: 2),
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.white),
                ),
              ),
              Text(widget.stories[index].user.name),
            ],
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: widget.stories.length,
      ),
    );
  }
}
