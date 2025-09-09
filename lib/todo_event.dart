abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final String title;
  final String description;
  final bool isCompleted;

  AddTodoEvent(this.title, this.description, this.isCompleted);
}

class DeleteTodoEvent extends TodoEvent {
  final int index;

  DeleteTodoEvent(this.index);
}

class ToggleTodoEvent extends TodoEvent {
  final int index;

  ToggleTodoEvent(this.index);
}