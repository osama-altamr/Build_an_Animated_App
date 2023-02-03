import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String name;
  final String profession;
  const InfoCard({
    Key? key,
    required this.name,
    required this.profession,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          CupertinoIcons.person,
          color: Colors.white,
        ),
      ),
      title: Text(
        'Osama Tmr',
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        'Flutter Developer',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
