import 'package:cubit_test/resonsive/todo_responsive.dart';
import 'package:cubit_test/todo/todo_cubit.dart';
import 'package:cubit_test/view/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(
        TodoResponsive(),
      ),
      child: MaterialApp(
        home: TodoPage(),
      ),
    );
  }
}
