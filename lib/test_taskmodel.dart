import 'package:test/test.dart';
import 'package:to_do/todo_bloc.dart';

void main() {
  test('Todo model initializes with correct values', () {
    final todo = Todo('Test Task', 'Test Description');
    expect(todo.title, 'Test Task');
    expect(todo.description, 'Test Description');
    expect(todo.isCompleted, false);
  });

  test('Todo model toggles isCompleted', () {
    final todo = Todo('Test Task', 'Test Description');
    todo.isCompleted = true;
    expect(todo.isCompleted, true);
  });
}