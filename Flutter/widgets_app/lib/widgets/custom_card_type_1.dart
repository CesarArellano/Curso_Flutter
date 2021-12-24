import 'package:flutter/material.dart';

import 'package:widgets_app/theme/app_theme.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        children: <Widget>[
          const ListTile(
            leading: Icon( Icons.photo_album_outlined, color: AppTheme.primaryColor),
            title: Text('Soy un título'),
            subtitle: Text('Exercitation mollit proident et ipsum cillum incididunt exercitation sunt et eu. Qui nisi ad non eu sint nulla. Dolor sit officia esse Lorem velit consequat et voluptate consectetur ex esse enim.'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: (){},
                  child: const Text('Cancel')
                ),
                TextButton(
                  onPressed: (){},
                  child: const Text('Ok')
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}