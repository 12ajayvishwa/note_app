import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:node_app/bloc/blocs.dart';

import '../models/model_todo.dart';

class SearchAndFilterTodo extends StatelessWidget {
  const SearchAndFilterTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Search todos...',
            border: InputBorder.none,
            filled: true,
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (String? newSerachTerm) {
            if (newSerachTerm != null) {
              context
                  .read<TodoSearchBloc>()
                  .add(setSearchTermEvent(newSearchTerm: newSerachTerm));
            }
          },
        ),
        const SizedBox(height: 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            filterButton(context, Filter.all),
            filterButton(context, Filter.active),
            filterButton(context, Filter.completed),
          ],
        )
      ],
    );
  }

  Widget filterButton(BuildContext context, Filter filter) {
    return TextButton(
        onPressed: () {
          context
              .read<TodoFilterBloc>()
              .add(ChangeFilterEvent(newFilter: filter));
        },
        child: Text(
          filter == Filter.all
              ? 'All'
              : filter == Filter.active
                  ? 'Active'
                  : 'Completed',
          style: TextStyle(fontSize: 18.0, color: textColor(context, filter)),
        ));
  }

  Color textColor(BuildContext context, Filter filter) {
    final currentFilter = context.watch()<TodoFilterBloc>().state.filter;
    return currentFilter == filter ? Colors.blue : Colors.grey;
  }
}
