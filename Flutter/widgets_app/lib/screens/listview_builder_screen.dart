import 'package:flutter/material.dart';


class ListViewBuilderScreen extends StatelessWidget {

  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        removeTop: true,
        removeBottom: true,
        context: context,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: ( _, int i) => FadeInImage(
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
            placeholder: const AssetImage('assets/images/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/500/300?images=${ i + 1}')
          )
        ),
      )
    );
  }
}