part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  final bool success;

  HomeInitial({this.success = false});

  @override
  List<Object> get props => [success];
}

class SuccessfulLoginState extends HomeState {
  final String username;

  SuccessfulLoginState(this.username);

  @override
  List<Object> get props => [username];
}

class RegisteringServicesState extends HomeState {
  @override
  List<Object> get props => [];
}
