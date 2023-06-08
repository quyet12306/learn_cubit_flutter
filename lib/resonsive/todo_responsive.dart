import 'dart:convert';

import 'package:cubit_test/models/todo_models.dart';
import 'package:http/http.dart' as http;

class TodoResponsive {
  Future<List<TodoModel>> getAll() async {
    const url = "https://jsonplaceholder.typicode.com/todos";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final result = json.map((e) {
        return TodoModel(
            id: e["id"],
            userid: e["userId"],
            title: e["title"],
            completed: e["completed"]);
      }).toList();
      return result;
    } else {
      throw "Somethinh went wrong ${response.statusCode}";
    }
  }
}
