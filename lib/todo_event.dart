abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final String title;
  final String description;

  AddTodoEvent(this.title, this.description);
}

class DeleteTodoEvent extends TodoEvent {
  final int index;

  DeleteTodoEvent(this.index);
}

class ToggleTodoEvent extends TodoEvent {
  final int index;

  ToggleTodoEvent(this.index);
}