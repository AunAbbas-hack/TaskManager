
import 'package:flutter/material.dart';

class PostItem extends StatefulWidget {
  final String username;

  const PostItem({Key? key, required this.username}) : super(key: key);

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  bool isLiked = false;
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Post Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage:
                AssetImage(' '),
              ),
              const SizedBox(width: 10),
              Text(
                widget.username,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
        ),

        // Post Image
        Container(
          width: double.infinity,
          height: 400,
          color: Colors.grey[300],
          child: Image.  asset(
            ' ',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const Center(
              child: Icon(Icons.image, size: 100, color: Colors.grey),
            ),
          ),
        ),

        // Action Buttons
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.chat_bubble_outline),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.send_outlined),
                onPressed: () {},
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  isSaved ? Icons.bookmark : Icons.bookmark_border,
                  color: Colors.black,

                ),
                onPressed: () {
                  setState(() {
                    isSaved = !isSaved;
                  });
                },
              ),
            ],
          ),
        ),

        // Likes
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '14 likes',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        // Caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: '${widget.username} ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(
                  text:
                  'This is a  caption ',
                ),
              ],
            ),
          ),
        ),

        // View Comments
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text(
            'View all 5 comments',
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
        ),

        // Time
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text(
            '2 hours ago',
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}