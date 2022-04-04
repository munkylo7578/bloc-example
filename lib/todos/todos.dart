import 'package:bloc_example_1/services/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import "bloc/todos_bloc.dart";
import "package:flutter/material.dart";

class TodosPage extends StatelessWidget {
  final String username;



  const TodosPage({Key? key,required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todos Page")),
      body: BlocProvider(
        create: (context) =>
            TodosBloc(RepositoryProvider.of<TodoService>(context))..add(LoadTodosEvent(username: username)),
        child: BlocBuilder<TodosBloc, TodosState>(
          builder: (context, state) {
            if (state is TodoLoadedState) {
              return ListView(
                children: [
                  ...state.tasks
                      .map((e) => ListTile(
                            title: Text(e.task),
                            trailing: Checkbox(
                              value: e.completed,
                              onChanged: (value) {},
                            ),
                          ))
                      .toList()
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
