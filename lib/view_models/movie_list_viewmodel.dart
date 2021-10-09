import 'package:flutter/widgets.dart';
import 'package:simple_mvvm_practise/models/movie.dart';

class MovieListViewModel extends ChangeNotifier {
  List<MovieViewModel> movies = [
    MovieViewModel(
        movie: Movie(
            name: "21 Bridges",
            thumbnail:
                "https://tamilrockerss.me.uk/wp-content/uploads/2021/10/b40ApfKDPoJYbWepUs7f09Y3fD-185x278.jpg",
            uploadBy: "Md. Hafijur Rahman"))
  ];

  addNewMovie(Movie movie) {
    movies.add(MovieViewModel(movie: movie));
    notifyListeners();
  }
}

class MovieViewModel {
  final Movie movie;

  String get name => movie.name;
  String get thumbnail => movie.thumbnail;
  String get uploadBy => movie.uploadBy;

  MovieViewModel({
    required this.movie,
  });
}
