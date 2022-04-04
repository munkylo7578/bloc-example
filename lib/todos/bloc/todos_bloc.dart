import "dart:html";

import 'package:bloc/bloc.dart';
import 'package:bloc_example_1/models/task.dart';
import 'package:bloc_example_1/services/todo.dart';
import 'package:equatable/equatable.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodoService _todoService;

  TodosBloc(this._todoService) : super(TodosInitial()) {
    on<LoadTodosEvent>((event, emit) {
      final todos = _todoService.getTasks(event.username);
      emit(TodoLoadedState(tasks: todos));
    });
  }
}
