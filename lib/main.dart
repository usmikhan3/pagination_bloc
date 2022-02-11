import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_bloc/cubit/posts_cubit.dart';
import 'package:pagination_bloc/data/repositories/post_repository.dart';
import 'package:pagination_bloc/data/services/post_services.dart';
import 'package:pagination_bloc/presentation/post_screen.dart';

void main() {
  runApp(MyApp(
    repository: PostsRepository(PostService()),
  ));
}

class MyApp extends StatelessWidget {
  final PostsRepository repository;

  const MyApp({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pagination Bloc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => PostsCubit(repository),
        child: PostScreen(),
      ),
    );
  }
}
