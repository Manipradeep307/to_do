import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/home_page.dart';
import 'package:to_do/todo_bloc.dart';
import 'package:to_do/todo_event.dart';

void main() {
  testWidgets('Task list displays correctly', (WidgetTester tester) async {
    final bloc = TodoBloc();
    bloc.add(AddTodoEvent('Task 1', 'Desc 1', false));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: bloc,
          child: HomePage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Task 1'), findsOneWidget);
    expect(find.text('Desc 1'), findsOneWidget);
    expect(find.text('Incomplete'), findsOneWidget);
  });
}