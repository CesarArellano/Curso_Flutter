import 'package:flutter/material.dart';
  
class HomeScreen extends StatelessWidget {
  
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets en Flutter')
      ),
      body: ListView.separated(
        itemBuilder: ( _, int i) => ListTile(
          leading: const Icon( Icons.access_time_outlined),
          title: const Text('Home'),
          onTap: () {
            Navigator.pushNamed(context, 'card');
          },
        ),
        separatorBuilder: ( _ , __) => const Divider( height: 0 ),
        itemCount: 10
      )
    );
  }
}