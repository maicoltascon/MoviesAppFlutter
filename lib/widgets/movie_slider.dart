
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies/models/models.dart';

class MovieSlider extends StatelessWidget {

    final List<Movie> movies;
    final String title;
  const MovieSlider({super.key, required this.movies, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
          Expanded(
            child:  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _MoviePoster(movie: movies[index]);
                      },
            ),
          ),
        ],
      ),
    ) ;
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;
  
  const _MoviePoster({super.key, required this.movie});

 

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 130,
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:  FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                height: 170,
                width: 130,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 5,),
          Text(movie.name, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,),
        ],
      ),

    );
  }
}


