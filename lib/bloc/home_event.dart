part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoginEvent extends HomeEvent {
  final String username;
  final String password;

  LoginEvent({required this.username, required this.password});
  @override
  List<Object> get props => [username, password];
}

class RegisteringServicesEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}
