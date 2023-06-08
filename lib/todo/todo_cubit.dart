import 'package:cubit_test/resonsive/todo_responsive.dart';
import 'package:cubit_test/todo/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoResponsive _responsive;
  TodoCubit(this._responsive) : super(InitTodoState());

  Future<void> fetchTodo() async {
    emit(LoadingTodoState());
    try {
      final reponse = await _responsive.getAll();
      emit(ReponseTodoState(reponse));
    } catch (e) {
      emit(ErrorTodoState(e.toString()));
    }
  }
}
