
import 'package:aunproject1/Insta/post.dart';
import 'package:aunproject1/Insta/story.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          '',
          height: 40,
          errorBuilder: (context, error, stackTrace) => const Text(
            'Instagram',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Billabong',
              fontSize: 32,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stories Section
            SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return StoryItem(
                    username: index == 0 ? 'Your Story' : 'User $index',
                    isYourStory: index ==  0,
                  );
                },
              ),
            ),
            const Divider(height: 1),

            // Posts
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return PostItem(username: 'user_${index + 1}');
              },
            ),
          ],
        ),
      ),
    );
  }
}