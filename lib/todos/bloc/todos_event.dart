part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();
}

class LoadTodosEvent extends TodosEvent {
  final String username;

  LoadTodosEvent({required this.username});
  @override
  List<Object> get props => [username];
}
