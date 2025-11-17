import 'package:flutter/material.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              // Video Placeholder
              Container(
                color: Colors.grey[900],
                child: const Center(
                  child: Icon(
                    Icons.play_circle_outline,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              ),

              // Right Side Actions
              Positioned(
                right: 12,
                bottom: 100,
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.favorite_border,
                          color: Colors.white, size: 32),
                      onPressed: () {},
                    ),
                    const Text('12',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                    const SizedBox(height: 16),
                    IconButton(
                      icon: const Icon(Icons.chat_bubble_outline,
                          color: Colors.white, size: 32),
                      onPressed: () {},
                    ),
                    const Text('234',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                    const SizedBox(height: 16),
                    IconButton(
                      icon: const Icon(Icons.send_outlined,
                          color: Colors.white, size: 32),
                      onPressed: () {},
                    ),
                    const SizedBox(height: 16),
                    IconButton(
                      icon: const Icon(Icons.more_vert,
                          color: Colors.white, size: 32),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              // Bottom Info
              Positioned(
                left: 12,
                bottom: 100,
                right: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage(
                              ' '),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'username',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.white),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                          ),
                          child: const Text(
                            'Follow',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'This is a reel description',
                      style: TextStyle(color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}