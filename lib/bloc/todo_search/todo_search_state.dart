part of 'todo_search_bloc.dart';

abstract class TodoSearchState extends Equatable {
  const TodoSearchState();
  
  @override
  List<Object> get props => [];
}

class TodoSearchInitial extends TodoSearchState {}
