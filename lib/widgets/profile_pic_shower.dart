import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      child: ClipRRect(
        child: Icon(Icons.account_circle_rounded),
        borderRadius: BorderRadius.circular(50.0),
      ),
      backgroundImage: NetworkImage(
        'https://source.unsplash.com/50x50/?portrait',
      ),
    );
  }
}
