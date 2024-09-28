import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginRequested extends AuthEvent {
  final String userId;
  final String password;

  LoginRequested(this.userId, this.password);

  @override
  List<Object> get props => [userId, password];
}

class LogoutRequested extends AuthEvent {}
