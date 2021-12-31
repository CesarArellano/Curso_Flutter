
import 'package:flutter/material.dart';
import 'package:movie_app/models/models.dart';
import 'package:movie_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int movieId;

  const CastingCards({
    Key? key,
    required this.movieId
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MoviesProvider>(context);
    return FutureBuilder(
      future: movieProvider.getMovieCast(movieId),
      builder: ( _, AsyncSnapshot<List<Cast>> snapshot ) {
        if( !snapshot.hasData ) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: const Center( 
              child:  CircularProgressIndicator.adaptive( backgroundColor: Colors.redAccent )
            ),
          );
        }

        final cast = snapshot.data;

        return SizedBox(
          width: double.infinity,
          height: 230,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: cast!.length,
            itemBuilder: ( _ , int i ) {
              return Row(
                children: [
                  if( i == 0) const SizedBox(width: 10),
                  _CastCard( actor: cast[i] ),
                  if( i == cast.length - 1 ) const SizedBox(width: 10),
                ],
              );
            }
          ),
        );
        
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  final Cast actor;

  const _CastCard({ 
    Key? key,
    required this.actor 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric( horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            blurRadius: 6,
            color: Colors.black12
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: FadeInImage(
              placeholder: const AssetImage('assets/images/loading.gif'),
              image: NetworkImage( actor.fullProfileImage ),
              fit: BoxFit.cover,
              width: double.infinity,
              height: 170,
            ),
          ),
          const SizedBox(height: 8),
          Flexible(
            child: Text( 
              actor.name!,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}