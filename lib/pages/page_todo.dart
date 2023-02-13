import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:node_app/pages/create_todo.dart';
import 'package:node_app/pages/header_todo.dart';
import 'package:node_app/pages/search_and_filter_todo.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40
          ),
          child: Column(
            children: [
              const TodoHeader(),
              const CreateTodo(),
              const SizedBox(height: 20,),
              const SearchAndFilterTodo(),
              const ShowTodo()
      
            ],
          ),
          ),
        ),
      ),
    );
  }
}
