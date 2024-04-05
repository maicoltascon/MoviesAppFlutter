import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class CardSwiper extends StatelessWidget {
  
  final List<Movie> movies;

  const CardSwiper({super.key, required this.movies});


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity, 
      height: size.height * 0.5, 
      child: Swiper( 
        itemCount: movies.length,
        itemWidth: size.width * 0.6, 
        itemHeight: size.height * 0.4, 
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context, int index) {

          final movie = movies[index];


          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:  FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.fill
              ),
            ),
          );
        },
      ),
    );
  }
}
