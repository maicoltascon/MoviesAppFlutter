

import 'package:flutter/material.dart';
import 'package:movies/widgets/widgets.dart';

import '../models/models.dart';


class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

     final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;


    return  Scaffold(
      body:  CustomScrollView(
        slivers: [
          _CustomAppBar(movie: movie ),

          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitle(movie: movie),
                _Overview(movie: movie),
             
                CastingCards( id: movie.id),
              ]
            )
          )
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  final Movie movie;


  const _CustomAppBar({required this.movie});
  
  

  @override
  Widget build(BuildContext context) {

    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10),
          color: Colors.black45,
          child:  Text(movie.title, style: const TextStyle(fontSize: 16), textAlign: TextAlign.center,)
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: NetworkImage(movie.fullPosterImg),
          fit: BoxFit.cover
        ),
      ),
    );
  }
}


class _PosterAndTitle extends StatelessWidget {
  final Movie movie;
  const _PosterAndTitle({super.key, required this.movie}); 

  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                height: 150,
              ),
            ),
          ),
          const SizedBox(width: 20,),
          Expanded(
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(movie.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis,),
                Text(movie.originalTitle.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis,),
                Row(
                  children: [
                    const Icon(Icons.star_outline, size: 15, color: Colors.yellow,),
                    const SizedBox(width: 5,),
                    Text(movie.voteAverage.toString(), style: const TextStyle(fontSize: 14),)
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
  const _Overview({super.key, required this.movie});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(movie.overview, textAlign: TextAlign.justify, style: const TextStyle(fontSize: 14),),
    );
  }
}



  