import 'package:flutter/material.dart';
import 'package:personal_profile/week_3/utils/app_colors.dart';
import 'package:personal_profile/week_3/utils/typography.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
        automaticallyImplyLeading: false,
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: AppColors.secondary,
              radius: 30.0,
              child: const Icon(Icons.person),
            ),
          ),
          SizedBox(height: 10.0),
          ...List.generate(_profileTile.length, (index) {
            final leading = _profileTile[index]['leading'];
            final content = _profileTile[index]['content'];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
              child: Row(
                children: [
                  Text(leading, style: AppTextStyles.body),
                  SizedBox(width: 10.0),
                  Text(content),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

List<Map> _profileTile = [
  {'leading': 'Name:', 'content': 'Ayodele Gabriel'},
  {'leading': 'Email:', 'content': 'gabemandev@gmail.com'},
  {'leading': 'Phone Number:', 'content': '+2347060974828'},
];
