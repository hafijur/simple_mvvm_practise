import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_mvvm_practise/models/movie.dart';
import 'package:simple_mvvm_practise/view_models/movie_list_viewmodel.dart';
import 'package:simple_mvvm_practise/widgets/movie_card.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _thumbnailController = TextEditingController();
  final TextEditingController _uploadByController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final movies = context.watch<MovieListViewModel>().movies;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) => MovieCard(movie: movies[index])),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    title: const Text("Movie Add "),
                    actions: [
                      OutlinedButton(
                          onPressed: () {
                            context.read<MovieListViewModel>().addNewMovie(
                                Movie(
                                    name: _nameController.text,
                                    thumbnail: _thumbnailController.text,
                                    uploadBy: _uploadByController.text));
                            setState(() {
                              _nameController.clear();
                              _thumbnailController.clear();
                              _uploadByController.clear();
                            });
                            Navigator.pop(context);
                          },
                          child: const Text("Add")),
                      OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Cancel")),
                    ],
                    content: Column(
                      children: [
                        TextField(
                          controller: _nameController,
                          autofocus: true,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Movie Name'),
                        ),
                        TextField(
                          controller: _thumbnailController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Movie Thumbnail'),
                        ),
                        TextField(
                          controller: _uploadByController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Movie Uploader Name'),
                        )
                      ],
                    ),
                  );
                });
          }),
    );
  }
}
