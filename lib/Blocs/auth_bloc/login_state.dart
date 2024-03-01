import 'package:schoolapp/mainpage.dart';

abstract class AuthenticationState {}

class AuthenticationInitialState extends AuthenticationState {}

class AuthenticationAuthenticatedState extends AuthenticationState {
  final CurrentPage currentPage;
  AuthenticationAuthenticatedState({
    required this.currentPage,

  });
}

class AuthenticationUnauthenticatedState extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}