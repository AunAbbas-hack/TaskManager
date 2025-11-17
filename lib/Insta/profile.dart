import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            Text(
              'username',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.keyboard_arrow_down, color: Colors.black),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage:
                    AssetImage("")
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatColumn('12', 'Posts'),
                        _buildStatColumn('350', 'Followers'),
                        _buildStatColumn('250', 'Following'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Aun Abbas',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text('Bio '),
                  Text(
                    'www.abe.com',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                      ),
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                      ),
                      child: const Text(
                        'Share Profile',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: IconButton(
                    icon: const Icon(Icons.grid_on),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: const Icon(Icons.video_library_outlined),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: const Icon(Icons.person_pin_outlined),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const Divider(height: 1),
            GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(2),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: 30,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey[300],
                  child: Image.asset(
                    '',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Center(
                      child: Icon(Icons.image, color: Colors.grey),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String numbers, String label) {
    return Column(
      children: [
        Text(
          numbers,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}