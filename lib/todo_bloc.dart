import 'package:bloc/bloc.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class Todo {
  final String title;
  final String description;
  bool isCompleted;

  Todo(this.title, this.description, {this.isCompleted = false});
}

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<AddTodoEvent>((event, emit) {
      final newTodos = List.of(state.todos)..add(Todo(event.title, event.description, isCompleted: event.isCompleted));
      emit(TodoUpdated(newTodos));
    });

    on<DeleteTodoEvent>((event, emit) {
      final newTodos = List.of(state.todos)..removeAt(event.index);
      emit(TodoUpdated(newTodos));
    });

    on<ToggleTodoEvent>((event, emit) {
      final newTodos = List.of(state.todos);
      newTodos[event.index].isCompleted = !newTodos[event.index].isCompleted;
      emit(TodoUpdated(newTodos));
    });
  }
}