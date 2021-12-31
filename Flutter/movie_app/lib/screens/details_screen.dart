import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:movie_app/models/models.dart';
import 'package:movie_app/models/movie_full_response.dart';
import 'package:movie_app/providers/movies_provider.dart';
import 'package:movie_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;
    
    return Scaffold(
      body: Scrollbar(
        radius: const Radius.circular(100),
        thickness: 6,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            _CustomAppBar(movie: movie),
            SliverList(
              delegate: SliverChildListDelegate([
                _PosterAndTitle( movie: movie ),
                _Overview( movie: movie ),
                _MoreDetails( movieId: movie.id ),
                CastingCards( movieId: movie.id ),
                const SizedBox(height: 25),
              ])
            ),
          ],
        ),
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    
    final titleMovie = ( movie.title!.length > 30 ) ? movie.title!.substring(0, 30) + '...' : movie.title;
    
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          padding: const EdgeInsets.only(bottom: 16, left: 5, right: 5),
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black.withOpacity(0.15),
          child: Text(
            titleMovie ?? 'No title',
            style: const TextStyle(fontSize: 18),
            maxLines: 1,
            overflow: TextOverflow.ellipsis
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/images/loading.gif'),
          image: NetworkImage( movie.fullBackdropImg ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const _PosterAndTitle({
    Key? key,
    required this.movie
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    const TextStyle chipTextStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

    return Container(
      margin: const EdgeInsets.only( top: 20 ),
      padding: const EdgeInsets.symmetric( horizontal: 20 ),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                width: 100,
                height: 150,
                placeholder: const AssetImage('assets/images/loading.gif'),
                image: NetworkImage( movie.fullPosterImg ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title ?? 'No title',
                  style: textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 4),
                Text(
                  movie.originalTitle,
                  style: textTheme.subtitle2,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Chip(
                      backgroundColor: Colors.black,
                      label: Row(
                        children: [
                          const Icon(Icons.star, color: Colors.yellow),
                          const SizedBox(width: 5),
                          Text('${ movie.voteAverage }', style: chipTextStyle ),
                        ]
                      ),
                    ),
                    const SizedBox(width: 10),
                    if( movie.adult )
                      const Chip(
                        backgroundColor: Colors.red,
                        label: Text('+18', style: chipTextStyle )
                      )
                  ],
                )
          
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final Movie movie;

  const _Overview({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.only( top: 20, right: 20, left: 20 ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Historia', style: TextStyle( fontSize: 22, fontWeight: FontWeight.bold) ),
          const SizedBox(height: 5),
          Text(
            movie.overview,
            style: textTheme.subtitle1,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class _MoreDetails extends StatelessWidget {
  final int movieId;
  

  const _MoreDetails({
    Key? key,
    required this.movieId
  }) : super(key: key);@override

  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final movieProvider = Provider.of<MoviesProvider>(context);
    final numberFormater = NumberFormat("\$#,##0.00 USD", "en_US");

    return FutureBuilder(
      future: movieProvider.getMovieDetails(movieId),
      builder: ( _, AsyncSnapshot<MovieFullResponse> snapshot ) {
        if( !snapshot.hasData ) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: const Center( 
              child:  CircularProgressIndicator.adaptive( backgroundColor: Colors.redAccent )
            ),
          );
        }

        final movieDetails = snapshot.data;
        final releaseDate = movieDetails!.releaseDate ?? DateTime.now();
        final budget = numberFormater.format( movieDetails.budget );
        final revenue = numberFormater.format( movieDetails.revenue );

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text('Detalles', style: TextStyle( fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Género(s): ', style: textTheme.subtitle2),
                  ...movieDetails.genres!.map((genre) => Text('${ genre.name! } ', style: textTheme.subtitle2))
                ],
              ),
              const SizedBox(height: 5),
              Text('Fecha de lanzamiento: ${ releaseDate.day }-${ releaseDate.month }-${ releaseDate.year }', style: textTheme.subtitle2),
              const SizedBox(height: 5),
              Text('Duración: ${ durationToString(movieDetails.runtime!) }h', style: textTheme.subtitle2),
              const SizedBox(height: 5),
              Text('Presupuesto: $budget', style: textTheme.subtitle2),
              const SizedBox(height: 5),
              Text('Ingresos: $revenue', style: textTheme.subtitle2),
              const SizedBox(height: 10),
              const Text('Actores', style: TextStyle( fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
            ],
          ),
        );
      }
    );
  }

  String durationToString(int minutes) {
    var d = Duration(minutes:minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
  }
}