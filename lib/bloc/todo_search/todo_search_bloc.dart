import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_search_event.dart';
part 'todo_search_state.dart';

class TodoSearchBloc extends Bloc<TodoSearchEvent, TodoSearchState> {
  TodoSearchBloc() : super(TodoSearchInitial()) {
    on<TodoSearchEvent>((event, emit) {
  
    });
  }
}
