import 'package:flutter/material.dart';
import 'package:node_app/pages/create_todo.dart';
import 'package:node_app/pages/header_todo.dart';
import 'package:node_app/pages/search_and_filter_todo.dart';

import 'show_todos.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: const [
                TodoHeader(),
                CreateTodo(),
                SizedBox(
                  height: 20,
                ),
                SearchAndFilterTodo(),
                ShowTodo()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
