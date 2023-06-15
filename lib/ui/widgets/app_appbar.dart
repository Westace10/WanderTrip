import 'package:flutter/material.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String location;
  final String profilePicture;

  const AppAppBar({
    super.key,
    required this.userName,
    required this.location,
    required this.profilePicture,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, $userName',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                location,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Expanded(
              child: Container()), // Empty container to occupy remaining space
          CircleAvatar(
            backgroundImage: NetworkImage(profilePicture),
            radius: 20,
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.location_on),
          onPressed: () {
            // Handle location button press
          },
        ),
      ],
    );
  }
}
