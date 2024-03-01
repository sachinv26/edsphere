import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolapp/Blocs/auth_bloc/login_event.dart';
import 'package:schoolapp/Blocs/auth_bloc/login_state.dart';
import 'package:schoolapp/mainpage.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<AuthenticationSuccessEvent>((event, emit) {
      // Handle AuthenticationSuccessEvent here
      // You should yield a new state, for example, AuthenticationAuthenticatedState
      emit(AuthenticationAuthenticatedState(currentPage: CurrentPage.home));
    });

    on<AuthenticationFailedEvent>((event, emit) {
      // Handle AuthenticationFailedEvent here
      emit(AuthenticationUnauthenticatedState());
    });
  }

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    // Additional logic can go here if needed
  }
}