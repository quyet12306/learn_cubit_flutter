import 'package:cubit_test/todo/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../todo/todo_state.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<TodoCubit>();
      cubit.fetchTodo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo page"),
        centerTitle: true,
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          print("state = ${state.toString()}");
          if (state is InitTodoState || state is LoadingTodoState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ReponseTodoState) {
            final todos = state.todos;
            return ListView.builder(itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                title: Text(todo.title ?? ""),
              );
            });
          } else if (state is ErrorTodoState) {
            print("mes = ${state.message}");
            return Center(child: Text(state.message));
          }

          return Center(
              child: Text(
            state.toString(),
            style: TextStyle(color: Colors.red),
          ));
        },
      ),
    );
  }
}
