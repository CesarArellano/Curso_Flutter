import 'package:flutter/material.dart';
import 'package:widgets_app/routes/app_routes.dart';
  
class HomeScreen extends StatelessWidget {
  
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOptions;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets en Flutter'),
      ),
      body: ListView.separated(
        itemBuilder: ( _, int i) {
          final menuOption = menuOptions[i];
          return ListTile(
            leading: Icon( menuOption.icon ),
            title: Text( menuOption.name ),
            onTap: () {
              Navigator.pushNamed(context, menuOption.route );
            },
          );
        },
        separatorBuilder: ( _ , __) => const Divider( height: 0 ),
        itemCount: menuOptions.length
      )
    );
  }
}