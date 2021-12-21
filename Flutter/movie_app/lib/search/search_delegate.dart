import 'package:flutter/material.dart';
import 'package:movie_app/models/models.dart';
import 'package:movie_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {

  @override
  String get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '', 
        icon: const Icon(Icons.clear),
        splashRadius: 22,
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null), 
      icon: const Icon( Icons.arrow_back ),
      splashRadius: 22,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('Resultados');
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    if( query.isEmpty ) {
      return _emptyContainer();
    }
    final movieProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: movieProvider.searchMovies(query),
      builder: ( _, AsyncSnapshot<List<Movie>> asyncSnapshot) {
        if( !asyncSnapshot.hasData) {
          return _emptyContainer();
        }
        final movies = asyncSnapshot.data;
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: movies!.length,
          itemBuilder: (_, int i) => _MovieItem( movie: movies[i], )
        );
      }
    );
  }

  Widget _emptyContainer() {
    return const Center(
      child: Icon(
        Icons.movie_outlined,
        size: 130,
        color: Colors.black26,
      )
    );
  }
  
}

class _MovieItem extends StatelessWidget {
  final Movie movie;

  const _MovieItem({
    Key? key,
    required this.movie
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    movie.heroId = 'search-movie-${ movie.title }-${ movie.id }';

    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: FadeInImage(
          placeholder: const AssetImage('assets/images/loading.gif'), 
          image: NetworkImage( movie.fullPosterImg ),
          width: 80,
          fit: BoxFit.cover
        ),
      ),
      title: Text(movie.title!),
      subtitle: Text(movie.originalTitle),
      onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
    );
  }
}