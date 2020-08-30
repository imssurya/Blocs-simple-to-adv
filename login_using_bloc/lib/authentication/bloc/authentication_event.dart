part of 'authentication_bloc.dart';

import 'package:authentication_repository/authentication_repository.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
  @override
  List<Object> get props => [];
}

class AuthenticationStatusChanged extends AuthenticationEvent {
  const AuthenticationStatusChanged(this.status);
  final AuthenticationStatus status;
  @override 
  List<Object> get props=>[];
}

class AuthenticationLogoutRequested extends AuthenticationEvent{}
