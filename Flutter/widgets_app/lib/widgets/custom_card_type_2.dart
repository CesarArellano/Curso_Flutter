import 'package:flutter/material.dart';
import 'package:widgets_app/theme/app_theme.dart';
  
class CustomCardType2 extends StatelessWidget {
  final String imageUrl;
  final String? titleCard;

  const CustomCardType2({
    Key? key,
    required this.imageUrl,
    this.titleCard
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      margin: EdgeInsets.zero,
      elevation: 5,
      shadowColor: AppTheme.primaryColor.withOpacity(0.2),
      child: Column(
        children: [
          FadeInImage(
            placeholder: const AssetImage('assets/images/jar-loading.gif'),
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
            width: double.infinity,
            height: 230,
          ),

          if( titleCard != null )
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric( horizontal: 15, vertical: 10 ),
              child: Text(titleCard!)
            )
        ],
      )
    );
  }
}