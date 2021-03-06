import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:new_instagram/models/user.dart';

import '../dummyData.dart';
import '../widgets/postItemFooter.dart';
import '../models/post.dart';

class PostItemDetails extends StatelessWidget {
  final Post post;
  final List<User> users = DUMMY_USERS;

  PostItemDetails({
    @required this.post,
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Card(
        margin: EdgeInsets.only(left: 0, right: 0, bottom: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(post.image),
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          users.firstWhere((user) => user.id == post.userId).profileImageUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        users.firstWhere((user) => user.id == post.userId).name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                PostItemFooter(post: post, showDescription: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
