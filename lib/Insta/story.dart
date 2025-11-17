import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  final String username;
  final bool isYourStory;

  const StoryItem({
    Key? key,
    required this.username,
    this.isYourStory = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: isYourStory
                      ? null
                      : const LinearGradient(
                    colors: [
                      Color(0xFFFCAF45),
                      Color(0xFFE1306C),
                      Color(0xFFC13584),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(3),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  child: CircleAvatar(
                    backgroundImage:
                    AssetImage(''),
                  ),
                ),
              ),
              if (isYourStory)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 16),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: 70,
            child: Text(
              username,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}