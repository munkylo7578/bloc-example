import 'package:bloc_example_1/services/authentication.dart';
import 'package:bloc_example_1/services/todo.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class LoginPage extends StatelessWidget {
  final usernameField = TextEditingController();
  final passwordField = TextEditingController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
          RepositoryProvider.of<Authentication>(context),
          RepositoryProvider.of<TodoService>(context))
        ..add(RegisteringServicesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeInitial) {
              return SafeArea(
                child: Column(
                  children: [
                    TextField(
                      controller: usernameField,
                      decoration: InputDecoration(labelText: "username"),
                    ),
                    TextField(
                      controller: passwordField,
                      obscureText: true,
                      decoration: InputDecoration(labelText: "password"),
                    ),
                    ElevatedButton(
                        onPressed: () => BlocProvider.of<HomeBloc>(context).add(
                            LoginEvent(
                                username: usernameField.text,
                                password: passwordField.text)),
                        child: Text("Login"))
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
