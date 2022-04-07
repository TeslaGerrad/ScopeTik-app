part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState({
    this.status = FormzStatus.pure,
    this.email = 
  });
  
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}
