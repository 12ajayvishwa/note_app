part of 'todo_list_bloc.dart';

abstract class TodoListState extends Equatable {
  
  const TodoListState();
  
  @override
  List<Object> get props => [];
}

class TodoListInitial extends TodoListState {}
