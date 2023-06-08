import 'package:cubit_test/models/todo_models.dart';

abstract class TodoState {}

class InitTodoState extends TodoState {}

class LoadingTodoState extends TodoState {}

class ErrorTodoState extends TodoState {
  final String message;
  ErrorTodoState(this.message);
}

class ReponseTodoState extends TodoState {
  List<TodoModel> todos;
  ReponseTodoState(this.todos);
}
