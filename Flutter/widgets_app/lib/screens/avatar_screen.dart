import 'package:flutter/material.dart';


class AvatarScreen extends StatelessWidget {

  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stan Lee'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: const Text('SL'),
              backgroundColor: Colors.indigo.shade800,
            ),
          )
        ],
      ),
      body: Center(
        child: CircleAvatar(
          maxRadius: 120,
          backgroundImage: const NetworkImage('https://www.cinemascomics.com/wp-content/uploads/2021/06/stan-lee-calle-nueva-york.jpg'),
          backgroundColor: Colors.indigo.shade800,
        ),
      ),
    );
  }
}