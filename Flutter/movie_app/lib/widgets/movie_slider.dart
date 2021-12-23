import 'package:flutter/material.dart';
import 'package:movie_app/models/models.dart';

class MovieSlider extends StatefulWidget {
  final List<Movie> movies;
  final String title;
  final Function onNextPage;

  const MovieSlider({
    Key? key,
    required this.title,
    required this.movies,
    required this.onNextPage,
  }) : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() { 
      if( _scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 500 ) {
        widget.onNextPage();
      }
    });
    
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text( widget.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold) ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: ( _ , int i ) => MoviePoster( movie: widget.movies[i], title: widget.title ),
            ),
          ),
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final Movie movie;
  final String title;

  const MoviePoster({
    Key? key,
    required this.movie,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    movie.heroId = 'movie-slider-$title-${ movie.title }-${ movie.id }';

    return Container(
      margin: const EdgeInsets.symmetric( horizontal: 15 ),
      width: 130,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/images/loading.gif'),
                  image: NetworkImage( movie.fullPosterImg ),
                  fit: BoxFit.cover,
                  width: 130,
                  height: 190,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            movie.title ??= 'Sin título',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}