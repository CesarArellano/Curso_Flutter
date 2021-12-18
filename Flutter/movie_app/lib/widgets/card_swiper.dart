import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.only(top: 20),
      height: size.height * 0.5,
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.8,
        itemCount: 3,
        itemBuilder: ( _ , int index) {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const FadeInImage(
                  placeholder: AssetImage('assets/images/loading.gif'),
                  image: NetworkImage('https://via.placeholder.com/300x400'),
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-instance'),
              ),
            ]
          );
        },
      )
    );
  }
}