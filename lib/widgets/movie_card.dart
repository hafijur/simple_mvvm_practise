import 'package:flutter/material.dart';
import 'package:simple_mvvm_practise/view_models/movie_list_viewmodel.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key, required this.movie}) : super(key: key);

  final MovieViewModel movie;

  _image() {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Image.network(
          movie.thumbnail,
          errorBuilder: (context, image, e) => Image.network(defaultImage),
        ),
      ),
    );
  }

  _movieMetas() {
    return Row(
      children: [
        Text("Name - " + movie.name),
        const SizedBox(width: 15),
        Text("Uploaded By - " + movie.uploadBy)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [_image(), _movieMetas()],
      ),
    );
  }
}
