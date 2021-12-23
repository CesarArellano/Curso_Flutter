import 'package:flutter/material.dart';
  
class ListView2Screen extends StatelessWidget {
  
  const ListView2Screen({Key? key}) : super(key: key);
  final options = const ['Megaman', 'Smash Bros', 'The Legend Of Zelda', 'PayDay2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('ListView Type 2'),
      ),
      body: ListView.separated(
        itemCount: options.length,
        itemBuilder: (_, int i) => ListTile(
          leading: const Icon( Icons.games ),
          title: Text( options[i] ),
          trailing: const Icon( Icons.arrow_forward_ios ),
          onTap: () {},
        ),
        separatorBuilder: ( _ , __ ) => const Divider( height: 1, thickness: 0.8, ),
      ),
    );
  }
}