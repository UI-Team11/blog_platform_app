part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  final UserModel? user;

  const AuthState({this.user});
  @override
  List<Object> get props => [];

}

class AuthInitialState extends AuthState {
  const AuthInitialState();
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState();
}

class AuthSignedInState extends AuthState {
  const AuthSignedInState({required UserModel user}): super(user: user);
}

class AuthErrorState extends AuthState {
  final String? message;

  const AuthErrorState([this.message]);
}