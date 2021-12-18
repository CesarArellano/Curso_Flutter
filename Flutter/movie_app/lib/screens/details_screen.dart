import 'package:flutter/material.dart';
import 'package:movie_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'No movie';
    debugPrint(movie);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie: movie),
          SliverList(
            delegate: SliverChildListDelegate([
              const _PosterAndTitle(),
              const _Overview(),
              const _Overview(),
              const _Overview(),
              const _Overview(),
              const CastingCards(),
            ])
          ),
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final String movie;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          padding: const EdgeInsets.only(bottom: 16),
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: Text(
            movie,
            style: const TextStyle(fontSize: 18)
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/images/loading.gif'),
          image: AssetImage('assets/images/loading.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  const _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only( top: 20 ),
      padding: const EdgeInsets.symmetric( horizontal: 20 ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const FadeInImage(
              width: 100,
              height: 150,
              placeholder: AssetImage('assets/images/loading.gif'),
              image: AssetImage('assets/images/loading.gif'),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Movie Title',
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'Movie Original Title',
                style: textTheme.subtitle2,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow),
                  const SizedBox(width: 5),
                  Text('Promedio votos', style: textTheme.caption,)
                ],
              )

            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.only( top: 20, right: 20, left: 20 ),
      child: Text(
        'Dolor est pariatur amet exercitation aute. Magna nisi enim non in sit voluptate mollit incididunt eu proident laboris proident anim. Quis labore Lorem et proident deserunt.',
        style: textTheme.subtitle1,
        textAlign: TextAlign.justify,
      ),
    );
  }
}