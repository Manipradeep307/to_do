import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_page.dart';
import 'todo_bloc.dart';

void main() {
  final bloc = TodoBloc();
  runApp(MyApp(bloc: bloc));
}

class MyApp extends StatelessWidget {
  final TodoBloc bloc;

  const MyApp({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}