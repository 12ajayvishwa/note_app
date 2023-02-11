import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:node_app/bloc/active_todo_count/active_todo_count_bloc.dart';

import '../bloc/todo_list/todo_list_bloc.dart';
import '../models/model_todo.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'TODO',
          style: TextStyle(fontSize: 40.0),
        ),
        BlocListener<TodoListBloc,TodoListState>(
          listener:(context, state) {
            final int activeTodoCount = state.todos
            .where((Todo todo) => !todo.completed)
            .toList()
            .length;

            context.read<ActiveTodoCountBloc>()
            .add(CalculateActiveTodoCountEvent(activeTodoCount));
          },
          child: BlocBuilder<ActiveTodoCountBloc, ActiveTodoCountState>(builder: ),
          
          )
      ],
    );
  }
}