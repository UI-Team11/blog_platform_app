part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];

}

class AuthInitialState extends AuthState {
  const AuthInitialState();
}

class AuthAdminState extends AuthState {
  const AuthAdminState();
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState();
}

class AuthSignedInState extends AuthState {
  const AuthSignedInState();
}

class AuthErrorState extends AuthState {
  final String? message;

  const AuthErrorState([this.message]);
}