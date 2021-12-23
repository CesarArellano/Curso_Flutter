import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {

  final options = const ['Megaman', 'Smash Bros', 'The Legend Of Zelda', 'PayDay2'];
  const ListView1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('ListView Type 1'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [

          ...options.map(
            (item) => ListTile(
              leading: const Icon( Icons.games ),
              title: Text( item ),
              trailing: const Icon( Icons.arrow_forward_ios ),
              onTap: () {},
            )
          ),
        ],
      )
    );
  }
}