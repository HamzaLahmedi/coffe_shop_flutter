import 'package:flutter/material.dart';

class ProfileInfoSection extends StatelessWidget {
  const ProfileInfoSection({
    super.key,
    this.onTap,
    required this.title,
    required this.value,
  });
  final String title, value;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 18,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: Colors.white.withOpacity(0.8),
          ),
        ],
      ),
    );
  }
}
