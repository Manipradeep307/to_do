import 'package:to_do/todo_bloc.dart';

abstract class TodoState {
  final List<Todo> todos;

  TodoState(this.todos);
}

class TodoInitial extends TodoState {
  TodoInitial() : super([]);
}

class TodoUpdated extends TodoState {
  TodoUpdated(List<Todo> todos) : super(todos);
}